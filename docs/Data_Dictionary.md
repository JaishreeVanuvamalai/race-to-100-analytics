# Data Dictionary

## Overview

This document describes the primary data elements used within the PM Confirmation Dashboard.

The data originates from Oracle Fusion report extracts and is transformed through PostgreSQL analytics views before being consumed by Power BI.

---

# Source Table

## raw.current_pm_confirmation

### Description

Stores project confirmation data imported from Oracle Fusion extracts.

---

## Column Definitions

| Column Name          | Description                               | Example     |
| -------------------- | ----------------------------------------- | ----------- |
| project_id           | Unique project identifier                 | P1001       |
| project_name         | Project name                              | ERP Upgrade |
| vertical             | Business vertical                         | Finance     |
| project_manager_id   | Unique Project Manager identifier         | PM001       |
| project_manager_name | Project Manager name                      | John Smith  |
| pm_status            | Confirmation status                       | Confirmed   |
| snapshot_date*       | Data extraction date (future enhancement) | 2026-06-08  |

*Future enhancement for historical tracking.

---

# Business Definitions

## Total Projects

Definition:

Total number of projects available within the selected reporting context.

Formula:

COUNT(*)

---

## Confirmed Projects

Definition:

Projects with confirmation status:

Confirmed

Formula:

SUM(CASE WHEN pm_status='Confirmed' THEN 1 ELSE 0 END)

---

## Pending Projects

Definition:

Projects with confirmation status:

Yet to be confirmed

Formula:

SUM(CASE WHEN pm_status='Yet to be confirmed' THEN 1 ELSE 0 END)

---

## Completion Percentage

Definition:

Percentage of confirmed projects.

Formula:

Confirmed Projects ÷ Total Projects × 100

---

# Analytics Views

## vw_dashboard_summary

Purpose:

Provides executive KPI metrics.

Contains:

* Total Projects
* Confirmed Projects
* Pending Projects
* Completion Percentage

---

## vw_confirmation_status

Purpose:

Provides status distribution data.

Contains:

* Confirmed Projects
* Pending Projects

---

## vw_vertical_ranking

Purpose:

Provides vertical-level performance metrics.

Contains:

* Vertical
* Total Projects
* Confirmed Projects
* Pending Projects
* Completion Percentage

---

## vw_pm_ranking

Purpose:

Provides PM-level performance metrics.

Contains:

* Project Manager
* Total Projects
* Confirmed Projects
* Pending Projects
* Completion Percentage

---

## vw_pm_vertical_summary

Purpose:

Provides PM performance within a selected vertical.

Contains:

* Vertical
* Project Manager
* Total Projects
* Confirmed Projects
* Pending Projects
* Completion Percentage

---

## vw_pm_detail

Purpose:

Provides project-level details for a selected Project Manager.

Contains:

* Project ID
* Project Name
* PM Status

---

## vw_pm_master

Purpose:

Project Manager dimension table.

Contains:

* Project Manager ID
* Project Manager Name

Used for:

* Relationships
* Drill-through navigation
* Filter propagation

---

# Status Definitions

| Status              | Meaning                                           |
| ------------------- | ------------------------------------------------- |
| Confirmed           | Project has been confirmed by the Project Manager |
| Yet to be confirmed | Project confirmation is still pending             |

---

# Reporting Hierarchy

Organization

↓

Vertical

↓

Project Manager

↓

Project

This hierarchy drives navigation and drill-through behavior throughout the dashboard.
