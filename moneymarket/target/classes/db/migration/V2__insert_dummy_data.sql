-- GL_setup dummy data (Enhanced Money Market structure)
INSERT INTO GL_setup (GL_Name, Layer_Id, Layer_GL_Num, Parent_GL_Num, GL_Num) VALUES 
-- Level 0: Main Categories
('Assets', 0, '1', NULL, '1'),
('Liabilities', 0, '2', NULL, '2'),
('Income', 0, '3', NULL, '3'),
('Expenses', 0, '4', NULL, '4'),

-- Level 1: Asset Sub-categories
('Loans and Advances', 1, '1', '1', '11'),
('Cash and Bank', 1, '2', '1', '12'),

-- Level 1: Liability Sub-categories
('Deposits', 1, '1', '2', '21'),
('Borrowings', 1, '2', '2', '22'),
('Interest Payable', 1, '3', '2', '23'),

-- Level 1: Income Sub-categories
('Interest Income', 1, '1', '3', '31'),
('Other Income', 1, '2', '3', '32'),

-- Level 1: Expense Sub-categories
('Interest Expense', 1, '1', '4', '41'),
('Operating Expenses', 1, '2', '4', '42'),

-- Level 2: Money Market specific
('Money Market Loans', 2, '01', '11', '1101'),
('Money Market Deposits', 2, '01', '21', '2101'),
('Call Money Interest Income', 2, '01', '31', '3101'),
('Deposit Interest Expense', 2, '01', '41', '4101'),

-- Level 3: Product Types
('Call Money Loans', 3, '01', '1101', '110101'),
('Term Money Loans', 3, '02', '1101', '110102'),
('Call Money Deposits', 3, '01', '2101', '210101'),
('Term Money Deposits', 3, '02', '2101', '210102'),

-- Level 4: Specific Products
('Overnight Interbank Loan', 4, '001', '110101', '110101001'),
('Weekly Call Loan', 4, '002', '110101', '110101002'),
('Monthly Term Loan', 4, '001', '110102', '110102001'),
('Quarterly Term Loan', 4, '002', '110102', '110102002'),
('Overnight Interbank Deposit', 4, '001', '210101', '210101001'),
('Weekly Call Deposit', 4, '002', '210101', '210101002'),
('Monthly Term Deposit', 4, '001', '210102', '210102001'),
('Quarterly Term Deposit', 4, '002', '210102', '210102002');

-- Customer dummy data (Enhanced with realistic money market participants)
INSERT INTO Cust_Master (Ext_Cust_Id, Cust_Type, First_Name, Last_Name, Trade_Name, Address_1, Mobile, Branch_Code, Maker_Id, Entry_Date, Entry_Time, Verifier_Id, Verification_Date, Verification_Time) VALUES 
-- Individual Customers
('IND001', 'Individual', 'John', 'Doe', NULL, '123 Financial District, New York', '1234567890', 'BR001', 'ADMIN', CURDATE(), '09:00:00', 'MANAGER', CURDATE(), '09:30:00'),
('IND002', 'Individual', 'Jane', 'Smith', NULL, '456 Wall Street, New York', '9876543210', 'BR001', 'ADMIN', CURDATE(), '10:15:00', 'MANAGER', CURDATE(), '10:45:00'),
('IND003', 'Individual', 'Robert', 'Johnson', NULL, '789 Investment Ave, Chicago', '5555551234', 'BR002', 'ADMIN', CURDATE(), '11:00:00', NULL, NULL, NULL),

-- Corporate Customers  
('CORP001', 'Corporate', NULL, NULL, 'Alpha Investment Corp', '100 Corporate Plaza, Boston', '2223334444', 'BR001', 'ADMIN', CURDATE(), '09:15:00', 'MANAGER', CURDATE(), '10:00:00'),
('CORP002', 'Corporate', NULL, NULL, 'Beta Financial Services', '200 Business Center, Miami', '3334445555', 'BR003', 'ADMIN', CURDATE(), '14:00:00', 'MANAGER', CURDATE(), '14:30:00'),
('CORP003', 'Corporate', NULL, NULL, 'Gamma Holdings Ltd', '300 Trade Tower, Seattle', '4445556666', 'BR001', 'ADMIN', CURDATE(), '15:30:00', NULL, NULL, NULL),

