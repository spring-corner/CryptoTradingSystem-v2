package com.jiachengteo.CryptoTradingSystem.dto;

import lombok.Builder;
import lombok.Data;

import java.math.BigDecimal;
import java.time.Instant;

@Data
@Builder
public class TradeResponse {
	private String status;
	private String error;
	private String orderType;
	private String symbol;
	private BigDecimal quantity;
	private BigDecimal price;
	private BigDecimal total;
	private Instant timestamp;
}