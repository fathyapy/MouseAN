CREATE DATABASE MoANitor
GO
USE MoANitor
GO
CREATE TABLE MsCustomer(
	CustomerID CHAR(5) PRIMARY KEY,
	CustomerName VARCHAR(30) NOT NULL,
	CustomerGender VARCHAR(10) NOT NULL,
	CustomerAddress VARCHAR(100),
	CustomerDOB DATE,
	CustomerPhone VARCHAR(15) NOT NULL
)
CREATE TABLE MsAgent(
	AgentID CHAR(5) PRIMARY KEY NOT NULL,
	AgentName VARCHAR(50) NOT NULL,
	AgentAddress VARCHAR(100),
	AgentPhone VARCHAR(12),
	AgentDOB DATE
)
CREATE TABLE MsMonitor(
	MonitorID CHAR(5) PRIMARY KEY NOT NULL,
	MonitorName VARCHAR(50) NOT NULL,
	MonitorPrice INT,
	MonitorType VARCHAR(50) NOT NULL,
	MonitorStock INT
)
CREATE TABLE HeaderTransaction(
	TransactionID CHAR(5) PRIMARY KEY NOT NULL,
	AgentID CHAR(5) REFERENCES MsAgent(AgentID) ON UPDATE CASCADE ON DELETE CASCADE,
	CustomerID CHAR(5) REFERENCES MsCustomer(CustomerID) ON UPDATE CASCADE ON DELETE CASCADE,
	TransactionDate DATE
)
CREATE TABLE DetailTransaction(
	TransactionID CHAR(5) REFERENCES HeaderTransaction(TransactionID) ON UPDATE CASCADE ON DELETE CASCADE,
	MonitorID CHAR(5)REFERENCES MsMonitor(MonitorID) ON UPDATE CASCADE ON DELETE CASCADE,
	Quantity INT,
	PRIMARY KEY(TransactionID, MonitorID)
)


INSERT INTO MsCustomer VALUES
('CU001', 'Novelia Amata', 'Male', 'Redhawk Street','1998-10-2', '087812443123'),
('CU002', 'Alvin Abuda', 'Male', 'KapolraTS Street','2000-07-2', '087875194227'),
('CU003', 'Kevin Rossie', 'Male', 'Kebon Jeruk Street','1998-07-23', '088875194157'),
('CU004', 'Jennie Bluepink', 'Female', 'Adajika Street','1998-08-21', '081234432111'),
('CU005', 'Rose Amarta', 'Female', 'Quaryas Street','1998-08-24', '081234194757'),
('CU006', 'Agustina', 'Female', 'Green Street','1998-10-23', '088108085656'),
('CU007', 'Agustono Michael Salim', 'Male', 'Kaloa Street','1993-10-2', '081233212222'),
('CU008', 'Neneng Ramarja Forein', 'Female', 'BobaTS Street','1993-10-15', '082156567777'),
('CU009', 'Momo Twaise Cuki', 'Female', 'Shibuya Street','1990-10-5', '081211770032'),
('CU010', 'Rossie Marco', 'Male', 'Alogada Street','1988-04-2', '088112125314')

INSERT INTO MsAgent VALUES
('AG001', 'Elits Dargso Michael', 'Pinang Jaya Street', '08984012093','1998-10-21'),
('AG002', 'Hengky Santos', 'Roboto Street', '0898423093','1999-10-23'),
('AG003', 'Teddy Bearando', 'Michaelase Street', '08484012093','1998-05-04'),
('AG004', 'Miyayando', 'Former kalipa Street', '08684012093','1988-07-06'),
('AG005', 'Angelica Wino', 'Mer Street', '08184012093','1999-03-09'),
('AG006', 'Jessica Amaro', 'Moner Street', '08684012093','1950-01-26'),
('AG007', 'Nando Redondo', 'Roboto Street', '08884012093','1970-12-27'),
('AG008', 'Victoria Ana', 'Franscis Street', '08784014393','1980-10-27'),
('AG009', 'Jiso Redpink', 'Petang Jaya Street', '08784013293','1988-10-12'),
('AG010', 'Valen Valantia', 'Roboto Street', '08784016593','1993-10-10')

INSERT INTO MsMonitor VALUES
('MN001', 'K20 Taka', 1500000,'IPS Panel', 20),
('MN002', 'K21 D', 1300000,'VA Panel', 15),
('MN003', 'K44 Fruo', 1000000,'TN Panel', 20),
('MN004', 'K66 Feed', 2000000,'IPS Panel', 18),
('MN005', 'K77 Alab', 1000000,'TN Panel', 20),
('MN006', 'K-Gaming Fam', 2000000,'IPS Panel', 15),
('MN007', 'K-Wireless Mom Nana', 5000000, 'TN Panel', 25),
('MN008', 'K20-Origins', 4000000,'IPS Panel', 34),
('MN009', 'K20-Basic', 5000000,'VA Panel', 28),
('MN010', 'K20-Rubbered', 5000000,'IPS Panel', 15),
('MN011', 'K20-Glow Stone', 1500000,'IPS Panel', 24),
('MN012', 'Fiber Optic', 1000000,'IPS Panel', 10),
('MN013', 'K-100', 1000000,'VA Panel', 22),
('MN014', 'Logictech Micro', 1000000,'TN Panel', 12),
('MN015', 'Azure Glow', 2000000,'VA Panel', 25);

INSERT INTO HeaderTransaction VALUES
('TS001', 'AG001', 'CU003', '2018-06-14'),
('TS002', 'AG004', 'CU001', '2018-06-13'),
('TS003', 'AG003', 'CU002', '2018-07-14'),
('TS004', 'AG002', 'CU004', '2018-08-15'),
('TS005', 'AG006', 'CU003', '2018-09-15'),
('TS006', 'AG010', 'CU010', '2018-11-14'),
('TS007', 'AG004', 'CU009', '2018-12-14'),
('TS008', 'AG005', 'CU009', '2018-10-14'),
('TS009', 'AG001', 'CU007', '2018-10-15'),
('TS010', 'AG007', 'CU006', '2018-10-15'),
('TS011', 'AG002', 'CU010', '2018-11-08'),
('TS012', 'AG004', 'CU001', '2018-11-13'),
('TS013', 'AG003', 'CU004', '2018-11-13'),
('TS014', 'AG002', 'CU004', '2018-11-15'),
('TS015', 'AG001', 'CU008', '2018-11-15')


INSERT INTO DetailTransaction VALUES('TS001', 'MN001', 2),
('TS001', 'MN002', 3),
('TS002', 'MN001', 4),
('TS002', 'MN004', 2),
('TS002', 'MN006', 6),
('TS003', 'MN002', 8),
('TS004', 'MN002', 1),
('TS005', 'MN002', 1),
('TS005', 'MN001', 3),
('TS006', 'MN010', 2),
('TS007', 'MN001', 2),
('TS007', 'MN002', 3),
('TS007', 'MN003', 4),
('TS007', 'MN004', 2),
('TS008', 'MN006', 6),
('TS008', 'MN001', 8),
('TS008', 'MN002', 1),
('TS009', 'MN009', 1),
('TS009', 'MN010', 3),
('TS010', 'MN001', 4),
('TS011', 'MN004', 4),
('TS012', 'MN005', 4),
('TS013', 'MN006', 4),
('TS014', 'MN009', 3),
('TS015', 'MN009', 2);