-- Bank Customers (Primary money market participants)
('BANK001', 'Bank', NULL, NULL, 'Federal Reserve Bank of NY', '33 Liberty Street, New York', '2129205000', 'BR001', 'ADMIN', CURDATE(), '08:00:00', 'MANAGER', CURDATE(), '08:30:00'),
('BANK002', 'Bank', NULL, NULL, 'Chase Manhattan Bank', '270 Park Avenue, New York', '2129355000', 'BR001', 'ADMIN', CURDATE(), '08:30:00', 'MANAGER', CURDATE(), '09:00:00'),
('BANK003', 'Bank', NULL, NULL, 'Bank of America Corp', '100 N Tryon Street, Charlotte', '7043865000', 'BR002', 'ADMIN', CURDATE(), '09:30:00', 'MANAGER', CURDATE(), '10:00:00'),
('BANK004', 'Bank', NULL, NULL, 'Wells Fargo Bank', '420 Montgomery Street, San Francisco', '4156361000', 'BR003', 'ADMIN', CURDATE(), '16:00:00', NULL, NULL, NULL);

-- Product dummy data (Enhanced money market products)
INSERT INTO Prod_Master (Product_Code, Product_Name, Cum_GL_Num, Maker_Id, Entry_Date, Entry_Time, Verifier_Id, Verification_Date, Verification_Time) VALUES 
('MM-LOAN', 'Money Market Loan', '1101', 'ADMIN', CURDATE(), '08:00:00', 'MANAGER', CURDATE(), '08:30:00'),
('MM-DEP', 'Money Market Deposit', '2101', 'ADMIN', CURDATE(), '08:15:00', 'MANAGER', CURDATE(), '08:45:00'),
('CM-LOAN', 'Call Money Loan', '1101', 'ADMIN', CURDATE(), '08:30:00', 'MANAGER', CURDATE(), '09:00:00'),
('CM-DEP', 'Call Money Deposit', '2101', 'ADMIN', CURDATE(), '08:45:00', 'MANAGER', CURDATE(), '09:15:00');

-- Sub-product dummy data (Enhanced with realistic money market sub-products)
INSERT INTO Sub_Prod_Master (Product_Id, Sub_Product_Code, Sub_Product_Name, Intt_Code, Cum_GL_Num, Ext_GL_Num, Sub_Product_Status, Maker_Id, Entry_Date, Entry_Time, Verifier_Id, Verification_Date, Verification_Time) VALUES 
-- Money Market Loan Sub-products
(1, 'ONL', 'Overnight Loan', 'ONL-INT', '110101', '001', 'Active', 'ADMIN', CURDATE(), '09:00:00', 'MANAGER', CURDATE(), '09:30:00'),
(1, 'WCL', 'Weekly Call Loan', 'WCL-INT', '110101', '002', 'Active', 'ADMIN', CURDATE(), '09:15:00', 'MANAGER', CURDATE(), '09:45:00'),
(1, 'MTL', 'Monthly Term Loan', 'MTL-INT', '110102', '001', 'Active', 'ADMIN', CURDATE(), '09:30:00', 'MANAGER', CURDATE(), '10:00:00'),
(1, 'QTL', 'Quarterly Term Loan', 'QTL-INT', '110102', '002', 'Inactive', 'ADMIN', CURDATE(), '09:45:00', NULL, NULL, NULL),

