-- GL_setup dummy data
INSERT INTO GL_setup (GL_Name, Layer_Id, Layer_GL_Num, Parent_GL_Num, GL_Num) VALUES 
('Assets', 0, '1', NULL, '1'),
('Loans and Advances', 1, '1', '1', '11'),
('Money Market Loans', 2, '01', '11', '1101'),
('Call Money Loans', 3, '01', '1101', '110101'),
('Overnight Interbank Loan', 4, '001', '110101', '110101001'),
('Term Money Loans', 3, '02', '1101', '110102'),
('Corporate Term Loan', 4, '001', '110102', '110102001'),
('Liabilities', 0, '2', NULL, '2'),
('Deposits', 1, '1', '2', '21'),
('Money Market Deposits', 2, '01', '21', '2101'),
('Call Money Deposits', 3, '01', '2101', '210101'),
('Overnight Interbank Deposit', 4, '001', '210101', '210101001');

-- Customer dummy data
INSERT INTO Cust_Master (Ext_Cust_Id, Cust_Type, First_Name, Last_Name, Trade_Name, Address_1, Mobile, Maker_Id, Entry_Date, Entry_Time)
VALUES ('IND001', 'Individual', 'John', 'Doe', NULL, '123 Main St, City', '1234567890', 'ADMIN', CURDATE(), CURTIME());

INSERT INTO Cust_Master (Ext_Cust_Id, Cust_Type, First_Name, Last_Name, Trade_Name, Address_1, Mobile, Maker_Id, Entry_Date, Entry_Time)
VALUES ('CORP001', 'Corporate', NULL, NULL, 'ABC Corporation Ltd', '456 Business Park, City', '9876543210', 'ADMIN', CURDATE(), CURTIME());

INSERT INTO Cust_Master (Ext_Cust_Id, Cust_Type, First_Name, Last_Name, Trade_Name, Address_1, Mobile, Maker_Id, Entry_Date, Entry_Time)
VALUES ('BNK001', 'Bank', NULL, NULL, 'XYZ Bank Ltd', '789 Finance Street, City', '5551234567', 'ADMIN', CURDATE(), CURTIME());

-- Product dummy data
INSERT INTO Prod_Master (Product_Code, Product_Name, Cum_GL_Num, Maker_Id, Entry_Date, Entry_Time)
VALUES ('MM-LOAN', 'Money Market Loan', '1101', 'ADMIN', CURDATE(), CURTIME());

INSERT INTO Prod_Master (Product_Code, Product_Name, Cum_GL_Num, Maker_Id, Entry_Date, Entry_Time)
VALUES ('MM-DEPO', 'Money Market Deposit', '2101', 'ADMIN', CURDATE(), CURTIME());

-- Sub-product dummy data
INSERT INTO Sub_Prod_Master (Product_Id, Sub_Product_Code, Sub_Product_Name, Intt_Code, Cum_GL_Num, Ext_GL_Num, Sub_Product_Status, Maker_Id, Entry_Date, Entry_Time)
VALUES (1, 'ONL', 'Overnight Loan', 'ONL-INT', '110101', '001', 'Active', 'ADMIN', CURDATE(), CURTIME());

INSERT INTO Sub_Prod_Master (Product_Id, Sub_Product_Code, Sub_Product_Name, Intt_Code, Cum_GL_Num, Ext_GL_Num, Sub_Product_Status, Maker_Id, Entry_Date, Entry_Time)
VALUES (1, 'TML', 'Term Money Loan', 'TML-INT', '110102', '001', 'Inactive', 'ADMIN', CURDATE(), CURTIME());

INSERT INTO Sub_Prod_Master (Product_Id, Sub_Product_Code, Sub_Product_Name, Intt_Code, Cum_GL_Num, Ext_GL_Num, Sub_Product_Status, Maker_Id, Entry_Date, Entry_Time)
VALUES (2, 'OND', 'Overnight Deposit', 'OND-INT', '210101', '001', 'Deactive', 'ADMIN', CURDATE(), CURTIME());

-- Account sequence dummy data
INSERT INTO Account_Seq (GL_Num, Seq_Number) VALUES ('110101001', 0);
INSERT INTO Account_Seq (GL_Num, Seq_Number) VALUES ('110102001', 0);
INSERT INTO Account_Seq (GL_Num, Seq_Number) VALUES ('210101001', 0);

-- Customer accounts dummy data
INSERT INTO Cust_Acct_Master (Account_No, Sub_Product_Id, GL_Num, Cust_Id, Cust_Name, Acct_Name, Date_Opening, Tenor, Date_Maturity, Date_Closure, Branch_Code, Account_Status)
VALUES ('110101001001', 1, '110101001', 3, 'XYZ Bank Ltd', 'XYZ Bank Overnight Loan', CURDATE(), 1, DATE_ADD(CURDATE(), INTERVAL 1 DAY), NULL, 'BR001', 'Active');

