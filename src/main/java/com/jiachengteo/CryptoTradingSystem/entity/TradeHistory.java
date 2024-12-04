package com.jiachengteo.CryptoTradingSystem.entity;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;

import java.math.BigDecimal;
import java.time.Instant;

@Entity
@Data
@Builder
@AllArgsConstructor
public class TradeHistory {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	private String symbol;
	private String orderType;
	private BigDecimal quantity;
	private BigDecimal price;
	private BigDecimal total;
	private Instant timestamp;

	public TradeHistory() {
		
	}
}