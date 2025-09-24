package com.example.moneymarket.repository;

import com.example.moneymarket.entity.CustAcctMaster;
import com.example.moneymarket.entity.CustAcctMaster.AccountStatus;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface CustAcctMasterRepository extends JpaRepository<CustAcctMaster, String> {
    
    List<CustAcctMaster> findByCustomerCustId(Integer custId);
    
    List<CustAcctMaster> findBySubProductSubProductId(Integer subProductId);
    
    List<CustAcctMaster> findByGlNum(String glNum);
    
    List<CustAcctMaster> findByAccountStatus(AccountStatus status);
    
    boolean existsByAccountNo(String accountNo);
}
