/* ============================================================
   SALES ANALYSIS — SQL QUERIES
   Dataset: Online Sales Dataset — Popular Marketplace Data (Kaggle)
   Author: Karina Condexxa
   Description: KPI calculations, trend exploration, category and
                regional analysis, and product-level insights.
   ============================================================ */


/* ------------------------------------------------------------
   1. OVERALL PERFORMANCE KPIs
   ------------------------------------------------------------ */

-- Total revenue across all transactions
SELECT 
    SUM("Total Revenue") AS total_revenue
FROM 
    online_sales_data;

-- Total number of transactions
SELECT 
    COUNT("Transaction ID") AS total_transactions
FROM 
    online_sales_data;

-- Average order value (AOV)
SELECT 
    SUM("Total Revenue") / COUNT(DISTINCT "Transaction ID") AS average_order_value
FROM 
    online_sales_data;



/* ------------------------------------------------------------
   2. TIME-BASED ANALYSIS
   ------------------------------------------------------------ */

-- Daily revenue (used for line charts)
SELECT
    "Date",
    SUM("Total Revenue") AS daily_revenue
FROM
    online_sales_data
GROUP BY
    "Date"
ORDER BY
    "Date";


-- Monthly revenue
SELECT
    DATE_TRUNC('month', "Date") AS month,
    SUM("Total Revenue") AS monthly_revenue
FROM
    online_sales_data
GROUP BY
    month
ORDER BY
    month;



/* ------------------------------------------------------------
   3. CATEGORY ANALYSIS
   ------------------------------------------------------------ */

-- Revenue by product category
SELECT
    "Product Category",
    SUM("Total Revenue") AS total_revenue_by_category
FROM
    online_sales_data
GROUP BY
    "Product Category"
ORDER BY
    total_revenue_by_category DESC;


-- Units sold by category
SELECT
    "Product Category",
    SUM("Units Sold") AS units_sold
FROM
    online_sales_data
GROUP BY
    "Product Category"
ORDER BY
    units_sold DESC;



/* ------------------------------------------------------------
   4. REGIONAL ANALYSIS
   ------------------------------------------------------------ */

-- Revenue by region
SELECT
    "Region",
    SUM("Total Revenue") AS total_revenue_by_region
FROM
    online_sales_data
GROUP BY
    "Region"
ORDER BY
    total_revenue_by_region DESC;


-- Units sold by region
SELECT
    "Region",
    SUM("Units Sold") AS units_sold
FROM
    online_sales_data
GROUP BY
    "Region"
ORDER BY
    units_sold DESC;



/* ------------------------------------------------------------
   5. PRODUCT-LEVEL INSIGHTS
   ------------------------------------------------------------ */

-- Top 10 products by revenue
SELECT
    "Product Name",
    SUM("Units Sold") AS total_units_sold,
    SUM("Total Revenue") AS total_revenue
FROM
    online_sales_data
GROUP BY
    "Product Name"
ORDER BY
    total_revenue DESC
LIMIT 10;


-- Top 10 products by units sold
SELECT
    "Product Name",
    SUM("Units Sold") AS total_units_sold
FROM
    online_sales_data
GROUP BY
    "Product Name"
ORDER BY
    total_units_sold DESC
LIMIT 10;



/* ------------------------------------------------------------
   6. PAYMENT METHOD ANALYSIS
   ------------------------------------------------------------ */

-- Revenue by payment method
SELECT
    "Payment Method",
    SUM("Total Revenue") AS total_revenue
FROM
    online_sales_data
GROUP BY
    "Payment Method"
ORDER BY
    total_revenue DESC;



/* ------------------------------------------------------------
   7. FILTERED EXAMPLES (optional)
   ------------------------------------------------------------ */

-- Revenue for a specific region
SELECT
    SUM("Total Revenue")
FROM
    online_sales_data
WHERE
    "Region" = 'North America';

-- Revenue for a specific month
SELECT
    SUM("Total Revenue")
FROM
    online_sales_data
WHERE
    DATE_TRUNC('month', "Date") = '2024-03-01';



/* ------------------------------------------------------------
   END OF FILE
   ------------------------------------------------------------ */