-- Money Market Deposit Sub-products
(2, 'OND', 'Overnight Deposit', 'OND-INT', '210101', '001', 'Active', 'ADMIN', CURDATE(), '10:00:00', 'MANAGER', CURDATE(), '10:30:00'),
(2, 'WCD', 'Weekly Call Deposit', 'WCD-INT', '210101', '002', 'Active', 'ADMIN', CURDATE(), '10:15:00', 'MANAGER', CURDATE(), '10:45:00'),
(2, 'MTD', 'Monthly Term Deposit', 'MTD-INT', '210102', '001', 'Active', 'ADMIN', CURDATE(), '10:30:00', 'MANAGER', CURDATE(), '11:00:00'),
(2, 'QTD', 'Quarterly Term Deposit', 'QTD-INT', '210102', '002', 'Deactive', 'ADMIN', CURDATE(), '10:45:00', NULL, NULL, NULL);

-- Account sequence dummy data (Enhanced for all GL accounts)
INSERT INTO Account_Seq (GL_Num, Seq_Number) VALUES 
('110101001', 5),
('110101002', 3), 
('110102001', 2),
('110102002', 1),
('210101001', 4),
('210101002', 2),
('210102001', 3),
('210102002', 1);

-- Customer accounts dummy data (Realistic money market accounts)
INSERT INTO Cust_Acct_Master (Account_No, Sub_Product_Id, GL_Num, Cust_Id, Cust_Name, Acct_Name, Date_Opening, Tenor, Date_Maturity, Date_Closure, Branch_Code, Account_Status) VALUES 
-- Overnight Loans (Banks borrowing from each other)
('110101001001', 1, '110101001', 7, 'Federal Reserve Bank of NY', 'Fed Overnight Interbank Loan', CURDATE(), 1, DATE_ADD(CURDATE(), INTERVAL 1 DAY), NULL, 'BR001', 'Active'),
('110101001002', 1, '110101001', 8, 'Chase Manhattan Bank', 'Chase Overnight Loan Facility', CURDATE(), 1, DATE_ADD(CURDATE(), INTERVAL 1 DAY), NULL, 'BR001', 'Active'),
('110101001003', 1, '110101001', 9, 'Bank of America Corp', 'BoA Overnight Funding', DATE_SUB(CURDATE(), INTERVAL 1 DAY), 1, CURDATE(), NULL, 'BR002', 'Active'),

-- Weekly Call Loans (Corporate borrowers)
('110101002001', 2, '110101002', 4, 'Alpha Investment Corp', 'Alpha Weekly Call Loan', CURDATE(), 7, DATE_ADD(CURDATE(), INTERVAL 7 DAY), NULL, 'BR001', 'Active'),
('110101002002', 2, '110101002', 5, 'Beta Financial Services', 'Beta Call Money Facility', DATE_SUB(CURDATE(), INTERVAL 3 DAY), 7, DATE_ADD(CURDATE(), INTERVAL 4 DAY), NULL, 'BR003', 'Active'),

-- Monthly Term Loans (Corporate borrowers)  
('110102001001', 3, '110102001', 4, 'Alpha Investment Corp', 'Alpha 30-Day Term Loan', DATE_SUB(CURDATE(), INTERVAL 10 DAY), 30, DATE_ADD(CURDATE(), INTERVAL 20 DAY), NULL, 'BR001', 'Active'),
('110102001002', 3, '110102001', 6, 'Gamma Holdings Ltd', 'Gamma Term Facility', CURDATE(), 30, DATE_ADD(CURDATE(), INTERVAL 30 DAY), NULL, 'BR001', 'Active'),

-- Overnight Deposits (Mix of individuals and banks)
('210101001001', 5, '210101001', 1, 'John Doe', 'John Doe Overnight Deposit', CURDATE(), 1, DATE_ADD(CURDATE(), INTERVAL 1 DAY), NULL, 'BR001', 'Active'),
('210101001002', 5, '210101001', 2, 'Jane Smith', 'Jane Smith Call Deposit', CURDATE(), 1, DATE_ADD(CURDATE(), INTERVAL 1 DAY), NULL, 'BR001', 'Active'),
('210101001003', 5, '210101001', 8, 'Chase Manhattan Bank', 'Chase Overnight Placement', DATE_SUB(CURDATE(), INTERVAL 1 DAY), 1, CURDATE(), NULL, 'BR001', 'Active'),

