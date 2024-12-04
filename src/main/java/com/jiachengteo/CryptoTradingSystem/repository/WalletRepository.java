package com.jiachengteo.CryptoTradingSystem.repository;

import com.jiachengteo.CryptoTradingSystem.entity.Wallet;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface WalletRepository extends JpaRepository<Wallet, Long> {
	Optional<Wallet> findById(Long id);
}