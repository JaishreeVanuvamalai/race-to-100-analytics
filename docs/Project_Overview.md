# Project Overview

## PM Confirmation Dashboard

### Background

The PM Confirmation Dashboard was originally developed as an Excel-based reporting solution used to monitor project confirmation progress across multiple business verticals and project managers.

The legacy solution relied on:

* Excel Workbooks
* VBA Macros
* Manual Data Refreshes
* Historical Snapshot Files

As data volume increased, the solution became increasingly difficult to maintain, troubleshoot, and scale.

---

## Business Problem

The organization needed a centralized reporting solution capable of:

* Tracking project confirmation status
* Measuring vertical performance
* Ranking project managers
* Supporting drill-down analysis
* Preserving historical reporting capability

The existing Excel solution presented several challenges:

* Manual refresh process
* Dependency on VBA macros
* Performance limitations with growing datasets
* Difficult troubleshooting
* Limited scalability

---

## Project Objective

The objective of this project was to migrate the reporting solution from Excel to a modern analytics platform while preserving existing business logic and reporting outputs.

The solution was designed to:

* Centralize business logic in PostgreSQL
* Improve maintainability
* Improve scalability
* Simplify reporting
* Reduce dependency on Excel macros

---

## Solution Overview

The final solution consists of:

### Data Source

Oracle Fusion Report Extracts

### Database

PostgreSQL

### Data Modeling

SQL Views

### Reporting Layer

Power BI

### Dashboard Pages

1. Global Dashboard

2. Vertical Detail

3. Project Manager Detail

---

## Key Features

### Executive KPI Dashboard

* Total Projects
* Confirmed Projects
* Pending Projects
* Completion Percentage

### Vertical Performance Analysis

* Vertical Rankings
* Completion Comparison
* Drill-through Capability

### Project Manager Analysis

* PM Rankings
* Race To 100 Tracking
* PM Performance Metrics

### Project-Level Visibility

* Project Details
* Confirmation Status Tracking

---

## Technologies Used

* Oracle Fusion
* PostgreSQL
* DBeaver
* SQL
* Power BI
* Excel

---

## Outcomes

The project successfully:

* Migrated reporting logic from Excel to PostgreSQL
* Recreated business calculations using SQL views
* Built an interactive Power BI dashboard
* Improved maintainability
* Established a scalable analytics architecture

---

## Future Enhancements

Planned future enhancements include:

* Automated PM History Generation
* Snapshot-Based Historical Reporting
* File Upload Utility
* Automated Refresh Framework
* Trend Analytics Dashboard
