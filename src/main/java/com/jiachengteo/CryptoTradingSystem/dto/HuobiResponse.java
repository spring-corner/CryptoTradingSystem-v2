package com.jiachengteo.CryptoTradingSystem.dto;

import lombok.Data;

import java.util.List;

@Data
public class HuobiResponse {
	private List<HuobiTickerDTO> data;
	private String status;
	private Long ts;
}