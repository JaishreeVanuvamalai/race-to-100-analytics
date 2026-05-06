# 🚀 Race to 100% – Analytics Engine & Dashboard

## 📌 Overview
This project demonstrates a **competition tracking analytics system** built using **Excel (Power Pivot) and Power BI**.

The objective is to identify:
- 🏆 First Project Manager to reach 100% completion
- 📊 Top performers based on workload and timing

---

## 🧠 Core Logic

The ranking follows a **multi-level deterministic model**:

1. **Completion Timestamp (Primary)**
   - Earlier completion → better rank

2. **Total Projects (Secondary)**
   - Higher workload → higher priority within same timestamp

3. **Dense Ranking**
   - No rank gaps

---

## 🏗 Architecture

```text
Input (PM_CONFIRMATION)
        ↓
Snapshot Layer (PM_History)
        ↓
Aggregation & Logic (Power Pivot)
        ↓
Final Output (PM_Ranking)
        ↓
Power BI Dashboard
