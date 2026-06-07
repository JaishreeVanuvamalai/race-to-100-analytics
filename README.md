# PM Confirmation Dashboard

## Overview

The PM Confirmation Dashboard is a PostgreSQL-powered analytics platform designed to monitor project confirmation progress across business verticals and project managers.

The project originated from a legacy Excel and VBA-based reporting solution that was becoming increasingly difficult to maintain, validate, and scale as data volumes grew. To address these challenges, the solution was redesigned and migrated to a modern analytics architecture using PostgreSQL and Power BI.

The resulting platform centralizes business logic within SQL, improves reporting reliability, simplifies maintenance, and provides interactive drill-through analysis for stakeholders.

---

## Business Problem

The organization required a reliable method for monitoring project manager confirmation status across multiple business verticals.

The original reporting process relied on:

* Oracle Fusion report extracts
* Excel workbooks
* VBA macros
* Manual refresh processes
* Historical snapshot files

As the solution evolved, several challenges emerged:

* Growing workbook sizes resulted in performance degradation
* VBA macros became increasingly difficult to maintain
* Business logic was scattered across multiple files
* Validation and troubleshooting became time-consuming
* Scaling the solution required significant manual effort

The objective was to preserve existing business outcomes while modernizing the underlying architecture.

---

## Solution

The dashboard was redesigned as a layered analytics platform.

Oracle Fusion

↓

Excel Report Extract

↓

PostgreSQL Raw Layer

↓

PostgreSQL Analytics Layer

↓

Power BI

↓

Interactive Dashboard

The new architecture centralizes business logic within PostgreSQL while allowing Power BI to focus exclusively on visualization and user interaction.

---

## Key Features

### Executive KPI Dashboard

Monitor:

* Total Projects
* Confirmed Projects
* Pending Projects
* Completion Percentage

---

### Vertical Performance Analysis

Analyze confirmation progress by business vertical through:

* Vertical Rankings
* Completion Percentage Tracking
* Drill-through Navigation

---

### Project Manager Performance Tracking

Evaluate project manager performance using:

* PM Rankings
* Race To 100 Leaderboard
* Completion Metrics

---

### Project-Level Visibility

Drill into:

* Project ID
* Project Name
* Confirmation Status

for detailed project analysis.

---

## Dashboard Pages

### Global Dashboard

Executive-level reporting page providing organizational visibility into project confirmation progress.

Features:

* KPI Cards
* Confirmation Status Distribution
* Vertical Rankings
* Race To 100 Leaderboard

---

### Vertical Detail Page

Provides performance analysis for a selected business vertical.

Features:

* Vertical KPIs
* Project Manager Performance Table
* Vertical-Specific Drill-Through

---

### Project Manager Detail Page

Provides project-level visibility for an individual project manager.

Features:

* PM KPIs
* Assigned Project List
* Confirmation Status Tracking

---

## Technology Stack

### Source System

* Oracle Fusion

### Database

* PostgreSQL

### Database Management

* DBeaver

### Analytics Layer

* SQL Views

### Reporting Layer

* Power BI

### Legacy Solution

* Excel
* VBA

---

## Design Principles

The platform was designed around four key principles:

### Preserve Source Data

Source extracts remain unchanged within the raw layer.

### Centralize Business Logic

Business calculations are implemented in PostgreSQL.

### Simplify Reporting

Power BI consumes reporting-ready datasets.

### Enable Scalability

The architecture supports future enhancements and automation.

---

## Project Journey

This project began as an effort to improve an existing Excel-based reporting process.

The migration journey included:

1. Understanding the legacy reporting process
2. Reverse engineering Excel calculations
3. Designing a PostgreSQL architecture
4. Building analytical SQL views
5. Recreating reporting logic in Power BI
6. Implementing ranking and drill-through functionality
7. Validating outputs against source data
8. Documenting architecture and business logic

The result is a scalable analytics platform that preserves business outcomes while significantly improving maintainability.

---

## Repository Structure

```text
PM-Confirmation-Dashboard
│
├── README.md
│
├── dashboard
│   ├── PM_Confirmation_Dashboard.pbix
│   └── Race_to_100_Tableau.twbx
│
├── docs
│   ├── Architecture.md
│   ├── Data_Model.md
│   ├── SQL_Design.md
│   ├── Ranking_Logic.md
│   ├── PowerBI_Design.md
│   └── Validation_Guide.md
│
├── screenshots
│
├── sql
│
└── data
```

---

## Documentation

Additional technical documentation is available within the docs directory.

### Architecture

System architecture and data flow.

### Data Model

Tables, views, relationships, and reporting datasets.

### SQL Design

Analytics layer design decisions and SQL architecture.

### Ranking Logic

Vertical rankings, PM rankings, and Race To 100 calculations.

### Power BI Design

Dashboard structure, navigation, and visualization strategy.

### Validation Guide

Testing and validation procedures used throughout development.

---

## Future Roadmap

Planned future enhancements include:

### Version 2.1

Automated PM History Generation

### Version 2.2

File Upload Utility

### Version 2.3

Historical Trend Reporting

### Version 2.4

Automated Refresh Framework

---

## Screenshots

### Global Dashboard

*Add screenshot*

### Vertical Detail

*Add screenshot*

### Project Manager Detail

*Add screenshot*

---

## Outcomes

The project successfully:

* Migrated reporting logic from Excel and VBA to PostgreSQL
* Centralized business calculations within SQL
* Improved maintainability and scalability
* Reduced reporting complexity
* Established a reusable analytics architecture
* Delivered interactive Power BI reporting with drill-through analysis

---

## Author

Designed and developed as part of a reporting modernization initiative focused on improving project confirmation analytics, reporting reliability, and future scalability.
