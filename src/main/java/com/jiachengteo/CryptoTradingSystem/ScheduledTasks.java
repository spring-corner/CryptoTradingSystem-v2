package com.jiachengteo.CryptoTradingSystem;

import com.jiachengteo.CryptoTradingSystem.dto.BinanceTickerDTO;
import com.jiachengteo.CryptoTradingSystem.dto.HuobiTickerDTO;
import com.jiachengteo.CryptoTradingSystem.entity.CryptoPrice;
import com.jiachengteo.CryptoTradingSystem.repository.CryptoPriceRepository;
import com.jiachengteo.CryptoTradingSystem.service.BinancePriceService;
import com.jiachengteo.CryptoTradingSystem.service.HuobiPriceService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;
import org.springframework.web.client.RestClientException;
import org.springframework.web.client.RestTemplate;

import java.math.BigDecimal;
import java.time.Instant;
import java.util.List;

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

	@Scheduled(fixedRate = 10000) // 10 seconds
	public void consumeRestService() {

		// CryptoPrice quote = restTemplate.getForObject(
		// 	"https://api.binance.com/api/v3/ticker/bookTicker?symbol=BTCUSDT", CryptoPrice.class);
		// assert quote != null;
		// log.info(quote.toString());

		try {// First get the response as DTO
			BinanceTickerDTO tickerDTO = restTemplate.getForObject("https://api.binance.com/api/v3/ticker/bookTicker?symbol=BTCUSDT", BinanceTickerDTO.class);

			List<BinanceTickerDTO> binancePrices = binancePriceService.fetchCryptoPrices();
			List<HuobiTickerDTO> huobiPrices = huobiPriceService.fetchCryptoPrices();

			// Process BTC and ETH pairs
			processPair("BTCUSDT", binancePrices, huobiPrices);
			processPair("ETHUSDT", binancePrices, huobiPrices);

			// List<HuobiTickerDTO> huobiTickerDTO = new HuobiPriceService().fetchCryptoPrices();
			// HuobiTickerDTO btcUSDT = huobiTickerDTO.stream()
			// 	.filter(ticker -> "btcusdt".equalsIgnoreCase(ticker.getSymbol()))
			// 	.findFirst()
			// 	.orElse(null);
			// assert btcUSDT != null;
			// log.info(btcUSDT.getSymbol());
			// log.info(btcUSDT.getBid().toString());
			// log.info(btcUSDT.getAsk().toString());
			//
			//
			// if (tickerDTO != null) {
			// 	// Map DTO to Entity
			// 	CryptoPrice cryptoPrice = new CryptoPrice();
			// 	cryptoPrice.setSymbol(tickerDTO.getSymbol());
			// 	cryptoPrice.setBidPrice(new BigDecimal(tickerDTO.getBidPrice()));
			// 	cryptoPrice.setAskPrice(new BigDecimal(tickerDTO.getAskPrice()));
			// 	cryptoPrice.setBidSize(new BigDecimal(tickerDTO.getBidQty()));
			// 	cryptoPrice.setAskSize(new BigDecimal(tickerDTO.getAskQty()));
			// 	cryptoPrice.setTimestamp(Instant.now());
			//
			// 	// Save to database
			// 	cryptoPriceRepository.save(cryptoPrice);
			//
			// 	log.info("Saved price data: {}", cryptoPrice);
			// }
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