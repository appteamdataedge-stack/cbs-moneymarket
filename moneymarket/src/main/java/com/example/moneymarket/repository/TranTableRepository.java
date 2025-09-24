package com.example.moneymarket.repository;

import com.example.moneymarket.entity.TranTable;
import com.example.moneymarket.entity.TranTable.TranStatus;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.time.LocalDate;
import java.util.List;

@Repository
public interface TranTableRepository extends JpaRepository<TranTable, String> {
    
    List<TranTable> findByAccountNo(String accountNo);
    
    List<TranTable> findByTranStatus(TranStatus status);
    
    List<TranTable> findByTranDateBetween(LocalDate startDate, LocalDate endDate);
    
    List<TranTable> findByValueDateBetween(LocalDate startDate, LocalDate endDate);
    
    List<TranTable> findByTranDateAndTranStatus(LocalDate tranDate, TranStatus status);
}
