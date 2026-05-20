# Customer Cohort Analysis

## Overview

This project analyzes customer retention, repeat purchasing behavior, and revenue trends using Cohort Analysis. SQL was used for cohort creation and retention calculations, while Power BI was used to build an interactive dashboard for business insights.

The project helps understand:
- Customer retention trends
- Repeat customer behavior
- Revenue contribution by cohorts
- Customer lifecycle performance
- Long-term customer engagement

---

## Objectives

- Analyze customer retention patterns over time
- Identify repeat purchasing behavior
- Measure cohort-wise revenue contribution
- Track customer engagement across lifecycle months
- Generate business insights to improve customer retention

---

## Tools & Technologies

- Excel
- MySQL
- Power BI
- DAX

---

## Dataset Description

The dataset contains online retail transaction data including:
- Customer IDs
- Invoice dates
- Product purchases
- Quantity
- Unit price
- Revenue
- Country information

---

## Project Workflow

### Data Cleaning

The dataset was cleaned using Excel before analysis:
- Removed null Customer IDs
- Removed cancelled transactions
- Removed duplicate records
- Removed invalid quantity and price values
- Created Revenue column
- Created OrderMonth column for monthly cohort analysis

### SQL Analysis

Performed the following analysis in MySQL:
- Identified first purchase month of each customer
- Created Cohort Month for customers
- Calculated Cohort Index
- Built customer retention table
- Calculated retention percentages
- Created detailed cohort transaction table for revenue analysis

### 3. Power BI Dashboard Development

Built a two-page interactive dashboard:
- Retention Analysis
- Revenue Insights

Added:
- KPI cards
- Cohort heatmap
- Trend analysis
- Revenue analysis visuals
- Customer behavior analysis

---

## Dashboard Pages

### 1. Retention Analysis

![Retention Dashboard](images/dashboard_retention.png)

- Customer Retention Heatmap
- Retention Trend Analysis
- Cohort-wise Customer Distribution
- Repeat Customer Analysis
- Retention KPIs

### 2. Revenue Insights

![Revenue Dashboard](images/dashboard_revenue.png)

- Revenue by Cohort
- Monthly Revenue Trend
- Revenue by Cohort Index
- Revenue KPIs
- One-Time Buyer Analysis

---

## KPIs Used

- Total Customers
- Repeat Customers
- Average Retention Rate
- Total Revenue
- Average Revenue Per Customer
- One-Time Buyers

---

## Key Insights

- Customer retention decreases significantly after the first month
- Only a portion of customers return for repeat purchases
- Certain customer cohorts contribute higher long-term revenue
- Repeat customers generate a significant share of revenue
- Revenue contribution declines across lifecycle months

---

## Business Recommendations

- Improve customer retention through loyalty programs
- Target first-time buyers with personalized campaigns
- Increase repeat purchases using retention strategies
- Focus on retaining high-value customer cohorts

---

## Conclusion

This project demonstrates how cohort analysis can be used to understand customer retention and purchasing behavior. By combining SQL-based cohort calculations with Power BI visualizations, the dashboard provides meaningful business insights into customer engagement, repeat purchases, and revenue contribution over time.

---

## Author

**Umesh Harsana**  
- B.Tech, IIT(BHU) Varanasi
- Aspiring Data Analyst
