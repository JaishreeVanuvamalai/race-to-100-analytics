# Power BI Design

## Overview

Power BI serves as the presentation layer of the PM Confirmation Dashboard.

The report consumes reporting-ready datasets from PostgreSQL and provides interactive dashboards for executive reporting, vertical analysis, and project manager performance monitoring.

The design follows a hierarchical navigation model:

Organization

↓

Vertical

↓

Project Manager

↓

Project

This structure allows users to progressively drill into the data while maintaining context.

---

# Dashboard Structure

The dashboard consists of three primary reporting pages.

1. Global Dashboard

2. Vertical Detail

3. Project Manager Detail

---

# Page 1 – Global Dashboard

## Purpose

Provide an executive-level overview of project confirmation performance across the organization.

---

## KPI Cards

### Total Projects

Displays:

Total number of projects currently tracked.

Source:

vw_dashboard_summary

---

### Confirmed Projects

Displays:

Projects with status:

Confirmed

Source:

vw_dashboard_summary

---

### Pending Projects

Displays:

Projects with status:

Yet to be confirmed

Source:

vw_dashboard_summary

---

### Completion Percentage

Displays:

Overall confirmation completion percentage.

Formula:

Confirmed Projects

÷

Total Projects

×

100

Source:

vw_dashboard_summary

---

## Confirmation Status Visual

### Type

Donut Chart

### Purpose

Display distribution of:

* Confirmed Projects
* Yet To Be Confirmed Projects

Source:

vw_confirmation_status

---

## Vertical Ranking Visual

### Type

Horizontal Bar Chart

### Purpose

Compare completion percentage across business verticals.

Source:

vw_vertical_ranking

### Sort Order

Descending Completion Percentage

### Interaction

Supports drill-through to Vertical Detail page.

---

## Race To 100 Visual

### Type

Horizontal Bar Chart

### Purpose

Display Project Manager completion rankings.

Source:

vw_pm_ranking

### Sort Order

Descending Completion Percentage

### Interaction

Supports drill-through to PM Detail page.

---

# Page 2 – Vertical Detail

## Purpose

Provide detailed visibility into a selected business vertical.

Accessed through drill-through from:

Global Dashboard

---

## Filter Context

Selected Vertical

---

## KPI Cards

### Total Projects

Source:

vw_pm_vertical_summary

---

### Confirmed Projects

Source:

vw_pm_vertical_summary

---

### Pending Projects

Source:

vw_pm_vertical_summary

---

### Completion Percentage

Source:

vw_pm_vertical_summary

---

## Project Manager Performance Table

### Purpose

Display Project Manager performance within the selected vertical.

### Columns

* Project Manager
* Total Projects
* Confirmed Projects
* Pending Projects
* Completion Percentage

Source:

vw_pm_vertical_summary

---

## Interaction

Supports drill-through to PM Detail page.

---

# Page 3 – PM Detail

## Purpose

Provide project-level visibility for a selected Project Manager.

Accessed through drill-through from:

* Global Dashboard
* Vertical Detail Page

---

## Filter Context

Selected Project Manager

---

## KPI Cards

### Total Projects

Source:

vw_pm_vertical_summary

---

### Confirmed Projects

Source:

vw_pm_vertical_summary

---

### Pending Projects

Source:

vw_pm_vertical_summary

---

### Completion Percentage

Source:

vw_pm_vertical_summary

---

## Project Detail Table

### Purpose

Display all projects assigned to the selected Project Manager.

### Columns

* Project ID
* Project Name
* PM Status

Source:

vw_pm_detail

---

# Navigation Design

## Navigation Flow

Global Dashboard

↓

Vertical Detail

↓

PM Detail

↓

Project Visibility

---

## Benefits

* Progressive analysis
* Reduced visual clutter
* Improved user experience
* Executive-friendly design

---

# Design Decisions

## KPI Calculations

KPI calculations are performed in PostgreSQL.

Power BI displays results without recalculating business logic.

Reason:

Maintain a single source of truth.

---

## Drill-Through Design

Drill-through was selected instead of multiple filters because it:

* Preserves context
* Improves usability
* Simplifies navigation

---

## Relationship Design

A dedicated PM dimension:

vw_pm_master

was created to support reliable filter propagation and drill-through behavior.

---

## Color Design

Gradient-based conditional formatting was applied to ranking visuals.

Purpose:

* Improve readability
* Highlight top performers
* Improve executive consumption

---

# Performance Considerations

Several measures were taken to improve report performance.

### SQL Aggregation

Aggregation occurs within PostgreSQL.

---

### Lightweight Visuals

Visuals consume summarized datasets whenever possible.

---

### Controlled Relationships

Relationships were simplified to reduce filter ambiguity.

---

# Future Enhancements

## PM History Tracking

Future versions will include:

Historical PM performance trends.

---

## Trend Reporting

Potential additions:

* Weekly Progress
* Monthly Progress
* Velocity Analysis

---

## Upload Utility Integration

Future versions may support direct dataset refresh through a user upload interface.

---

# Design Principles

The dashboard was designed around four principles:

1. Simplicity

2. Scalability

3. Maintainability

4. Business Usability

The objective was to provide actionable insights while minimizing complexity for end users.
