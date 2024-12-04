package com.jiachengteo.CryptoTradingSystem;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.scheduling.annotation.EnableScheduling;

@SpringBootApplication
@EnableScheduling
public class CryptoTradingSystemV2Application {

	public static void main(String[] args) {
		SpringApplication.run(CryptoTradingSystemV2Application.class, args);
	}

}
