package com.jiachengteo.CryptoTradingSystem.controller;

import com.jiachengteo.CryptoTradingSystem.entity.CryptoPrice;
import com.jiachengteo.CryptoTradingSystem.repository.CryptoPriceRepository;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/api/prices")
@Slf4j
public class CryptoPriceController {

	@Autowired
	private CryptoPriceRepository cryptoPriceRepository;

	@GetMapping("/latest")
	public ResponseEntity<Map<String, CryptoPrice>> getLatestPrices() {
		try {
			Map<String, CryptoPrice> latestPrices = new HashMap<>();

			// Get latest price for BTCUSDT
			cryptoPriceRepository.findFirstBySymbolOrderByTimestampDesc("BTCUSDT")
				.ifPresent(price -> latestPrices.put("BTCUSDT", price));

			// Get latest price for ETHUSDT
			cryptoPriceRepository.findFirstBySymbolOrderByTimestampDesc("ETHUSDT")
				.ifPresent(price -> latestPrices.put("ETHUSDT", price));

			if (latestPrices.isEmpty()) {
				return ResponseEntity.noContent().build();
			}

			return ResponseEntity.ok(latestPrices);
		} catch (Exception e) {
			log.error("Error fetching latest prices: {}", e.getMessage());
			return ResponseEntity.internalServerError().build();
		}
	}

	@GetMapping("/latest/{symbol}")
	public ResponseEntity<CryptoPrice> getLatestPriceBySymbol(@PathVariable String symbol) {
		try {
			return cryptoPriceRepository.findFirstBySymbolOrderByTimestampDesc(symbol.toUpperCase())
				.map(ResponseEntity::ok)
				.orElse(ResponseEntity.notFound().build());
		} catch (Exception e) {
			log.error("Error fetching price for symbol {}: {}", symbol, e.getMessage());
			return ResponseEntity.internalServerError().build();
		}
	}

	@GetMapping("/history")
	public ResponseEntity<List<CryptoPrice>> getPriceHistory(
		@RequestParam(defaultValue = "10") int limit) {
		try {
			List<CryptoPrice> prices = cryptoPriceRepository
				.findTop10ByOrderByTimestampDesc();
			return ResponseEntity.ok(prices);
		} catch (Exception e) {
			log.error("Error fetching price history: {}", e.getMessage());
			return ResponseEntity.internalServerError().build();
		}
	}
}