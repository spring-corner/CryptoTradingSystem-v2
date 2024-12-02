package com.jiachengteo.CryptoTradingSystem_v2;

import com.jiachengteo.CryptoTradingSystem_v2.dto.BinanceTickerDTO;
import com.jiachengteo.CryptoTradingSystem_v2.entity.CryptoPrice;
import com.jiachengteo.CryptoTradingSystem_v2.repository.CryptoPriceRepository;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;
import org.springframework.web.client.RestClientException;
import org.springframework.web.client.RestTemplate;

import java.math.BigDecimal;
import java.time.Instant;

@Component
public class ScheduledTasks {
	private static final Logger log = LoggerFactory.getLogger(ScheduledTasks.class);

	private final RestTemplate restTemplate = new RestTemplate();

	@Autowired
	private CryptoPriceRepository cryptoPriceRepository;

	@Scheduled(fixedRate = 10000) // 10 seconds
	public void consumeRestService() {

		// CryptoPrice quote = restTemplate.getForObject(
		// 	"https://api.binance.com/api/v3/ticker/bookTicker?symbol=BTCUSDT", CryptoPrice.class);
		// assert quote != null;
		// log.info(quote.toString());

		try {// First get the response as DTO
			BinanceTickerDTO tickerDTO = restTemplate.getForObject("https://api.binance.com/api/v3/ticker/bookTicker?symbol=BTCUSDT", BinanceTickerDTO.class);

			if (tickerDTO != null) {
				// Map DTO to Entity
				CryptoPrice cryptoPrice = new CryptoPrice();
				cryptoPrice.setSymbol(tickerDTO.getSymbol());
				cryptoPrice.setBidPrice(new BigDecimal(tickerDTO.getBidPrice()));
				cryptoPrice.setAskPrice(new BigDecimal(tickerDTO.getAskPrice()));
				cryptoPrice.setBidSize(new BigDecimal(tickerDTO.getBidQty()));
				cryptoPrice.setAskSize(new BigDecimal(tickerDTO.getAskQty()));
				cryptoPrice.setTimestamp(Instant.now());

				// Save to database
				cryptoPriceRepository.save(cryptoPrice);

				log.info("Saved price data: {}", cryptoPrice);
			} 
		} catch (RestClientException e) {
			log.error("Error fetching price data: {}", e.getMessage());
		}
	}
}