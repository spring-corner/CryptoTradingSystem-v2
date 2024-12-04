package com.jiachengteo.CryptoTradingSystem.repository;

import com.jiachengteo.CryptoTradingSystem.entity.TradeHistory;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface TradeHistoryRepository extends JpaRepository<TradeHistory, Long> {
	List<TradeHistory> findAllByOrderByTimestampDesc();
	List<TradeHistory> findBySymbolOrderByTimestampDesc(String symbol);
	List<TradeHistory> findByOrderTypeOrderByTimestampDesc(String orderType);
}