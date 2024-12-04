package com.jiachengteo.CryptoTradingSystem.dto;

import lombok.Data;

import java.math.BigDecimal;

@Data
public class TradeRequest {
	private String symbol;      // BTCUSDT or ETHUSDT
	private String orderType;   // BUY or SELL
	private BigDecimal quantity;
}