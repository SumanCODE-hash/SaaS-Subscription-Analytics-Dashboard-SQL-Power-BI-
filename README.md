# SaaS Subscription Analytics Dashboard (SQL + Power BI)

## 📌 Project Overview
This project demonstrates an end-to-end analytics workflow for a SaaS-style business using **PostgreSQL** and **Power BI**.  
The goal is to analyze **customer churn, subscription health, and user engagement** through realistic business KPIs.

⚠️ **Note:**  
The dataset used in this project is **synthetically generated (random data)**.  
However, the **analysis logic, KPIs, SQL queries, and dashboard design reflect real-world SaaS analytics practices**.

---

## 🎯 Business Questions Answered

1. **What is our monthly churn rate, and how is it changing over time?**
2. **How are subscriptions distributed across Active, Paused, and Canceled states?**
3. **Are “Ghost Users” (paying but inactive users) creating retention risk?**
4. **Which subscription plans have the highest ghost user concentration?**

---

## 🧩 Data Model

The project uses the following core tables:

- `users` – Customer profile and acquisition details  
- `subscriptions` – Subscription lifecycle, plan, and status  
- `plans` – Pricing and plan information  
- `activity_logs` – User engagement events  
- `calendar` – Date dimension for time intelligence  

All analytical results are created using **SQL Views**, which are then consumed by Power BI.

---

## 🧮 Key Metrics & Definitions

- **Churn Rate (%)**  
  Percentage of active customers who canceled in a given month.

- **Month-over-Month Churn Change (%)**  
  Measures improvement or deterioration in churn compared to the previous month.

- **Ghost Users (%)**  
  Active subscribers with **no activity in the last 30 days**.

- **Subscription Status Distribution**  
  Breakdown of Active, Paused, and Canceled subscriptions by plan.

---

## 📊 Dashboard Components

### 1️⃣ Monthly Churn Rate (Line Chart)
- X-axis: Month  
- Y-axis: Churn rate (%)  
- Shows churn trends and volatility over time.

### 2️⃣ KPI Cards
- Total Active Users  
- Total Ghost Users  

### 3️⃣ Subscription Status Distribution by Plan
- Stacked bar chart showing Active / Paused / Canceled subscriptions.

### 4️⃣ Ghost Users Distribution by Plan
- Pie chart showing ghost user concentration across plans.

---

## 🛠 Tools & Technologies

- **Database:** PostgreSQL  
- **Data Modeling:** SQL (CTEs, Views, Window Functions)  
- **Visualization:** Power BI  
- **Metrics Layer:** SQL Views + Power BI measures  

---

## 📈 Key Insights (Example)
- A high percentage of ghost users indicates **engagement risk** despite active subscriptions.
- Churn volatility highlights the need for **monthly monitoring**, not just annual metrics.
- Subscription plans show similar ghost-user behavior, suggesting **product-level engagement issues** rather than pricing alone.

---

## 🚀 Outcome
This project showcases how raw data can be transformed into **actionable business insights** using structured SQL modeling and executive-friendly dashboards.

---

## 👤 Author
**Suman Kumar Kirtonia**  
Aspiring Data Analyst | SQL • Power BI • Excel • Python
