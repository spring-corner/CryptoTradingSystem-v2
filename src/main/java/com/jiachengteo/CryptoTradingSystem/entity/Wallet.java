package com.jiachengteo.CryptoTradingSystem.entity;

import jakarta.persistence.*;
import lombok.Data;

import java.math.BigDecimal;
import java.time.Instant;

@Entity
@Data
public class Wallet {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	private BigDecimal usdtBalance;
	private BigDecimal btcBalance;
	private BigDecimal ethBalance;
	private Instant lastUpdated;
}