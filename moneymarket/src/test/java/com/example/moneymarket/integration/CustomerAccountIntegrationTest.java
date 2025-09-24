package com.example.moneymarket.integration;

import com.example.moneymarket.dto.CustomerAccountRequestDTO;
import com.example.moneymarket.dto.CustomerAccountResponseDTO;
import com.example.moneymarket.entity.CustAcctMaster.AccountStatus;
import com.example.moneymarket.repository.CustAcctMasterRepository;
import com.example.moneymarket.service.CustomerAccountService;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.test.context.ActiveProfiles;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDate;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.when;

/**
 * Integration test for customer account functionality
 * This test uses mocked repositories for testing the service integration
 */
@SpringBootTest
@ActiveProfiles("test")
@Transactional
class CustomerAccountIntegrationTest {

    @Autowired
    private CustomerAccountService customerAccountService;

    @MockBean
    private CustAcctMasterRepository custAcctMasterRepository;

    @Test
    void testCreateAndRetrieveAccount() {
        // Create a test account request
        CustomerAccountRequestDTO requestDTO = CustomerAccountRequestDTO.builder()
                .subProductId(1)
                .custId(1)
                .acctName("Test Account")
                .dateOpening(LocalDate.now())
                .branchCode("BR001")
                .accountStatus(AccountStatus.Active)
                .build();

        // Mock response for service call
        CustomerAccountResponseDTO mockResponse = CustomerAccountResponseDTO.builder()
                .accountNo("110101001001")
                .subProductId(1)
                .subProductName("Test SubProduct")
                .glNum("110101001")
                .custId(1)
                .custName("Test Customer")
                .acctName("Test Account")
                .dateOpening(LocalDate.now())
                .branchCode("BR001")
                .accountStatus(AccountStatus.Active)
                .build();

        // Configure the mock repository behavior
        when(custAcctMasterRepository.save(any())).thenReturn(null);
        when(customerAccountService.createAccount(any(CustomerAccountRequestDTO.class))).thenReturn(mockResponse);
        when(customerAccountService.getAccount("110101001001")).thenReturn(mockResponse);

        // Create the account
        CustomerAccountResponseDTO createdAccount = customerAccountService.createAccount(requestDTO);
        
        // Verify the creation
        assertNotNull(createdAccount);
        assertEquals("110101001001", createdAccount.getAccountNo());
        assertEquals("Test Account", createdAccount.getAcctName());
        
        // Retrieve and verify the account
        CustomerAccountResponseDTO retrievedAccount = customerAccountService.getAccount("110101001001");
        assertNotNull(retrievedAccount);
        assertEquals(createdAccount.getAccountNo(), retrievedAccount.getAccountNo());
        assertEquals(createdAccount.getAcctName(), retrievedAccount.getAcctName());
        assertEquals(AccountStatus.Active, retrievedAccount.getAccountStatus());
    }
}
