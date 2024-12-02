package com.jiachengteo.CryptoTradingSystem_v2.dto;


import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class BinanceTickerDTO {
	private String symbol;
	private String bidPrice;
	private String bidQty;
	private String askPrice;
	private String askQty;
	
}