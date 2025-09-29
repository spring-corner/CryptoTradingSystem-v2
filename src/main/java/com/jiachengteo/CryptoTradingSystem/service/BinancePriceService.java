package com.jiachengteo.CryptoTradingSystem.service;

import com.jiachengteo.CryptoTradingSystem.dto.BinanceTickerDTO;
import com.jiachengteo.CryptoTradingSystem.entity.CryptoPrice;
import com.jiachengteo.CryptoTradingSystem.repository.CryptoPriceRepository;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import java.math.BigDecimal;
import java.time.Instant;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import java.util.Set;
import java.util.stream.Collectors;

@Service
@Slf4j
public class BinancePriceService {

	private static final String BINANCE_TICKER_URL = "https://api.binance.com/api/v3/ticker/bookTicker";

	private final RestTemplate restTemplate = new RestTemplate();

	public List<BinanceTickerDTO> fetchCryptoPrices(List<String> trackedSymbols) {
		try {
			BinanceTickerDTO[] response = restTemplate.getForObject(
				BINANCE_TICKER_URL,
				BinanceTickerDTO[].class
			);

			if (response != null) {
				return Arrays.stream(response)
					.filter(ticker -> trackedSymbols.contains(ticker.getSymbol().toUpperCase()))
					.peek(ticker -> log.info("Found Binance ticker: {}", ticker))
					.collect(Collectors.toList());
			}

			log.warn("No data received from Binance API");
			return Collections.emptyList();

		} catch (Exception e) {
			log.error("Error fetching prices from Binance: {}", e.getMessage());
			return Collections.emptyList();
		}
	}
}