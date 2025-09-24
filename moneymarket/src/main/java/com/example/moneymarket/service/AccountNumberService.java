package com.example.moneymarket.service;

import com.example.moneymarket.entity.AccountSeq;
import com.example.moneymarket.exception.BusinessException;
import com.example.moneymarket.repository.AccountSeqRepository;
import com.example.moneymarket.repository.GLSetupRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDateTime;

/**
 * Service to generate account numbers according to SRS algorithm
 * Account_No = GL_Num + 3-digit sequential counter (zero-padded)
 */
@Service
@RequiredArgsConstructor
@Slf4j
public class AccountNumberService {

    private final AccountSeqRepository accountSeqRepository;
    private final GLSetupRepository glSetupRepository;

    /**
     * Generates a new account number for a given GL number using a concurrency-safe approach
     * Uses pessimistic locking to ensure sequence integrity
     * 
     * @param glNum The GL number to use as a prefix
     * @return The generated account number (GL_Num + sequential counter)
     */
    @Transactional
    public String generateAccountNumber(String glNum) {
        // Validate GL number exists
        if (!glSetupRepository.existsById(glNum)) {
            throw new BusinessException("Cannot generate account number: GL Number " + glNum + " does not exist");
        }

        // Get or initialize the sequence counter with pessimistic lock to prevent race conditions
        AccountSeq accountSeq = accountSeqRepository.findByGlNumWithLock(glNum)
                .orElseGet(() -> {
                    // If no sequence exists, initialize a new one
                    AccountSeq newSeq = new AccountSeq();
                    newSeq.setGlNum(glNum);
                    newSeq.setSeqNumber(0); // Start with 0, will increment to 1
                    newSeq.setLastUpdated(LocalDateTime.now());
                    return newSeq;
                });

        // Increment the sequence counter
        int nextSequence = accountSeq.getSeqNumber() + 1;
        
        // Check for sequence overflow (3 digits can only go to 999)
        if (nextSequence > 999) {
            throw new BusinessException("Account number sequence for GL " + glNum + " has reached its maximum (999)");
        }
        
        // Update the sequence
        accountSeq.setSeqNumber(nextSequence);
        accountSeq.setLastUpdated(LocalDateTime.now());
        accountSeqRepository.save(accountSeq);
        
        // Format the sequence as 3 digits with leading zeros
        String formattedSequence = String.format("%03d", nextSequence);
        
        // Construct the account number
        String accountNumber = glNum + formattedSequence;
        
        log.info("Generated account number: {} for GL: {}", accountNumber, glNum);
        return accountNumber;
    }
}
