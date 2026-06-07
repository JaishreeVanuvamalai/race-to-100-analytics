# Validation Guide

## Overview

The PM Confirmation Dashboard was validated at multiple stages to ensure consistency between:

* Oracle Fusion Report Extracts
* PostgreSQL Analytics Views
* Power BI Dashboard Outputs

The objective was to guarantee that business users receive accurate and reliable reporting.

---

# Validation Strategy

Validation was performed in three stages.

## Stage 1

Source Data Validation

---

## Stage 2

SQL View Validation

---

## Stage 3

Power BI Validation

---

# Stage 1 – Source Data Validation

## Objective

Ensure imported PostgreSQL data matched the Oracle Fusion extract.

---

## Validation Checks

### Record Count Validation

Check:

Total records imported into:

raw.current_pm_confirmation

must match source file record count.

---

### Project Count Validation

Check:

Distinct project count matches source file.

---

### Vertical Validation

Check:

All expected verticals are present.

---

### PM Validation

Check:

All expected Project Managers are present.

---

### Status Validation

Check:

Only valid PM Status values exist.

Expected values:

Confirmed

Yet to be confirmed

---

# Stage 2 – SQL View Validation

## Objective

Ensure SQL views produce correct business metrics.

---

# KPI Validation

## Total Projects

Formula:

COUNT(*)

Validation:

Compare against source dataset.

---

## Confirmed Projects

Formula:

SUM(
CASE
WHEN pm_status='Confirmed'
THEN 1
ELSE 0
END
)

Validation:

Compare against source dataset.

---

## Pending Projects

Formula:

SUM(
CASE
WHEN pm_status='Yet to be confirmed'
THEN 1
ELSE 0
END
)

Validation:

Compare against source dataset.

---

## Completion Percentage

Formula:

Confirmed Projects

÷

Total Projects

×

100

Validation:

Manual calculation using source data.

---

# Vertical Validation

## Objective

Verify vertical-level metrics.

Checks:

* Total Projects
* Confirmed Projects
* Pending Projects
* Completion Percentage

Validation Method:

Cross-check against source data using vertical filters.

---

# PM Validation

## Objective

Verify PM-level metrics.

Checks:

* Total Projects
* Confirmed Projects
* Pending Projects
* Completion Percentage

Validation Method:

Cross-check against source data using PM filters.

---

# Ranking Validation

## Objective

Ensure rankings reflect completion percentage correctly.

Checks:

* PM Ranking Order
* Vertical Ranking Order

Validation Method:

Manual sorting of source data.

---

# Stage 3 – Power BI Validation

## Objective

Verify Power BI visuals display correct results.

---

# KPI Card Validation

## Checks

Global Dashboard

* Total Projects
* Confirmed Projects
* Pending Projects
* Completion Percentage

Compared Against:

vw_dashboard_summary

---

# Visual Validation

## Confirmation Status Chart

Validation:

Chart totals must match KPI values.

---

## Vertical Ranking Visual

Validation:

Bar chart values must match:

vw_vertical_ranking

---

## Race To 100 Visual

Validation:

Bar chart values must match:

vw_pm_ranking

---

# Drill-Through Validation

## Vertical Detail

Validation:

Selected vertical displays only relevant PMs.

---

## PM Detail

Validation:

Selected PM displays only assigned projects.

---

## Project Table

Validation:

Projects displayed must match source data.

---

# Relationship Validation

## Objective

Ensure Power BI filter propagation works correctly.

---

## PM Master Relationship

View:

vw_pm_master

Validation:

One unique row per PM.

Checks:

COUNT(*)

=

COUNT(DISTINCT project_manager_id)

---

## Relationship Integrity

Validation:

Filters correctly propagate between:

vw_pm_master

↓

vw_pm_vertical_summary

↓

vw_pm_detail

---

# Issues Encountered During Validation

## Issue 1

### Confirmed Projects Returned 0

Cause:

Status values were not matching expected conditions.

Investigation:

Validated distinct values from source data.

Resolution:

Confirmed values:

Confirmed

Yet to be confirmed

Updated SQL logic accordingly.

---

## Issue 2

### Completion Percentage Returned Incorrect Values

Observed:

Unexpected percentages displayed.

Cause:

Incorrect aggregation logic.

Resolution:

Revalidated formula using source data and corrected calculation.

---

## Issue 3

### Duplicate PM Relationship Error

Observed:

Power BI relationship creation failed.

Cause:

Project Manager table contained duplicate PM records.

Resolution:

Created:

vw_pm_master

with one row per Project Manager.

---

## Issue 4

### KPI Cards Not Updating

Observed:

Drill-through page displayed incorrect KPI values.

Cause:

Relationship and filter propagation issues.

Resolution:

Validated relationships and adjusted visual data sources.

---

## Issue 5

### Drill-Through Table Not Updating

Observed:

Project table displayed incorrect records.

Cause:

Filter context was not reaching the detail table.

Resolution:

Implemented dedicated PM dimension and validated relationships.

---

# Validation Success Criteria

The dashboard is considered validated when:

✓ Record Counts Match

✓ KPI Values Match

✓ Rankings Match

✓ Drill-Through Works

✓ Relationships Function Correctly

✓ Visual Totals Match SQL Outputs

---

# Validation Principle

Every business metric displayed in Power BI must be traceable back to:

raw.current_pm_confirmation

This ensures a single source of truth throughout the reporting platform.
