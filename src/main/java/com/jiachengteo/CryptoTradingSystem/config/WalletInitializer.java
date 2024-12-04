package com.jiachengteo.CryptoTradingSystem.config;

import com.jiachengteo.CryptoTradingSystem.ScheduledTasks;
import com.jiachengteo.CryptoTradingSystem.entity.Wallet;
import com.jiachengteo.CryptoTradingSystem.repository.WalletRepository;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.stereotype.Component;

import java.math.BigDecimal;
import java.time.Instant;

@Component
public class WalletInitializer implements CommandLineRunner {

	private static final Logger log = LoggerFactory.getLogger(WalletInitializer.class);

	@Autowired
	private WalletRepository walletRepository;

	@Override
	public void run(String... args) {
		// Check if wallet table is empty
		if (walletRepository.count() == 0) {
			// Create new wallet with initial balance
			Wallet wallet = new Wallet();
			wallet.setUsdtBalance(new BigDecimal("50000.00"));
			wallet.setBtcBalance(BigDecimal.ZERO);
			wallet.setEthBalance(BigDecimal.ZERO);
			wallet.setLastUpdated(Instant.now());

			// Save to database
			walletRepository.save(wallet);

			log.info("Initialized wallet with 50,000 USDT balance");
		}
	}
}