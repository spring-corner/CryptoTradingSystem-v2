package com.jiachengteo.CryptoTradingSystem.service;

import com.jiachengteo.CryptoTradingSystem.dto.HuobiResponse;
import com.jiachengteo.CryptoTradingSystem.dto.HuobiTickerDTO;
import com.jiachengteo.CryptoTradingSystem.entity.CryptoPrice;
import com.jiachengteo.CryptoTradingSystem.repository.CryptoPriceRepository;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import java.time.Instant;
import java.util.Collections;
import java.util.List;
import java.util.stream.Collectors;

@Service
@Slf4j
public class HuobiPriceService {

	private static final String HUOBI_TICKERS_URL = "https://api.huobi.pro/market/tickers";

	private final RestTemplate restTemplate = new RestTemplate();

	@Autowired
	private CryptoPriceRepository cryptoPriceRepository;

	public List<HuobiTickerDTO> fetchCryptoPrices(List<String> trackedSymbols) {
		try {
			HuobiResponse response = restTemplate.getForObject(
				HUOBI_TICKERS_URL,
				HuobiResponse.class
			);

			if (response != null && response.getData() != null) {
				return response.getData().stream()
					.filter(ticker -> trackedSymbols.contains(ticker.getSymbol().toUpperCase()))
					.peek(ticker -> log.info("Found ticker: {}", ticker))
					.collect(Collectors.toList());
			}

			log.warn("No data received from Huobi API");
			return Collections.emptyList();

		} catch (Exception e) {
			log.error("Error fetching prices from Huobi: {}", e.getMessage());
			return Collections.emptyList();
		}
	}

	public void processCryptoPrices(List<String> trackedSymbols) {
		List<HuobiTickerDTO> prices = fetchCryptoPrices(trackedSymbols);

		prices.forEach(price -> {
			CryptoPrice cryptoPrice = new CryptoPrice();
			cryptoPrice.setSymbol(price.getSymbol().toUpperCase());
			cryptoPrice.setBidPrice(price.getBid());
			cryptoPrice.setAskPrice(price.getAsk());
			cryptoPrice.setBidSize(price.getBidSize());
			cryptoPrice.setAskSize(price.getAskSize());
			cryptoPrice.setTimestamp(Instant.now());

			cryptoPriceRepository.save(cryptoPrice);
			log.info("Saved price for {}: Bid={}, Ask={}",
				cryptoPrice.getSymbol(),
				cryptoPrice.getBidPrice(),
				cryptoPrice.getAskPrice()
			);
		});
	}
}