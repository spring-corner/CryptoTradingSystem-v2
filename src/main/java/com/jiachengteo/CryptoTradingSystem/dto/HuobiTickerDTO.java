package com.jiachengteo.CryptoTradingSystem.dto;

import lombok.Data;
import java.math.BigDecimal;

@Data
public class HuobiTickerDTO {
	private String symbol;
	private BigDecimal open;
	private BigDecimal high;
	private BigDecimal low;
	private BigDecimal close;
	private BigDecimal amount;
	private BigDecimal vol;
	private Long count;
	private BigDecimal bid;
	private BigDecimal bidSize;
	private BigDecimal ask;
	private BigDecimal askSize;
}