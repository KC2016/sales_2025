# 📊 Sales Performance, Trends & Recommendations
### *SQL Analysis + Looker Studio Dashboard*
Dataset: **Online Sales Dataset – Popular Marketplace Data (Kaggle)**

---

## **1. Project Overview**
This project analyzes marketplace sales data to understand **revenue trends**, **sales performance**, and **regional purchasing behavior**. The dataset includes transaction records across multiple product categories, regions, payment methods, and dates.

My objective was to use **SQL (PostgreSQL)** to explore the data and build **interactive dashboards** in **Looker Studio** that summarize KPIs, reveal trends, and guide actionable recommendations for a sales team.

This end-to-end analysis answers key business questions:

- How much total revenue and how many units were sold?
- Which categories and products drive performance?
- How do regions differ in sales and payment preferences?
- What trends appear in monthly revenue and units sold?
- What insights can support strategic sales decisions?

---

## **2. Dataset**
**Source:** Kaggle – *Online Sales Dataset: Popular Marketplace Data*
**Rows:** ~ several thousand (varies depending on subset)
**Content Includes:**
- Transaction IDs
- Date
- Region
- Product Name & Category
- Units Sold
- Total Revenue
- Payment Method

---

## **3. Technical Approach**

### **3.1 Tools & Technologies**
- **PostgreSQL** for querying and KPI calculations
- **Looker Studio** for dynamic dashboards
- **Google Sheets** / CSV import
- **GitHub** for version control

---

## **3.2 Setup**
To reproduce the SQL analysis:

```sql
-- Load data into PostgreSQL
CREATE TABLE online_sales_data (...);
COPY online_sales_data FROM '/path/to/file.csv' CSV HEADER;
````

---

## **3.3 SQL Queries (KPIs & Visualizations)**

### **Overall KPIs**

```sql
-- Total Revenue
SELECT SUM("Total Revenue") AS total_revenue
FROM online_sales_data;

-- Total Transactions
SELECT COUNT("Transaction ID") AS total_transactions
FROM online_sales_data;

-- Average Order Value
SELECT SUM("Total Revenue") / COUNT(DISTINCT "Transaction ID") AS average_order_value
FROM online_sales_data;
```

### **Revenue Trend (Line Chart)**

```sql
SELECT
  "Date",
  SUM("Total Revenue") AS daily_revenue
FROM online_sales_data
GROUP BY "Date"
ORDER BY "Date";
```

### **Revenue by Product Category**

```sql
SELECT
  "Product Category",
  SUM("Total Revenue") AS total_revenue_by_category
FROM online_sales_data
GROUP BY "Product Category"
ORDER BY total_revenue_by_category DESC;
```

### **Revenue by Region**

```sql
SELECT
  "Region",
  SUM("Total Revenue") AS total_revenue_by_region
FROM online_sales_data
GROUP BY "Region"
ORDER BY total_revenue_by_region DESC;
```

### **Top 10 Bestselling Products**

```sql
SELECT
  "Product Name",
  SUM("Units Sold") AS units_sold,
  SUM("Total Revenue") AS total_revenue
FROM online_sales_data
GROUP BY "Product Name"
ORDER BY total_revenue DESC
LIMIT 10;
```

---

## **4. Dashboards**

Built in **Looker Studio** (Google Data Studio):

### **📈 Sales Performance Dashboard**

* Total revenue
* Total units sold
* Monthly revenue trend
* Monthly units sold
* Top 10 products
* Payment method distribution
* Revenue by category
* Filters: Region, Category, Month

### **📊 Sales Trends Dashboard**

* Revenue over time
* Revenue by category over time
* Regional comparisons
* Monthly transactions by region
* Payment method preferences
* Narrative text insights

---

## **5. Key Insights**

### **High-Value Categories**

* **Electronics** is the top revenue generator (€34.98K).
* Followed by **Home Appliances** (€18.65K) and **Sports** (€14.33K).
* The sharp decline in February signals a possible market event or supply chain issue.

### **Regional Strengths**

Each region exhibits distinct purchasing patterns:

| Region            | Strongest Categories             |
| ----------------- | -------------------------------- |
| **North America** | Electronics, Books               |
| **Europe**        | Home Appliances, Beauty Products |
| **Asia**          | Sports, Clothing                 |

These differences justify **region-specific sales strategies**.

### **Payment Method Behavior**

* **Credit Card** dominates in North America (63.5%).
* **PayPal** is most used in Europe (€21.27K revenue).
* Asia shows a more diverse payment mix.

These insights support optimizing **checkout UI per region** to increase conversion.

### **Market Divergence**

* Asia and Europe show a consistent **decline** from Feb–Jul.
* **North America** rebounds in August, suggesting early signs of recovery.
  This highlights the need for targeted regional campaigns.

---

## **6. Recommendations to the Sales Team**

### **1. Prioritize High-Value Categories**

* Increase promotions and inventory focus on **Electronics**.
* Investigate February revenue drop for root causes (competitor activity, supply issue).

### **2. Use Regional Targeting**

* **North America:** emphasize Electronics & Books
* **Europe:** increase visibility for Home Appliances & Beauty Products
* **Asia:** strengthen Sports & Clothing offerings

### **3. Optimize the Checkout Funnel**

* Highlight **Credit Card** options in NA
* Highlight **PayPal** in Europe
* Maintain flexible options in Asia

### **4. Address Market Downturn**

* Investigate causes behind Asia & Europe decline
* Launch re-engagement campaigns for these regions
* Explore regional pricing or limited-time promotions

---

## **7. Learning Notes (Working with Real Sales Data)**

Although this dataset provided “Total Revenue,” real-world scenarios require additional steps:

* Calculating revenue: `price * quantity`
* Excluding refunded or cancelled orders
* Joining customer, product, and transaction tables
* Creating ROI metrics:

```sql
(total_revenue - total_spend) / total_spend AS ROI
```

* Cleaning inconsistent category names
* Dealing with missing timestamps or duplicates

---

## **8. Repository Structure**

```
├── data/
│   └── online_sales_data.csv
├── sql/
│   └── analysis_queries.sql
├── dashboards/
│   ├── sales_performance.pdf
│   └── sales_trends.pdf
└── README.md
```

---

## **9. Next Steps**

* Add a **segmentation-based A/B test framework**
* Build a **machine learning model** to forecast monthly revenue
* Create a **dimensional schema** (star model) for analytics
* Add Python scripts to automate KPI calculation

---

## **10. Notes**

All financial values are assumed to be **in Euros (€)** because the original dataset did not specify currency.
This project is for educational and portfolio purposes.

```
