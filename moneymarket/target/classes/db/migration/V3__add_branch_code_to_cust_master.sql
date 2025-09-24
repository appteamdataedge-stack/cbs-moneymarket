-- Add Branch_Code column to Cust_Master table
ALTER TABLE Cust_Master ADD COLUMN Branch_Code VARCHAR(10) DEFAULT '001' NOT NULL;
