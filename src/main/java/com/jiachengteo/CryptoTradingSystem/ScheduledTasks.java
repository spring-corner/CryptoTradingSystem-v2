package com.jiachengteo.CryptoTradingSystem;

import com.jiachengteo.CryptoTradingSystem.dto.BinanceTickerDTO;
import com.jiachengteo.CryptoTradingSystem.dto.HuobiTickerDTO;
import com.jiachengteo.CryptoTradingSystem.entity.CryptoPrice;
import com.jiachengteo.CryptoTradingSystem.repository.CryptoPriceRepository;
import com.jiachengteo.CryptoTradingSystem.service.BinancePriceService;
import com.jiachengteo.CryptoTradingSystem.service.HuobiPriceService;
import jakarta.annotation.PostConstruct;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;
import org.springframework.web.client.RestClientException;
import org.springframework.web.client.RestTemplate;

import java.math.BigDecimal;
import java.time.Instant;
import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

@Component
public class ScheduledTasks {
	private static final Logger log = LoggerFactory.getLogger(ScheduledTasks.class);

	private final RestTemplate restTemplate = new RestTemplate();

	@Autowired
	private CryptoPriceRepository cryptoPriceRepository;

	@Autowired
	private BinancePriceService binancePriceService;

	@Autowired
	private HuobiPriceService huobiPriceService;

    // Inject supported pairs from application.properties
    @Value("${trading.supportedPairs}")
    private String supportedPairsProperty;
    private List<String> trackedPairs;

    @PostConstruct
    public void init() {
        // Parse and store as uppercase for consistency
        trackedPairs = Arrays.stream(supportedPairsProperty.split(","))
                .map(String::toUpperCase)
                .collect(Collectors.toList());
    }

	@Scheduled(fixedRate = 10000) // 10 seconds
	public void consumeRestService() {
		try {
            List<BinanceTickerDTO> binancePrices = binancePriceService.fetchCryptoPrices(trackedPairs);
            List<HuobiTickerDTO> huobiPrices = huobiPriceService.fetchCryptoPrices(trackedPairs);

            // Process pairs
            trackedPairs.forEach(trackedPair -> processPair(trackedPair, binancePrices, huobiPrices));
		} catch (RestClientException e) {
			log.error("Error fetching price data: {}", e.getMessage());
		}
	}

	private void processPair(String symbol, List<BinanceTickerDTO> binancePrices, List<HuobiTickerDTO> huobiPrices) {
		// Find prices for the symbol from both exchanges
		BinanceTickerDTO binancePrice = findBinancePrice(binancePrices, symbol);
		HuobiTickerDTO huobiPrice = findHuobiPrice(huobiPrices, symbol);

		if (binancePrice != null && huobiPrice != null) {
			// Convert prices to BigDecimal for comparison
			BigDecimal binanceBid = new BigDecimal(binancePrice.getBidPrice());
			BigDecimal binanceAsk = new BigDecimal(binancePrice.getAskPrice());
			BigDecimal huobiBid = huobiPrice.getBid();
			BigDecimal huobiAsk = huobiPrice.getAsk();

			// Select best prices (highest bid for selling, lowest ask for buying)
			BigDecimal bestBid = binanceBid.compareTo(huobiBid) > 0 ? binanceBid : huobiBid;
			BigDecimal bestAsk = binanceAsk.compareTo(huobiAsk) < 0 ? binanceAsk : huobiAsk;

			// Create and save entity with best prices
			CryptoPrice cryptoPrice = new CryptoPrice();
			cryptoPrice.setSymbol(symbol);
			cryptoPrice.setBidPrice(bestBid);  // Best SELL price
			cryptoPrice.setAskPrice(bestAsk);  // Best BUY price
			cryptoPrice.setBidSize(binanceBid.compareTo(huobiBid) > 0 ?
				new BigDecimal(binancePrice.getBidQty()) : huobiPrice.getBidSize());
			cryptoPrice.setAskSize(binanceAsk.compareTo(huobiAsk) < 0 ?
				new BigDecimal(binancePrice.getAskQty()) : huobiPrice.getAskSize());
			cryptoPrice.setTimestamp(Instant.now());

			cryptoPriceRepository.save(cryptoPrice);

			log.info("Saved aggregated price for {}: Best Bid (SELL)={} from {}, Best Ask (BUY)={} from {}",
				symbol,
				bestBid, (binanceBid.compareTo(huobiBid) > 0 ? "Binance" : "Huobi"),
				bestAsk, (binanceAsk.compareTo(huobiAsk) < 0 ? "Binance" : "Huobi")
			);
		}
	}

	private BinanceTickerDTO findBinancePrice(List<BinanceTickerDTO> prices, String symbol) {
		return prices.stream()
			.filter(p -> p.getSymbol().equalsIgnoreCase(symbol))
			.findFirst()
			.orElse(null);
	}

	private HuobiTickerDTO findHuobiPrice(List<HuobiTickerDTO> prices, String symbol) {
		return prices.stream()
			.filter(p -> p.getSymbol().equalsIgnoreCase(symbol))
			.findFirst()
			.orElse(null);
	}
}