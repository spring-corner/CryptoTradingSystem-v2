package com.jiachengteo.CryptoTradingSystem.controller;

import com.jiachengteo.CryptoTradingSystem.dto.TradeResponse;
import com.jiachengteo.CryptoTradingSystem.entity.Wallet;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.PostMapping;

import com.jiachengteo.CryptoTradingSystem.service.TradingService;
import com.jiachengteo.CryptoTradingSystem.repository.WalletRepository;
import com.jiachengteo.CryptoTradingSystem.dto.TradeRequest;

@RestController
@RequestMapping("/api/trading")
@Slf4j
public class TradingController {

	@Autowired
	private TradingService tradingService;

	@Autowired
	private WalletRepository walletRepository;

	@PostMapping("/trade")
	public ResponseEntity<TradeResponse> trade(@RequestBody TradeRequest request) {
		try {
			TradeResponse response = tradingService.executeTrade(request);
			return ResponseEntity.ok(response);
		} catch (RuntimeException e) {
			log.error("Trade failed: {}", e.getMessage());
			return ResponseEntity.badRequest().body(
				TradeResponse.builder()
					.status("FAILED")
					.error(e.getMessage())
					.build()
			);
		}
	}

	@GetMapping("/wallet")
	public ResponseEntity<Wallet> getWalletBalance() {
		return walletRepository.findById(1L)
			.map(ResponseEntity::ok)
			.orElse(ResponseEntity.notFound().build());
	}
}