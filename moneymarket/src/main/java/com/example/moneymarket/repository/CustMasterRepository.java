package com.example.moneymarket.repository;

import com.example.moneymarket.entity.CustMaster;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface CustMasterRepository extends JpaRepository<CustMaster, Integer> {
    
    boolean existsByExtCustId(String extCustId);
    
    Optional<CustMaster> findByExtCustId(String extCustId);
}
