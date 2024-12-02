package com.jiachengteo.CryptoTradingSystem_v2.repository;

import com.jiachengteo.CryptoTradingSystem_v2.entity.CryptoPrice;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface CryptoPriceRepository extends JpaRepository<CryptoPrice, Long> {
	
}