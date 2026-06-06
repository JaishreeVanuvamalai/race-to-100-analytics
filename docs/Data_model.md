# Data Model

## Overview

The PM Confirmation Dashboard follows a layered data model architecture designed to separate source data from reporting logic.

The model consists of:

1. Raw Layer
2. Analytics Layer
3. Reporting Layer

This separation improves maintainability, validation, and scalability.

---

# Data Model Structure

Oracle Fusion Extract

↓

raw.current_pm_confirmation

↓

Analytics Views

↓

Power BI Dashboard

---

# Raw Layer

## Table

### raw.current_pm_confirmation

### Purpose

Stores the PM Confirmation Report exactly as received from Oracle Fusion.

### Data Source

Oracle Fusion PM Confirmation Report

### Design Principle

No business logic is applied in this layer.

The table serves as the single source of truth for all downstream reporting.

---

### Key Columns

| Column               | Description               |
| -------------------- | ------------------------- |
| project_id           | Unique project identifier |
| project_name         | Project name              |
| vertical             | Business vertical         |
| project_manager_id   | Unique PM identifier      |
| project_manager_name | Project manager name      |
| pm_status            | Confirmation status       |

---

# Analytics Layer

The analytics layer transforms raw data into reporting-ready datasets.

---

## View

### vw_dashboard_summary

### Purpose

Provides overall dashboard KPIs.

### Metrics

* Total Projects
* Confirmed Projects
* Pending Projects
* Completion Percentage

### Consumed By

Global Dashboard KPI Cards

---

## View

### vw_confirmation_status

### Purpose

Provides confirmation status distribution.

### Metrics

* Confirmed Projects
* Yet To Be Confirmed Projects

### Consumed By

Confirmation Status Donut Chart

---

## View

### vw_vertical_ranking

### Purpose

Provides performance metrics grouped by vertical.

### Metrics

* Total Projects
* Confirmed Projects
* Pending Projects
* Completion Percentage

### Consumed By

Vertical Ranking Visuals

---

## View

### vw_pm_ranking

### Purpose

Provides project manager rankings.

### Metrics

* Total Projects
* Confirmed Projects
* Pending Projects
* Completion Percentage
* Ranking Position

### Consumed By

Race To 100 Leaderboard

---

## View

### vw_pm_vertical_summary

### Purpose

Provides PM performance within each vertical.

### Metrics

* Total Projects
* Confirmed Projects
* Pending Projects
* Completion Percentage

### Consumed By

Vertical Detail Page

---

## View

### vw_pm_detail

### Purpose

Provides project-level visibility for a selected PM.

### Columns

* Project ID
* Project Name
* PM Status

### Consumed By

PM Detail Page

---

## View

### vw_pm_master

### Purpose

Acts as the Project Manager dimension table.

### Design Reason

Power BI relationships require a unique Project Manager record.

This view ensures:

* One row per PM
* Stable relationships
* Reliable filter propagation

### Columns

* project_manager_id
* project_manager_name

### Consumed By

Power BI Relationships

---

# Relationship Model

## Primary Relationship

vw_pm_master

1

↓

Many

vw_pm_vertical_summary

---

## Secondary Relationship

vw_pm_master

1

↓

Many

vw_pm_detail

---

# Reporting Layer

The reporting layer consists of Power BI dashboards.

---

## Global Dashboard

Consumes:

* vw_dashboard_summary
* vw_confirmation_status
* vw_vertical_ranking
* vw_pm_ranking

---

## Vertical Detail Page

Consumes:

* vw_pm_vertical_summary

---

## PM Detail Page

Consumes:

* vw_pm_detail
* vw_pm_master

---

# Data Flow Summary

Oracle Fusion

↓

PM Confirmation Extract

↓

raw.current_pm_confirmation

↓

Analytics Views

↓

Power BI Model

↓

Dashboard Visuals

---

# Design Principles

## Source Data Preservation

Raw data remains unchanged.

---

## Business Logic Centralization

Business calculations are implemented in PostgreSQL views.

---

## Reporting Simplicity

Power BI consumes reporting-ready datasets.

---

## Single Source of Truth

All dashboard metrics originate from:

raw.current_pm_confirmation

ensuring consistency across reports.