-- Weekly Call Deposits
('210101002001', 6, '210101002', 3, 'Robert Johnson', 'Robert Weekly Deposit', DATE_SUB(CURDATE(), INTERVAL 2 DAY), 7, DATE_ADD(CURDATE(), INTERVAL 5 DAY), NULL, 'BR002', 'Active'),
('210101002002', 6, '210101002', 10, 'Wells Fargo Bank', 'Wells Fargo Call Placement', CURDATE(), 7, DATE_ADD(CURDATE(), INTERVAL 7 DAY), NULL, 'BR003', 'Active'),

-- Monthly Term Deposits
('210102001001', 7, '210102001', 5, 'Beta Financial Services', 'Beta 30-Day Term Deposit', DATE_SUB(CURDATE(), INTERVAL 5 DAY), 30, DATE_ADD(CURDATE(), INTERVAL 25 DAY), NULL, 'BR003', 'Active'),
('210102001002', 7, '210102001', 9, 'Bank of America Corp', 'BoA Term Deposit Facility', CURDATE(), 30, DATE_ADD(CURDATE(), INTERVAL 30 DAY), NULL, 'BR002', 'Active'),
('210102001003', 7, '210102001', 7, 'Federal Reserve Bank of NY', 'Fed Term Deposit', DATE_SUB(CURDATE(), INTERVAL 15 DAY), 30, DATE_ADD(CURDATE(), INTERVAL 15 DAY), NULL, 'BR001', 'Active');

-- Account balance initialization (Realistic money market balances)
INSERT INTO Acct_Bal (Account_No, Current_Balance, Available_Balance) VALUES 
-- Loan Accounts (Debit balances - large amounts typical for money market)
('110101001001', 50000000.00, 50000000.00),
('110101001002', 25000000.00, 25000000.00), 
('110101001003', 75000000.00, 75000000.00),
('110101002001', 10000000.00, 10000000.00),
('110101002002', 15000000.00, 15000000.00),
('110102001001', 100000000.00, 100000000.00),
('110102001002', 80000000.00, 80000000.00),

-- Deposit Accounts (Credit balances)
('210101001001', 5000000.00, 5000000.00),
('210101001002', 3000000.00, 3000000.00),
('210101001003', 20000000.00, 20000000.00),
('210101002001', 8000000.00, 8000000.00),
('210101002002', 12000000.00, 12000000.00),
('210102001001', 25000000.00, 25000000.00),
('210102001002', 40000000.00, 40000000.00),
('210102001003', 60000000.00, 60000000.00);

-- GL balance initialization (Aggregated balances)
INSERT INTO GL_Balance (GL_Num, Current_Balance) VALUES 
('110101001', 150000000.00),  -- Total Overnight Loans
('110101002', 25000000.00),   -- Total Weekly Call Loans  
('110102001', 180000000.00),  -- Total Monthly Term Loans
('210101001', 28000000.00),   -- Total Overnight Deposits
('210101002', 20000000.00),   -- Total Weekly Call Deposits
('210102001', 125000000.00);  -- Total Monthly Term Deposits

