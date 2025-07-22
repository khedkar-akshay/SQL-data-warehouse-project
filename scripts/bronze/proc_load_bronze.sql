CREATE OR ALTER PROCEDURE bronze.load_bronze as 
BEGIN

	DECLARE @start_time DATETIME, @end_time DATETIME,@batch_start_time DATETIME,@batch_end_time DATETIME;
	print'==================================================================';
	print'Loading the Bronze Layer';
	print'==================================================================';
	
	
	print'------------------------------------------------------------------';
	print'Loading CRM Table';
	print'------------------------------------------------------------------';


	SET @start_time=GETDATE();
	print'Truncating the table : crm_cust_info'
	TRUNCATE TABLE bronze.crm_cust_info;
	print'Inserting the table into :crm_cust_info'
	BULK INSERT bronze.crm_cust_info
	from 'C:\Users\aksha\Desktop\SQL\sql-data-warehouse-project\datasets\source_crm\cust_info.csv'
	WITH(
		FIRSTROW = 2,
		FIELDTERMINATOR = ',',
		TABLOCK
	);

	SET @end_time=GETDATE();
	PRINT'Load Duration : ' + cast(datediff(second,@start_time,@end_time) as nvarchar) +'seconds';


	SET @start_time=GETDATE();
	print'Truncating the table :crm_prd_info'
	TRUNCATE TABLE bronze.crm_prd_info;
	print'Inserting the table into: crm_prd_info'
	BULK INSERT bronze.crm_prd_info
	from 'C:\Users\aksha\Desktop\SQL\sql-data-warehouse-project\datasets\source_crm\prd_info.csv'
	WITH(
		FIRSTROW = 2,
		FIELDTERMINATOR = ',',
		TABLOCK
	);
	SET @end_time=GETDATE();
	PRINT'Load Duration : ' + cast(datediff(second,@start_time,@end_time) as nvarchar) +'seconds';


	SET @start_time=GETDATE();
	print'Truncating the table: crm_sales_details'
	TRUNCATE TABLE bronze.crm_sales_details;
	print'Inserting the data into : crm_sales_details'
	BULK INSERT bronze.crm_sales_details
	from 'C:\Users\aksha\Desktop\SQL\sql-data-warehouse-project\datasets\source_crm\sales_details.csv'
	WITH(
		FIRSTROW = 2,
		FIELDTERMINATOR = ',',
		TABLOCK
	);
	SET @end_time=GETDATE();
	PRINT'Load Duration : ' + cast(datediff(second,@start_time,@end_time) as nvarchar) +'seconds';

	print'------------------------------------------------------------------';
	print'Loading ERP Table';
	print'------------------------------------------------------------------';


	SET @start_time=GETDATE();
	PRINT'Truncating the table : erp_cust_az12'
	TRUNCATE TABLE bronze.erp_cust_az12;
	Print'Inserting Data into: erp_cust_az12'
	BULK INSERT bronze.erp_cust_az12
	from 'C:\Users\aksha\Desktop\SQL\sql-data-warehouse-project\datasets\source_erp\CUST_AZ12.csv'
	WITH(
		FIRSTROW = 2,
		FIELDTERMINATOR = ',',
		TABLOCK
	);
	SET @end_time=GETDATE();
	PRINT'Load Duration : ' + cast(datediff(second,@start_time,@end_time) as nvarchar) +'seconds';


	SET @start_time=GETDATE();
	print'Truncating the table : erp_loc_a101'
	TRUNCATE TABLE bronze.erp_loc_a101;
	print'Inserting the data into:erp_loc_a101'
	BULK INSERT bronze.erp_loc_a101
	from 'C:\Users\aksha\Desktop\SQL\sql-data-warehouse-project\datasets\source_erp\loc_a101.csv'
	WITH(
		FIRSTROW = 2,
		FIELDTERMINATOR = ',',
		TABLOCK
	);
	SET @end_time=GETDATE();
	PRINT'Load Duration : ' + cast(datediff(second,@start_time,@end_time) as nvarchar) +'seconds';


	SET @start_time=GETDATE();
	print'Truncating the table : erp_px_cat_g1v2'
	TRUNCATE TABLE bronze.erp_px_cat_g1v2;
	print'Inserting the data into : erp_px_cat_g1v2'
	BULK INSERT bronze.erp_px_cat_g1v2
	from 'C:\Users\aksha\Desktop\SQL\sql-data-warehouse-project\datasets\source_erp\px_cat_g1v2.csv'
	WITH(
		FIRSTROW = 2,
		FIELDTERMINATOR = ',',
		TABLOCK
	);
	SET @end_time=GETDATE();
	PRINT'Load Duration : ' + cast(datediff(second,@start_time,@end_time) as nvarchar) +'seconds';
END

exec bronze.load_bronze
