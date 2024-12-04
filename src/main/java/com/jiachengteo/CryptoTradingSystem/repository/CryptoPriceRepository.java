package com.jiachengteo.CryptoTradingSystem.repository;

import com.jiachengteo.CryptoTradingSystem.entity.CryptoPrice;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface CryptoPriceRepository extends JpaRepository<CryptoPrice, Long> {
	Optional<CryptoPrice> findFirstBySymbolOrderByTimestampDesc(String symbol);
	List<CryptoPrice> findTop10ByOrderByTimestampDesc();
}