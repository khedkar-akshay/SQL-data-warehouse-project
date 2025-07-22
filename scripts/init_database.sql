/*
Script Purpose:
  This scripts creates a new database named 'DataWarehouse' after checking if it already exists.
  If the database exists it will recreates it. Additionally,the scripts has created three schemas
  within the database:'Bronze', 'Silver', 'Gold'
*/




USE Master;
go
--Drop and recreate 'DataWarehouse' database
IF EXISTS (select 1 from sys.databases where name='DataWarehouse')
BEGIN
  ALTER DATABASE DataWarehouse SET SUNGLE_USER WITH ROLLBACK IMMEDIATE;
  DROP DATABASE DataWarehouse;
END;
GO

--Create 'DataWarehouse' Database

Create DATABASE 'DataWarehouse';
GO

USE DataWarehouse;

--Create Schemas

CREATE SCHEMA bronze;
GO
CREATE SCHEMA silver;
GO
CREATE SCHEMA gold;
