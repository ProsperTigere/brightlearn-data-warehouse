-- Create the Fact Table


DROP TABLE IF EXISTS BrightLearnDW.dbo.Fact_Sales;
GO

CREATE TABLE BrightLearnDW.dbo.Fact_Sales
(
    Sales_Key INT IDENTITY(1,1) PRIMARY KEY,

    Customer_Key INT NOT NULL,
    Product_Key INT NOT NULL,
    Store_Key INT NOT NULL,
    Date_Key INT NOT NULL,

    Payment_Method NVARCHAR(50),
    Cashier_Name NVARCHAR(100),

    Quantity INT,
    Unit_Price DECIMAL(18,2),
    Cost_Price DECIMAL(18,2),

    Transaction_Amount DECIMAL(18,2),
    Transaction_Discount DECIMAL(18,2),
    Line_Amount DECIMAL(18,2),

    Stock_On_Hand INT,
    Reorder_Threshold INT,

    CONSTRAINT FK_FactSales_Customer
        FOREIGN KEY (Customer_Key)
        REFERENCES BrightLearnDW.dbo.Dim_Customer(Customer_Key),

    CONSTRAINT FK_FactSales_Product
        FOREIGN KEY (Product_Key)
        REFERENCES BrightLearnDW.dbo.Dim_Product(Product_Key),

    CONSTRAINT FK_FactSales_Store
        FOREIGN KEY (Store_Key)
        REFERENCES BrightLearnDW.dbo.Dim_Store(Store_Key),

    CONSTRAINT FK_FactSales_Date
        FOREIGN KEY (Date_Key)
        REFERENCES BrightLearnDW.dbo.Dim_Date(Date_Key)
);
GO