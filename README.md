📊 BrightLearn Data Warehouse

> End-to-end SQL Server Data Warehouse and SSIS ETL project for BrightLearn retail sales analytics.



 📖 Project Overview

The BrightLearn Data Warehouse project demonstrates the complete design and implementation of a modern SQL Server data warehouse for retail sales analysis.

The project follows the Extract, Transform, Load (ETL) methodology by importing transactional sales data into a staging (raw) table before transforming it into a Star Schema consisting of dimension tables and a central fact table.

SQL Server Integration Services (SSIS) was used to automate the ETL process, while stored procedures were developed to load and maintain the warehouse efficiently.

This project simulates a real-world business intelligence environment where sales data is transformed into meaningful analytical information for reporting and decision-making.

 🎯 Business Problem

BrightLearn collects thousands of sales transactions from multiple stores.

Although the transactional database stores operational data effectively, it is not designed for analytical reporting.

The objective of this project was to build a data warehouse capable of answering business questions such as:

- Which products generate the highest revenue?
- Which stores perform best?
- Which customers purchase most frequently?
- Which payment methods are most popular?
- What are the monthly sales trends?
- How much discount is being applied?
- Which cashiers process the highest number of sales?



 Data Warehouse Architecture

The project follows the classic ETL architecture.


CSV Dataset
      │
      ▼
BrightLearn_Raw_Data
      │
      ▼
Stored Procedures
      │
      ▼
Dimension Tables
      │
      ▼
Fact Table
      │
      ▼
Business Queries
      │
      ▼
Reporting & Analytics




 ⭐ Star Schema

The warehouse consists of the following tables:

 Fact Table

- Fact_Sales

 Dimension Tables

- Dim_Customer
- Dim_Product
- Dim_Store
- Dim_Date

The Star Schema separates descriptive information from transactional facts to improve reporting performance.



 ⚙ Technologies Used

- SQL Server 2025
- SQL Server Integration Services (SSIS)
- SQL Server Management Studio (SSMS)
- Git
- GitHub
- Microsoft Excel
- Windows



 🔄 ETL Workflow

The ETL process consists of five stages.

 1. Extract

Sales data is imported from a CSV dataset into SQL Server.

 2. Stage

The extracted data is loaded into:


BrightLearn_Raw_Data


This staging table acts as the landing area before transformations.

3. Transform

Stored procedures clean and transform the data by:

- Removing duplicates
- Handling NULL values
- Standardising data
- Loading dimension tables
- Maintaining surrogate keys

 4. Load

The transformed data is loaded into:

- Customer Dimension
- Product Dimension
- Store Dimension
- Date Dimension
- Fact Sales

 5. Automation

SSIS packages automate the complete ETL workflow.

Individual packages load each warehouse table before being executed from the Master Package.



 📁 Project Structure


BrightLearn_Data_Warehouse_Project
│
├── 01_Database_Setup
│
├── 02_Stored_Procedures
│
├── 03_SSIS_Package
│
├── 04_Business_Queries
│
├── 05_Data_Quality
│
├── 06_Dataset
│
└── 07_Documentation




 📦 SSIS Packages

The project includes the following SSIS packages.

- Load_Dim_Customer
- Load_Dim_Product
- Load_Dim_Store
- Load_Dim_Date
- Load_Fact_Sales
- Master_Package

The Master Package orchestrates the execution of all ETL packages in the correct sequence.



 📊 Data Quality

Data quality checks were performed throughout the ETL process, including:

- Duplicate detection
- NULL value validation
- Customer uniqueness validation
- Dimension record validation
- Fact table validation
- Record count verification



 📈 Business Queries

The warehouse supports analytical queries including:

- Top selling products
- Monthly revenue
- Store performance
- Customer purchase history
- Sales by province
- Sales by payment method
- Discount analysis
- Revenue by product category



 🚀 How to Run the Project

1. Restore or create the BrightLearn database.
2. Execute the database setup scripts.
3. Execute all stored procedures.
4. Open the SSIS solution.
5. Execute the Master Package.
6. Run the business queries.



 📸 Project Screenshots

This repository includes screenshots of:

- Star Schema
- SSIS Packages
- Master Package Execution
- SQL Server Tables
- Query Results
- Data Quality Validation



📚 Learning Outcomes

This project demonstrates practical experience with:

- Data Warehousing
- Star Schema Design
- SQL Development
- Stored Procedures
- ETL Design
- SSIS Package Development
- Git & GitHub
- Data Quality Management
- Business Intelligence



 👨‍💻 Author

Prosper Tigere

Bachelor of Science in Informatics

 Data Analyst | Data Engineer

GitHub: https://github.com/ProsperTigere



 
