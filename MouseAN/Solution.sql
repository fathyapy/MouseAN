-- 1. Create a table named MsTypeMouse with the following descriptions 
CREATE TABLE MsTypeMouse (
	TypeID CHAR (5) PRIMARY KEY NOT NULL CHECK (TypeID LIKE 'TY[0-9][0-9]'),
	TypeName VARCHAR (20) NOT NULL CHECK (TypeName LIKE 'MOUSE%'),
	TypeDescription VARCHAR (255) NOT NULL
)

-- 2. Add new column on MsCashier table named CashierEmail with varchar(20) data type and add a constraint on MsCashier table to validate that CashierEmail must be ended with �.com�.
ALTER TABLE MsCashier
ADD CashierEmail VARCHAR (20)
ADD CONSTRAINT CheckEmail CHECK (CashierEmail LIKE '%.com')

-- 3. Insert these data into MsCustomer table 
INSERT INTO MsCustomer (CustomerId,CustomerName,CustomerGender,CustomerAddress,CustomerPhone) VALUES ('CU011', 'Stefanus Geory MichaeL','Male', '57 King Cobra Street','08980418508')

SELECT * FROM MsCustomer

-- 4. Display CustomerName, CustomerAddress, and CustomerGender for every Customer whose first letter of the name is started with the letter �A�.
SELECT CustomerName, CustomerAddress, CustomerGender
FROM MsCustomer
WHERE CustomerName LIKE 'A%'

-- 5. Increase CashierSalary by 50000 on MsCashier table for every Cashier has done transaction on 6th month. (update, month)
BEGIN TRAN
UPDATE MsCashier
SET CashierSalary += 50000
FROM HeaderTransaction HT, MsCashier C
WHERE C.CashierID = HT.CashierID AND MONTH (TransactionDate)=6
