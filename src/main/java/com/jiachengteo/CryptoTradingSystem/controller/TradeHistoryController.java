package com.jiachengteo.CryptoTradingSystem.controller;

import com.jiachengteo.CryptoTradingSystem.entity.TradeHistory;
import com.jiachengteo.CryptoTradingSystem.repository.TradeHistoryRepository;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Example;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/api/trading/history")
@Slf4j
public class TradeHistoryController {

	@Autowired
	private TradeHistoryRepository tradeHistoryRepository;

	@GetMapping
	public ResponseEntity<List<TradeHistory>> getAllTrades(
		@RequestParam(required = false) String symbol,
		@RequestParam(required = false) String orderType) {

		try {
			List<TradeHistory> trades;

			if (symbol != null && orderType != null) {
				trades = tradeHistoryRepository.findAll(Example.of(
					TradeHistory.builder()
						.symbol(symbol.toUpperCase())
						.orderType(orderType.toUpperCase())
						.build()
				));
			} else if (symbol != null) {
				trades = tradeHistoryRepository.findBySymbolOrderByTimestampDesc(
					symbol.toUpperCase()
				);
			} else if (orderType != null) {
				trades = tradeHistoryRepository.findByOrderTypeOrderByTimestampDesc(
					orderType.toUpperCase()
				);
			} else {
				trades = tradeHistoryRepository.findAllByOrderByTimestampDesc();
			}

			if (trades.isEmpty()) {
				return ResponseEntity.noContent().build();
			}

			return ResponseEntity.ok(trades);
		} catch (Exception e) {
			log.error("Error retrieving trade history: {}", e.getMessage());
			return ResponseEntity.internalServerError().build();
		}
	}

	@GetMapping("/{id}")
	public ResponseEntity<TradeHistory> getTradeById(@PathVariable Long id) {
		return tradeHistoryRepository.findById(id)
			.map(ResponseEntity::ok)
			.orElse(ResponseEntity.notFound().build());
	}
}