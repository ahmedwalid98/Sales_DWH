# Sales Data Warehouse (DWH) Project

## 📌 Project Overview
The **Sales Data Warehouse (DWH) Project** is designed to integrate, transform, and store sales-related data extracted from the **AdventureWorks** database using **SQL Server Integration Services (SSIS)**. The objective is to provide a structured, optimized repository for business intelligence and reporting purposes.

## 📊 Project Scope
1. **Source System**: AdventureWorks (Microsoft's sample OLTP database)
2. **ETL Tool**: SQL Server Integration Services (SSIS)
3. **Target System**: SQL Server Data Warehouse
4. **Data Model**: Star Schema
5. **Goal**: Enable efficient reporting and analysis of sales data

## 📁 Project Structure
├── Sales_ETL/
│   ├── dim_customere.dtsx
│   ├── dim_date.dtsx
│   └── dim_product.dtsx
│   ├── dim_territory.dtsx
│   └── fact_sales.dtsx
├── SQL Scripts/
│   ├── 0-initial_db.sql
│   ├── 1-product_dim.sql
│   ├── 2-dim_customer.sql
│   ├── 3-dim_territory.sql 
│   └── 4-dim_date.sql
| 	├── 5-fact_sales_.sql

## 🔎 Data Flow
1. **Extract**: Data is sourced from the AdventureWorks database via SSIS packages.
2. **Transform**: Data cleansing, deduplication, and conforming dimensions.
3. **Load**: Data is loaded into the dimensional model within the Data Warehouse.

## 📊 Data Model
The DWH follows a **Star Schema** structure:

### Fact Table:
- **FactSales**: Stores transactional sales data.

### Dimension Tables:
- **DimCustomer**: Customer information
- **DimProduct**: Product details
- **DimDate**: Calendar and time information
- **DimSalesTerritory**: Regional sales data

## 🛠️ ETL Process
1. **Extract**:
   - Connect to the AdventureWorks database.
   - Pull data from tables: `Sales.SalesOrderHeader`, `Sales.SalesOrderDetail`, `Production.Product`, etc.
2. **Transform**:
   - Data validation and cleansing.
   - Implement surrogate keys for dimensions.
   - Apply business rules (e.g., handling nulls, data type conversions).
3. **Load**:
   - Populate dimension tables first (slowly changing dimensions where needed).
   - Load fact tables in bulk for performance optimization.

## 🚀 Setup Instructions
1. Clone the repository:
   ```bash
   git clone https://github.com/your-repo/sales-dwh.git
	 ```
2. Restore the AdventureWorks database (if not already installed).

3. Open the SSIS project in Visual Studio.

4. Configure database connection strings in the SSIS packages.

5. Deploy and execute the ETL packages in the following order:

	- Extract

	- Transform

	- Load