INSERT INTO Cust_Acct_Master (Account_No, Sub_Product_Id, GL_Num, Cust_Id, Cust_Name, Acct_Name, Date_Opening, Tenor, Date_Maturity, Date_Closure, Branch_Code, Account_Status)
VALUES ('110102001001', 2, '110102001', 2, 'ABC Corporation Ltd', 'ABC Corp Term Loan', CURDATE(), 30, DATE_ADD(CURDATE(), INTERVAL 30 DAY), NULL, 'BR001', 'Active');

INSERT INTO Cust_Acct_Master (Account_No, Sub_Product_Id, GL_Num, Cust_Id, Cust_Name, Acct_Name, Date_Opening, Tenor, Date_Maturity, Date_Closure, Branch_Code, Account_Status)
VALUES ('210101001001', 3, '210101001', 1, 'John Doe', 'John Doe Overnight Deposit', CURDATE(), 1, DATE_ADD(CURDATE(), INTERVAL 1 DAY), NULL, 'BR001', 'Active');

-- Account balance initialization
INSERT INTO Acct_Bal (Account_No, Current_Balance, Available_Balance)
VALUES ('110101001001', 100000.00, 100000.00);

INSERT INTO Acct_Bal (Account_No, Current_Balance, Available_Balance)
VALUES ('110102001001', 500000.00, 500000.00);

INSERT INTO Acct_Bal (Account_No, Current_Balance, Available_Balance)
VALUES ('210101001001', 250000.00, 250000.00);

-- GL balance initialization
INSERT INTO GL_Balance (GL_Num, Current_Balance)
VALUES ('110101001', 100000.00);

INSERT INTO GL_Balance (GL_Num, Current_Balance)
VALUES ('110102001', 500000.00);

INSERT INTO GL_Balance (GL_Num, Current_Balance)
VALUES ('210101001', 250000.00);

-- Transaction dummy data
-- Transaction 1: Disbursement of Overnight Loan
INSERT INTO Tran_Table (Tran_Id, Tran_Date, Value_Date, Dr_Cr_Flag, Tran_Status, Account_No, Tran_Ccy, FCY_Amt, Exchange_Rate, LCY_Amt, Narration)
VALUES ('TRN-20250922-001-1', CURDATE(), CURDATE(), 'D', 'Verified', '110101001001', 'USD', 100000.00, 1.0000, 100000.00, 'Overnight Loan Disbursement to XYZ Bank');

-- Transaction 2: Receipt of Term Loan
INSERT INTO Tran_Table (Tran_Id, Tran_Date, Value_Date, Dr_Cr_Flag, Tran_Status, Account_No, Tran_Ccy, FCY_Amt, Exchange_Rate, LCY_Amt, Narration)
VALUES ('TRN-20250922-002-1', CURDATE(), CURDATE(), 'D', 'Verified', '110102001001', 'USD', 500000.00, 1.0000, 500000.00, 'Term Loan Disbursement to ABC Corp');

-- Transaction 3: Receipt of Overnight Deposit
INSERT INTO Tran_Table (Tran_Id, Tran_Date, Value_Date, Dr_Cr_Flag, Tran_Status, Account_No, Tran_Ccy, FCY_Amt, Exchange_Rate, LCY_Amt, Narration)
VALUES ('TRN-20250922-003-1', CURDATE(), CURDATE(), 'C', 'Verified', '210101001001', 'USD', 250000.00, 1.0000, 250000.00, 'Overnight Deposit from John Doe');

-- GL Movement for transactions
INSERT INTO GL_Movement (Tran_Id, GL_Num, Dr_Cr_Flag, Tran_Date, Value_Date, Amount, Balance_After)
VALUES ('TRN-20250922-001-1', '110101001', 'D', CURDATE(), CURDATE(), 100000.00, 100000.00);

INSERT INTO GL_Movement (Tran_Id, GL_Num, Dr_Cr_Flag, Tran_Date, Value_Date, Amount, Balance_After)
VALUES ('TRN-20250922-002-1', '110102001', 'D', CURDATE(), CURDATE(), 500000.00, 500000.00);

INSERT INTO GL_Movement (Tran_Id, GL_Num, Dr_Cr_Flag, Tran_Date, Value_Date, Amount, Balance_After)
VALUES ('TRN-20250922-003-1', '210101001', 'C', CURDATE(), CURDATE(), 250000.00, 250000.00);
