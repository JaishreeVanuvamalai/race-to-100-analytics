# Architecture

## Solution Architecture

### Overview

The PM Confirmation Dashboard is a PostgreSQL-powered analytics platform designed to monitor project confirmation progress across business verticals and project managers.

The solution transforms Oracle Fusion report extracts into interactive Power BI dashboards through a centralized analytics layer built in PostgreSQL.

---

# High-Level Architecture

Oracle Fusion

↓

Excel Report Extract

↓

PostgreSQL Raw Layer

↓

PostgreSQL Analytics Layer

↓

Power BI Semantic Layer

↓

Interactive Dashboard

---

# Architecture Components

## 1. Oracle Fusion

### Purpose

Oracle Fusion serves as the system of record and primary source of project confirmation data.

### Responsibilities

* Maintain project records
* Maintain project manager assignments
* Maintain project confirmation status
* Provide reporting extracts

### Output

PM Confirmation Report

Exported in Excel format.

---

## 2. Excel Extract Layer

### Purpose

Provide a secure and controlled mechanism for transferring data from Oracle Fusion into the analytics platform.

### Why Excel?

Direct database connectivity was intentionally avoided due to:

* Security considerations
* Access restrictions
* Governance requirements
* Operational simplicity

Using Oracle Fusion report extracts ensures:

* Approved reporting output
* Consistent structure
* Reduced integration complexity
* Elimination of manual data manipulation

### Output

PM Confirmation Dataset

CSV / Excel Format

---

## 3. PostgreSQL Raw Layer

### Schema

raw

### Purpose

Store source data exactly as received from Oracle Fusion.

### Responsibilities

* Data ingestion
* Data preservation
* Source record storage

### Primary Table

raw.current_pm_confirmation

### Design Principle

No business logic exists within the raw layer.

The raw layer represents the source data exactly as received.

---

## 4. PostgreSQL Analytics Layer

### Schema

analytics

### Purpose

Centralize all business calculations and reporting logic.

### Responsibilities

* KPI calculations
* Confirmation calculations
* Ranking logic
* Aggregation logic
* Reporting datasets

### Primary Views

vw_dashboard_summary

vw_confirmation_status

vw_vertical_ranking

vw_pm_ranking

vw_pm_vertical_summary

vw_pm_detail

vw_pm_master

### Design Principle

Business logic should exist in SQL rather than Power BI wherever possible.

Benefits:

* Single source of truth
* Easier validation
* Easier maintenance
* Improved consistency

---

## 5. Power BI Semantic Layer

### Purpose

Consume analytics views and transform them into business-friendly visuals.

### Responsibilities

* Data modeling
* Relationships
* Drill-through navigation
* Visualization

### Design Principle

SQL calculates.

Power BI presents.

This separation reduces duplication of business logic.

---

## 6. Dashboard Layer

### Purpose

Provide stakeholders with actionable reporting and analysis capabilities.

### Pages

#### Global Dashboard

Executive-level KPI overview.

#### Vertical Detail

Vertical-specific performance analysis.

#### PM Detail

Project Manager performance analysis and project-level visibility.

### Navigation Model

Organization

↓

Vertical

↓

Project Manager

↓

Project

---

# Data Flow

Step 1

Oracle Fusion generates PM Confirmation Report.

↓

Step 2

Report is exported as Excel.

↓

Step 3

Data is imported into:

raw.current_pm_confirmation

↓

Step 4

Analytics views generate reporting datasets.

↓

Step 5

Power BI consumes analytics views.

↓

Step 6

Users interact with dashboards through drill-through navigation.

---

# Design Decisions

## Why PostgreSQL?

PostgreSQL was selected because it provides:

* Strong SQL capabilities
* Robust view support
* Scalability
* Open-source licensing
* Excellent compatibility with Power BI

---

## Why SQL Views?

Views provide:

* Centralized business logic
* Simplified maintenance
* Consistent reporting outputs
* Easier troubleshooting

---

## Why Not Excel?

Excel was effective for early reporting requirements but introduced:

* Performance limitations
* VBA dependencies
* Manual processes
* Maintenance complexity

The PostgreSQL architecture addresses these limitations while preserving existing business outcomes.

---

# Current Version

Version 2.0

PostgreSQL Analytics Platform

Status: Production Ready

---

# Planned Future Enhancements

Version 2.1

Automated PM History Generation

Version 2.2

File Upload Utility

Version 2.3

Historical Trend Reporting

Version 2.4

Automated Refresh Framework