-- Transaction dummy data (Realistic money market transactions)
INSERT INTO Tran_Table (Tran_Id, Tran_Date, Value_Date, Dr_Cr_Flag, Tran_Status, Account_No, Tran_Ccy, FCY_Amt, Exchange_Rate, LCY_Amt, Debit_Amount, Credit_Amount, Narration, UDF1, Pointing_Id) VALUES 
-- Loan Disbursements (Debit entries)
(CONCAT('TXN', DATE_FORMAT(CURDATE(), '%Y%m%d'), '001'), CURDATE(), CURDATE(), 'D', 'Verified', '110101001001', 'USD', 50000000.00, 1.0000, 50000000.00, 50000000.00, NULL, 'Fed Overnight Loan Disbursement', 'INTERBANK', 1001),
(CONCAT('TXN', DATE_FORMAT(CURDATE(), '%Y%m%d'), '002'), CURDATE(), CURDATE(), 'D', 'Verified', '110101001002', 'USD', 25000000.00, 1.0000, 25000000.00, 25000000.00, NULL, 'Chase Overnight Loan Disbursement', 'INTERBANK', 1002),
(CONCAT('TXN', DATE_FORMAT(DATE_SUB(CURDATE(), INTERVAL 1 DAY), '%Y%m%d'), '003'), DATE_SUB(CURDATE(), INTERVAL 1 DAY), DATE_SUB(CURDATE(), INTERVAL 1 DAY), 'D', 'Verified', '110101001003', 'USD', 75000000.00, 1.0000, 75000000.00, 75000000.00, NULL, 'BoA Overnight Loan Disbursement', 'INTERBANK', 1003),
(CONCAT('TXN', DATE_FORMAT(CURDATE(), '%Y%m%d'), '004'), CURDATE(), CURDATE(), 'D', 'Verified', '110101002001', 'USD', 10000000.00, 1.0000, 10000000.00, 10000000.00, NULL, 'Alpha Weekly Call Loan', 'CORPORATE', 1004),
(CONCAT('TXN', DATE_FORMAT(DATE_SUB(CURDATE(), INTERVAL 3 DAY), '%Y%m%d'), '005'), DATE_SUB(CURDATE(), INTERVAL 3 DAY), DATE_SUB(CURDATE(), INTERVAL 3 DAY), 'D', 'Verified', '110101002002', 'USD', 15000000.00, 1.0000, 15000000.00, 15000000.00, NULL, 'Beta Call Money Facility', 'CORPORATE', 1005),

-- Deposit Receipts (Credit entries)  
(CONCAT('TXN', DATE_FORMAT(CURDATE(), '%Y%m%d'), '006'), CURDATE(), CURDATE(), 'C', 'Verified', '210101001001', 'USD', 5000000.00, 1.0000, 5000000.00, NULL, 5000000.00, 'John Doe Overnight Deposit', 'INDIVIDUAL', 2001),
(CONCAT('TXN', DATE_FORMAT(CURDATE(), '%Y%m%d'), '007'), CURDATE(), CURDATE(), 'C', 'Verified', '210101001002', 'USD', 3000000.00, 1.0000, 3000000.00, NULL, 3000000.00, 'Jane Smith Call Deposit', 'INDIVIDUAL', 2002),
(CONCAT('TXN', DATE_FORMAT(DATE_SUB(CURDATE(), INTERVAL 1 DAY), '%Y%m%d'), '008'), DATE_SUB(CURDATE(), INTERVAL 1 DAY), DATE_SUB(CURDATE(), INTERVAL 1 DAY), 'C', 'Verified', '210101001003', 'USD', 20000000.00, 1.0000, 20000000.00, NULL, 20000000.00, 'Chase Overnight Placement', 'INTERBANK', 2003),
(CONCAT('TXN', DATE_FORMAT(DATE_SUB(CURDATE(), INTERVAL 2 DAY), '%Y%m%d'), '009'), DATE_SUB(CURDATE(), INTERVAL 2 DAY), DATE_SUB(CURDATE(), INTERVAL 2 DAY), 'C', 'Verified', '210101002001', 'USD', 8000000.00, 1.0000, 8000000.00, NULL, 8000000.00, 'Robert Weekly Deposit', 'INDIVIDUAL', 2004),
(CONCAT('TXN', DATE_FORMAT(CURDATE(), '%Y%m%d'), '010'), CURDATE(), CURDATE(), 'C', 'Verified', '210101002002', 'USD', 12000000.00, 1.0000, 12000000.00, NULL, 12000000.00, 'Wells Fargo Call Placement', 'INTERBANK', 2005),

