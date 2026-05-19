# 🚀 Race to 100% – Analytics Engine & Dashboard

---

## 📌 Overview

This project demonstrates a **snapshot-driven analytics system** designed to track Project Manager and Vertical performance, and identify the fastest to reach 100% completion.

It combines **Excel (Power Pivot), Power BI, and Tableau** to deliver a multi-layer analytics solution with both competition ranking and operational insights.

### 🎯 Objectives:
- 🏆 Identify the first Project Manager to reach 100% completion  
- 📊 Rank top performers based on completion time and workload  
- 📈 Analyze performance across verticals  

---

## 🧠 Core Logic

The ranking follows a **multi-level deterministic model**:

1. **Completion Timestamp (Primary)**
   - Earlier completion → better rank  

2. **Total Projects (Secondary)**
   - Higher workload → higher priority within the same timestamp  

3. **Dense Ranking**
   - Continuous ranking with no gaps  

---

## 🏗 Architecture

![Architecture](docs/Architecture.png)

---

## 📊 Dashboards

### 🔹 Power BI Dashboard
![Dashboard](docs/Dashboard_Preview.png)

---

### 🔹 Tableau Dashboard
![Dashboard](docs/Tableau_preview.png)

🔗 **View Live Dashboard:**  
https://public.tableau.com/views/Raceto100-TableuDashboard/Dashboard1

This version recreates the same analytical solution in Tableau, including:

- KPI tracking (Total, Confirmed, Pending, Completion %)  
- PM ranking and winner identification  
- Vertical-level performance analysis  
- Interactive drill-down using filtering  

---

## 🧠 Logic Documentation

- 📊 [Data Logic](src/data_logic.md)
- 🏆 [Ranking Logic](src/ranking_logic.md)

---

## 📂 Dataset Overview

The project uses two datasets:

### 🔹 PM_Ranking
- Final output table used for reporting  
- Contains ranking, completion timestamp, and project counts  

### 🔹 PM_Confirmation
- Provides operational metrics such as:
  - Confirmation status  
  - Vertical classification  
  - Project-level details  

---

## ⚙️ Tech Stack

- **Excel (Power Pivot, DAX)**
- **Power BI**
- **Tableau**
- **Data Modeling & Aggregation Logic**

---

## 💡 Key Learnings

- Implemented snapshot-based tracking for time-aware analytics  
- Built ranking logic combining temporal and workload factors  
- Resolved aggregation issues and ensured correct percentage calculations  
- Recreated the same analytical model across Power BI and Tableau  

---

## ⚠️ Disclaimer

This project uses **synthetic/demo data**.

- No real production data is included  
- Business logic is abstracted  
- Intended for learning and demonstration purposes only  

---
