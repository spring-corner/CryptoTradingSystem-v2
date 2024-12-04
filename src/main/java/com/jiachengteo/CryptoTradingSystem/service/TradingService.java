package com.jiachengteo.CryptoTradingSystem.service;

import com.jiachengteo.CryptoTradingSystem.dto.TradeRequest;
import com.jiachengteo.CryptoTradingSystem.dto.TradeResponse;
import com.jiachengteo.CryptoTradingSystem.entity.CryptoPrice;
import com.jiachengteo.CryptoTradingSystem.entity.TradeHistory;
import com.jiachengteo.CryptoTradingSystem.entity.Wallet;
import com.jiachengteo.CryptoTradingSystem.repository.CryptoPriceRepository;
import com.jiachengteo.CryptoTradingSystem.repository.TradeHistoryRepository;
import com.jiachengteo.CryptoTradingSystem.repository.WalletRepository;
import jakarta.transaction.Transactional;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.time.Instant;

@Service
@Slf4j
public class TradingService {

	@Autowired
	private WalletRepository walletRepository;

	@Autowired
	private CryptoPriceRepository cryptoPriceRepository;

	@Autowired
	private TradeHistoryRepository tradeHistoryRepository;

	@Transactional
	public TradeResponse executeTrade(TradeRequest request) {
		// Get latest price
		CryptoPrice latestPrice = cryptoPriceRepository
			.findFirstBySymbolOrderByTimestampDesc(request.getSymbol())
			.orElseThrow(() -> new RuntimeException("Price not available for " + request.getSymbol()));

		// Get user wallet (assuming ID 1)
		Wallet wallet = walletRepository.findById(1L)
			.orElseThrow(() -> new RuntimeException("Wallet not found"));

		// Execute trade
		BigDecimal tradePrice;
		BigDecimal tradeCost;

		if ("BUY".equals(request.getOrderType())) {
			tradePrice = latestPrice.getAskPrice();
			tradeCost = tradePrice.multiply(request.getQuantity());

			// Check if user has enough USDT
			if (wallet.getUsdtBalance().compareTo(tradeCost) < 0) {
				throw new RuntimeException("Insufficient USDT balance");
			}

			// Update balances
			wallet.setUsdtBalance(wallet.getUsdtBalance().subtract(tradeCost));
			if (request.getSymbol().equals("BTCUSDT")) {
				wallet.setBtcBalance(wallet.getBtcBalance().add(request.getQuantity()));
			} else {
				wallet.setEthBalance(wallet.getEthBalance().add(request.getQuantity()));
			}

		} else { // SELL
			tradePrice = latestPrice.getBidPrice();
			tradeCost = tradePrice.multiply(request.getQuantity());

			// Check if user has enough crypto
			if (request.getSymbol().equals("BTCUSDT")) {
				if (wallet.getBtcBalance().compareTo(request.getQuantity()) < 0) {
					throw new RuntimeException("Insufficient BTC balance");
				}
				wallet.setBtcBalance(wallet.getBtcBalance().subtract(request.getQuantity()));
			} else {
				if (wallet.getEthBalance().compareTo(request.getQuantity()) < 0) {
					throw new RuntimeException("Insufficient ETH balance");
				}
				wallet.setEthBalance(wallet.getEthBalance().subtract(request.getQuantity()));
			}

			// Update USDT balance
			wallet.setUsdtBalance(wallet.getUsdtBalance().add(tradeCost));
		}

		wallet.setLastUpdated(Instant.now());
		walletRepository.save(wallet);

		// Save trade history
		TradeHistory tradeHistory = new TradeHistory();
		tradeHistory.setSymbol(request.getSymbol());
		tradeHistory.setOrderType(request.getOrderType());
		tradeHistory.setQuantity(request.getQuantity());
		tradeHistory.setPrice(tradePrice);
		tradeHistory.setTotal(tradeCost);
		tradeHistory.setTimestamp(Instant.now());
		tradeHistoryRepository.save(tradeHistory);

		return TradeResponse.builder()
			.status("SUCCESS")
			.orderType(request.getOrderType())
			.symbol(request.getSymbol())
			.quantity(request.getQuantity())
			.price(tradePrice)
			.total(tradeCost)
			.timestamp(Instant.now())
			.build();
	}
}