-- Term transactions
(CONCAT('TXN', DATE_FORMAT(DATE_SUB(CURDATE(), INTERVAL 10 DAY), '%Y%m%d'), '011'), DATE_SUB(CURDATE(), INTERVAL 10 DAY), DATE_SUB(CURDATE(), INTERVAL 10 DAY), 'D', 'Verified', '110102001001', 'USD', 100000000.00, 1.0000, 100000000.00, 100000000.00, NULL, 'Alpha 30-Day Term Loan', 'CORPORATE', 1011),
(CONCAT('TXN', DATE_FORMAT(CURDATE(), '%Y%m%d'), '012'), CURDATE(), CURDATE(), 'D', 'Verified', '110102001002', 'USD', 80000000.00, 1.0000, 80000000.00, 80000000.00, NULL, 'Gamma Term Facility', 'CORPORATE', 1012),
(CONCAT('TXN', DATE_FORMAT(DATE_SUB(CURDATE(), INTERVAL 5 DAY), '%Y%m%d'), '013'), DATE_SUB(CURDATE(), INTERVAL 5 DAY), DATE_SUB(CURDATE(), INTERVAL 5 DAY), 'C', 'Verified', '210102001001', 'USD', 25000000.00, 1.0000, 25000000.00, NULL, 25000000.00, 'Beta 30-Day Term Deposit', 'CORPORATE', 2011),
(CONCAT('TXN', DATE_FORMAT(CURDATE(), '%Y%m%d'), '014'), CURDATE(), CURDATE(), 'C', 'Verified', '210102001002', 'USD', 40000000.00, 1.0000, 40000000.00, NULL, 40000000.00, 'BoA Term Deposit Facility', 'INTERBANK', 2012),
(CONCAT('TXN', DATE_FORMAT(DATE_SUB(CURDATE(), INTERVAL 15 DAY), '%Y%m%d'), '015'), DATE_SUB(CURDATE(), INTERVAL 15 DAY), DATE_SUB(CURDATE(), INTERVAL 15 DAY), 'C', 'Verified', '210102001003', 'USD', 60000000.00, 1.0000, 60000000.00, NULL, 60000000.00, 'Fed Term Deposit', 'INTERBANK', 2013);

-- GL Movement for transactions (corresponding to above transactions)
INSERT INTO GL_Movement (Tran_Id, GL_Num, Dr_Cr_Flag, Tran_Date, Value_Date, Amount, Balance_After) VALUES 
-- Loan disbursement GL movements
(CONCAT('TXN', DATE_FORMAT(CURDATE(), '%Y%m%d'), '001'), '110101001', 'D', CURDATE(), CURDATE(), 50000000.00, 50000000.00),
(CONCAT('TXN', DATE_FORMAT(CURDATE(), '%Y%m%d'), '002'), '110101001', 'D', CURDATE(), CURDATE(), 25000000.00, 75000000.00),
(CONCAT('TXN', DATE_FORMAT(DATE_SUB(CURDATE(), INTERVAL 1 DAY), '%Y%m%d'), '003'), '110101001', 'D', DATE_SUB(CURDATE(), INTERVAL 1 DAY), DATE_SUB(CURDATE(), INTERVAL 1 DAY), 75000000.00, 150000000.00),
(CONCAT('TXN', DATE_FORMAT(CURDATE(), '%Y%m%d'), '004'), '110101002', 'D', CURDATE(), CURDATE(), 10000000.00, 10000000.00),
(CONCAT('TXN', DATE_FORMAT(DATE_SUB(CURDATE(), INTERVAL 3 DAY), '%Y%m%d'), '005'), '110101002', 'D', DATE_SUB(CURDATE(), INTERVAL 3 DAY), DATE_SUB(CURDATE(), INTERVAL 3 DAY), 15000000.00, 25000000.00),

