
### Sales Performance, Trends and Recommendations to the Sales Team

dataset: [Online Sales Dataset - Popular Marketplace Data, Kaggle](https://www.kaggle.com/datasets/shreyanshverma27/online-sales-dataset-popular-marketplace-data?resource=download)

Analysis of the dataset on sales KPIs (total revenue and total units sold) and trends on revenue per month, geographic analysis, and payment methods. Using SQL to answer questions and Looker Studio to visualize the results.



### SQL queries (PostgreSQL)
```
-- 1. Scorecards for Overall Performance
-- total revenue
SELECT SUM("Total Revenue") AS total_revenue FROM online_sales_data;

-- total transactions
SELECT COUNT("Transaction ID") AS total_transactions FROM online_sales_data;

-- avg order value
SELECT SUM("Total Revenue") / COUNT(DISTINCT "Transaction ID") AS average_order_value FROM online_sales_data;

-- 2. Line Chart for Sales Trend
SELECT
  "Date",
  SUM("Total Revenue") AS daily_revenue
FROM
  online_sales_data
GROUP BY
  "Date"
ORDER BY
  "Date";

-- 3. Bar Charts for Categorical Data
-- Revenue by Product Category:
SELECT
  "Product Category",
  SUM("Total Revenue") AS total_revenue_by_category
FROM
  online_sales_data
GROUP BY
  "Product Category"
ORDER BY
  total_revenue_by_category DESC;

-- Revenue by Region:
SELECT
  "Region",
  SUM("Total Revenue") AS total_revenue_by_region
FROM
  online_sales_data
GROUP BY
  "Region"
ORDER BY
  total_revenue_by_region DESC;

-- 4. Table for Top Products
-- Top 10 Products by Revenue:
SELECT
  "Product Name",
  SUM("Units Sold") AS units_sold,
  SUM("Total Revenue") AS total_revenue
FROM
  online_sales_data
GROUP BY
  "Product Name"
ORDER BY
  total_revenue DESC
LIMIT 10;
```

### Dashboards
[Looker Studio Dashboard](https://lookerstudio.google.com/u/0/reporting/53db7069-39af-4988-a5bf-e101c8edcce1/page/14AXF/edit)

- Sales Performance
- Sales Trends
- Recommendations to the Sales Team

1. Focus on High-Value Categories
The sales team should prioritize efforts on Electronics, as it's the highest-grossing category. Investigate the cause of the sharp revenue downturn in February to see if it was due to a market event, supply chain issue, or competitor activity. The volatility in this key category presents both a risk and a significant opportunity for growth.
2. Leverage Regional Strengths
Instead of a one-size-fits-all approach, the team should tailor sales strategies to each region's specific product preferences.
- North America: Focus on promoting the Electronics and Books categories.
- Europe: Double down on selling Home Appliances and Beauty Products.
- Asia: Reinforce sales of Sports and Clothing, where the market is already strong.
3. Optimize the Sales Funnel
The clear regional preferences for payment methods can be used to improve the conversion rate. The sales team should ensure that:
- In North American marketing and checkout processes, Credit Card is prominently featured.
- In Europe, PayPal is a primary and highly visible payment option.
4. Address Market Divergence
The analysis showed a decline in Asia and Europe but a slight rebound in North America in August.
The sales team should:
- Investigate why North America's trend reversed.
- Develop targeted strategies to counter the ongoing downturn in Asia and Europe, potentially by running specific promotions or campaigns to re-engage customers in those regions.


*Notes:*
This analysis is based on a dataset sourced from Kaggle. As no currency was specified in the data, all financial figures have been assumed to be in Euros (€).

[Link to PDF](https://github.com/KC2016/sales_2025/blob/main/sales_2025.pdf)



### Working with sales datasets
In this dataset, Total Revenue was already calculated. However, in real works we need to calculate it and deal with anothwer issues, as:
-  **subtracting the total spend from the total earning and divinding per the total spend and multiplied per 100.0** ```(total_revenue - total_spend) / total_spend AS ROI```.
- considering **only non-refunded orders.**
- doing **INNER JOIN tables** to get the customer and the purchase information.

### Next Analysis

- next_steps.md