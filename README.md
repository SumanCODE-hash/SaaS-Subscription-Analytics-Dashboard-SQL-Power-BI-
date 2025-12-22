# SaaS Subscription Analytics Dashboard (SQL & Power BI)

## 📌 Project Overview
This project demonstrates an end-to-end analytics workflow for a SaaS-style business using **PostgreSQL** and **Power BI**.  
The objective is to analyze **customer churn, subscription health, and user engagement** through realistic business KPIs.

⚠️ **Important Note**  
The dataset used in this project is **synthetically generated (random data)**.  
However, the **SQL logic, KPIs, and dashboard design reflect real-world SaaS analytics practices**.

---

## 🎯 Business Questions Answered
- What is our **monthly churn rate**, and how is it changing over time?
- How are subscriptions distributed across **Active, Paused, and Canceled** states?
- Are **Ghost Users** (paying but inactive users) creating retention risk?
- Which subscription plans show the **highest ghost user concentration**?

---

## 🧩 Data Model
The project is built using the following tables:
- `users` – customer profile and acquisition data  
- `subscriptions` – subscription lifecycle and status  
- `plans` – pricing and plan information  
- `activity_logs` – user engagement events  
- `calendar` – date dimension for time intelligence  

All transformations are handled using **SQL Views**, which are then consumed by Power BI.

---

## 🧮 SQL Logic & Data Modeling

All SQL logic is written in **PostgreSQL** and organized in the `/sql` folder.

> ⚠️ The data is synthetic, but the SQL mirrors **production-grade SaaS analytics logic**.

---

### 🔹 Monthly Churn Rate & MoM Change
📄 **SQL File:**  
[`Monthly Churn Rate.sql`](Monthly Churn Rate.sql)

**Purpose:**  
- Calculates monthly churn rate  
- Computes month-over-month churn percentage using window functions  

**Key Techniques:**  
- CTEs  
- `DATE_TRUNC()`  
- `LAG()` window function  

---

### 🔹 Subscription Status Distribution by Plan
📄 **SQL File:**  
[`sql/vw_subscription_status_by_plan.sql`](./sql/vw_subscription_status_by_plan.sql)

**Purpose:**  
- Breaks down Active, Paused, and Canceled subscriptions by plan  
- Generates percentage metrics for stacked visuals  

**Key Techniques:**  
- Conditional aggregation  
- `FILTER()` clause  

---

### 🔹 Ghost Users Detection & Metrics
📄 **SQL File:**  
[`sql/vw_ghost_users_metrics.sql`](./sql/vw_ghost_users_metrics.sql)

**Definition:**  
Ghost users are customers with an **Active subscription** but **no activity in the last 30 days**.

**Purpose:**  
- Identifies ghost users  
- Calculates ghost user count and percentage by plan  

**Key Techniques:**  
- Left joins  
- Activity recency logic  
- Behavioral segmentation  

---

### 🔹 Why SQL Views Were Used
- Centralizes business logic  
- Improves Power BI performance  
- Enables reuse across dashboards  
- Reflects real analytics engineering workflows  

---

## 📊 Power BI Dashboard Overview

The Power BI dashboard connects directly to the SQL views and includes:

### 1️⃣ Monthly Churn Rate (Line Chart)
- X-axis: Month  
- Y-axis: Churn Rate (%)  
- Shows churn trends and volatility over time  

### 2️⃣ KPI Cards
- Total Active Users  
- Total Ghost Users  

### 3️⃣ Subscription Status Distribution by Plan
- Stacked bar chart showing Active / Paused / Canceled subscriptions  

### 4️⃣ Ghost Users Distribution by Plan
- Pie chart highlighting ghost user concentration across plans  

---

## 🛠 Tools & Technologies
- **Database:** PostgreSQL  
- **Data Modeling:** SQL (CTEs, Views, Window Functions)  
- **Visualization:** Power BI  

---

## 👤 Author
**Suman Kumar Kirtonia**  
Aspiring Data Analyst | SQL • Power BI • Excel • Python