-- Deposit receipt GL movements
(CONCAT('TXN', DATE_FORMAT(CURDATE(), '%Y%m%d'), '006'), '210101001', 'C', CURDATE(), CURDATE(), 5000000.00, 5000000.00),
(CONCAT('TXN', DATE_FORMAT(CURDATE(), '%Y%m%d'), '007'), '210101001', 'C', CURDATE(), CURDATE(), 3000000.00, 8000000.00),
(CONCAT('TXN', DATE_FORMAT(DATE_SUB(CURDATE(), INTERVAL 1 DAY), '%Y%m%d'), '008'), '210101001', 'C', DATE_SUB(CURDATE(), INTERVAL 1 DAY), DATE_SUB(CURDATE(), INTERVAL 1 DAY), 20000000.00, 28000000.00),
(CONCAT('TXN', DATE_FORMAT(DATE_SUB(CURDATE(), INTERVAL 2 DAY), '%Y%m%d'), '009'), '210101002', 'C', DATE_SUB(CURDATE(), INTERVAL 2 DAY), DATE_SUB(CURDATE(), INTERVAL 2 DAY), 8000000.00, 8000000.00),
(CONCAT('TXN', DATE_FORMAT(CURDATE(), '%Y%m%d'), '010'), '210101002', 'C', CURDATE(), CURDATE(), 12000000.00, 20000000.00),

-- Term transaction GL movements
(CONCAT('TXN', DATE_FORMAT(DATE_SUB(CURDATE(), INTERVAL 10 DAY), '%Y%m%d'), '011'), '110102001', 'D', DATE_SUB(CURDATE(), INTERVAL 10 DAY), DATE_SUB(CURDATE(), INTERVAL 10 DAY), 100000000.00, 100000000.00),
(CONCAT('TXN', DATE_FORMAT(CURDATE(), '%Y%m%d'), '012'), '110102001', 'D', CURDATE(), CURDATE(), 80000000.00, 180000000.00),
(CONCAT('TXN', DATE_FORMAT(DATE_SUB(CURDATE(), INTERVAL 5 DAY), '%Y%m%d'), '013'), '210102001', 'C', DATE_SUB(CURDATE(), INTERVAL 5 DAY), DATE_SUB(CURDATE(), INTERVAL 5 DAY), 25000000.00, 25000000.00),
(CONCAT('TXN', DATE_FORMAT(CURDATE(), '%Y%m%d'), '014'), '210102001', 'C', CURDATE(), CURDATE(), 40000000.00, 65000000.00),
(CONCAT('TXN', DATE_FORMAT(DATE_SUB(CURDATE(), INTERVAL 15 DAY), '%Y%m%d'), '015'), '210102001', 'C', DATE_SUB(CURDATE(), INTERVAL 15 DAY), DATE_SUB(CURDATE(), INTERVAL 15 DAY), 60000000.00, 125000000.00);

-- Insert sample Interest Accrual Transactions (after transactions are inserted)
INSERT INTO Intt_Accr_Tran (Tran_Id, Account_No, Accrual_Date, Interest_Rate, Amount, Status) VALUES 
(CONCAT('TXN', DATE_FORMAT(CURDATE(), '%Y%m%d'), '001'), '110101001001', CURDATE(), 5.2500, 7123.29, 'Posted'),
(CONCAT('TXN', DATE_FORMAT(CURDATE(), '%Y%m%d'), '002'), '110101001002', CURDATE(), 5.2500, 3561.64, 'Posted'),
(CONCAT('TXN', DATE_FORMAT(CURDATE(), '%Y%m%d'), '006'), '210101001001', CURDATE(), 4.7500, 649.32, 'Posted'),
(CONCAT('TXN', DATE_FORMAT(CURDATE(), '%Y%m%d'), '007'), '210101001002', CURDATE(), 4.7500, 389.59, 'Posted'),
(CONCAT('TXN', DATE_FORMAT(DATE_SUB(CURDATE(), INTERVAL 5 DAY), '%Y%m%d'), '013'), '210102001001', CURDATE(), 5.0000, 3424.66, 'Pending');
