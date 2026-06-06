# SQL Design

## Overview

The PM Confirmation Dashboard uses PostgreSQL as the central analytics engine.

Rather than implementing business logic inside Power BI, calculations are centralized within SQL views to ensure consistency, maintainability, and scalability.

The SQL layer acts as the foundation of the reporting platform.

---

# Design Philosophy

The project follows a simple principle:

**SQL Calculates. Power BI Presents.**

Business logic should exist as close to the data as possible.

This ensures:

* Consistent calculations
* Easier validation
* Easier troubleshooting
* Simplified reporting

---

# Analytics Layer Architecture

The SQL design follows a layered architecture.

## Layer 1

### Raw Data Layer

Purpose:

Store source data exactly as received from Oracle Fusion.

Example:

raw.current_pm_confirmation

Characteristics:

* No calculations
* No transformations
* No aggregations

This layer serves as the system of record for reporting.

---

## Layer 2

### Analytics Layer

Purpose:

Transform raw data into reporting-ready datasets.

Implemented using:

* SQL Views
* Aggregations
* Ranking Logic
* KPI Calculations

Examples:

vw_dashboard_summary

vw_vertical_ranking

vw_pm_ranking

vw_pm_vertical_summary

---

## Layer 3

### Reporting Layer

Purpose:

Provide simplified datasets for Power BI consumption.

Benefits:

* Reduced Power BI complexity
* Faster report development
* Easier maintenance

---

# Why PostgreSQL?

Several database options were considered.

---

## PostgreSQL

Selected because it provides:

* Strong SQL support
* Robust view functionality
* Excellent Power BI integration
* Open-source licensing
* High scalability
* Mature ecosystem

---

## Why Not SQLite?

SQLite is excellent for lightweight applications but has limitations for analytical workloads:

* Limited scalability
* Single-file architecture
* Limited multi-user support

The project required a platform capable of supporting future growth.

---

## Why Not Microsoft Access?

Access was considered during the early design phase.

Advantages:

* Familiar interface
* Easier migration from Excel

Limitations:

* Dataset size constraints
* Limited scalability
* Reduced enterprise adoption

PostgreSQL provided a stronger long-term architecture.

---

# Why Views Instead of Physical Tables?

The analytics layer is implemented primarily using views.

---

## Benefits of Views

### Centralized Logic

Business rules exist in one location.

---

### Easier Maintenance

Changes can be applied without rebuilding datasets.

---

### Reduced Duplication

Multiple reports can consume the same view.

---

### Simplified Validation

Calculations can be verified directly in SQL.

---

# Key Design Decisions

## Decision 1

### Centralized KPI Calculations

KPI calculations were intentionally implemented in SQL.

Examples:

* Total Projects
* Confirmed Projects
* Pending Projects
* Completion Percentage

Reason:

Every dashboard visual should reference the same calculation logic.

---

## Decision 2

### Aggregation Before Power BI

Aggregation occurs inside SQL wherever possible.

Example:

Vertical Rankings

Project Manager Rankings

Reason:

Power BI should consume reporting-ready datasets.

---

## Decision 3

### PM Dimension Creation

A dedicated Project Manager dimension view was created.

View:

vw_pm_master

Reason:

Power BI relationships require unique keys on the "one" side of a relationship.

This view ensures:

* One PM per row
* Stable relationships
* Reliable drill-through behavior

---

# View Categories

## KPI Views

Purpose:

Executive reporting.

Examples:

vw_dashboard_summary

vw_confirmation_status

---

## Ranking Views

Purpose:

Performance comparison.

Examples:

vw_vertical_ranking

vw_pm_ranking

---

## Detail Views

Purpose:

Drill-through reporting.

Examples:

vw_pm_vertical_summary

vw_pm_detail

---

## Dimension Views

Purpose:

Relationship management.

Examples:

vw_pm_master

---

# Performance Considerations

Several measures were taken to improve performance.

---

## Reporting Views

Views were designed to return aggregated results whenever possible.

This reduces the volume of data consumed by Power BI.

---

## Reusable Logic

Common calculations are reused across multiple reporting views.

This reduces maintenance effort.

---

## Filter-Friendly Design

Views were structured to support Power BI filtering and drill-through operations.

---

# Validation Strategy

Every view underwent validation against source data.

Checks included:

* Record Counts
* Status Counts
* Vertical Counts
* PM Counts
* Completion Percentages

Only validated views were promoted for reporting use.

---

# Future SQL Enhancements

## Historical Snapshot Table

Planned:

fact_pm_history

Purpose:

Store daily snapshots of PM confirmation status.

---

## Automated Snapshot Generation

Future automation will eliminate the need for manual history maintenance.

---

## Trend Analytics

Historical datasets will enable:

* Weekly Trends
* Monthly Trends
* Completion Velocity Analysis

---

# SQL Design Principles

The SQL layer was designed around four principles:

1. Preserve Source Data

2. Centralize Business Logic

3. Simplify Reporting

4. Enable Future Scalability

These principles guided all architectural decisions throughout Version 2.0 of the PM Confirmation Dashboard.
