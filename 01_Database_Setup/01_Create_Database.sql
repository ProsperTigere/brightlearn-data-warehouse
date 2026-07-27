-- STEP 1: CREATE THE DATABASE

CREATE DATABASE BrightLearnDW;
GO
-- STEP 2: SWITCH TO THE NEW DATABASE

USE BrightLearnDW;
GO


-- STEP 2: CREATE THE STAGING SCHEMA


-- Switch to the BrightLearn database
USE BrightLearnDW;
GO

-- Create the Staging schema
CREATE SCHEMA stg;
GO


-- STEP 3: CREATE THE STAGING TABLE


-- Switch to the BrightLearn database
USE BrightLearnDW;
GO

-- Create the staging table to hold the raw CSV data
CREATE TABLE [BrightLearnDW].[stg].[Stg_BrightLearn_Raw]
(
    transaction_date        VARCHAR(20),
    payment_method          VARCHAR(50),
    cashier_name            VARCHAR(100),

    transaction_amount      DECIMAL(10,2),
    transaction_discount    DECIMAL(10,2),

    customer_first_name     VARCHAR(100),
    customer_last_name      VARCHAR(100),
    customer_email          VARCHAR(150),
    customer_phone          VARCHAR(30),
    customer_city           VARCHAR(100),
    customer_province       VARCHAR(100),
    customer_loyalty_tier   VARCHAR(50),
    customer_since          VARCHAR(20),

    store_name              VARCHAR(100),
    store_city              VARCHAR(100),
    store_province          VARCHAR(100),
    store_region            VARCHAR(100),
    store_manager           VARCHAR(100),

    product_name            VARCHAR(150),
    category                VARCHAR(100),
    sub_category            VARCHAR(100),
    sku                     VARCHAR(50),

    unit_price              DECIMAL(10,2),
    cost_price              DECIMAL(10,2),

    supplier                VARCHAR(100),

    qty                     INT,
    line_amount             DECIMAL(10,2),

    stock_on_hand           INT,
    reorder_threshold       INT
);
GO


-- STEP 4: DROP STAGING TABLE


DROP TABLE stg.Stg_BrightLearn_Raw;
GO