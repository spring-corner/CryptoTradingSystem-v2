package com.jiachengteo.CryptoTradingSystem_v2.entity;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.math.BigDecimal;
import java.time.Instant;

@Entity
@Table(name = "crypto_price", indexes = {@Index(name = "idx_symbol_timestamp", columnList = "symbol,timestamp")})
@Getter
@Setter
@ToString
public class CryptoPrice {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;

	@Column(nullable = false, length = 20)
	private String symbol;

	@Column(precision = 20, scale = 8)
	private BigDecimal bidPrice;

	@Column(precision = 20, scale = 8)
	private BigDecimal askPrice;

	@Column(precision = 20, scale = 8)
	private BigDecimal bidSize;

	@Column(precision = 20, scale = 8)
	private BigDecimal askSize;

	@Column(name = "timestamp", nullable = false)
	private Instant timestamp;
}