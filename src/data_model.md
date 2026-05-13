# Data Logic

## Overview

This project is built to track Project Manager progress and identify who reaches 100% completion first.

The system processes operational data step by step and converts it into a clean output that can be used for reporting in Power BI.

---

## Data Flow

The data moves through the following stages:

PM_CONFIRMATION → PM_History → PM_Ranking → Power BI

Each step performs a specific function to transform raw data into meaningful insights.

---

## PM_CONFIRMATION (Input Layer)

This is the main source table where the daily data is available.

It contains information about:
- Total number of projects assigned to each Project Manager
- Number of confirmed projects
- Pending projects
- Completion percentage
- Vertical information

This table shows the current state of data, but it does not store historical changes.

---

## PM_History (Snapshot Layer)

Since PM_CONFIRMATION only shows the latest state, we created a snapshot layer.

This table stores daily snapshots of the data along with a timestamp.

Purpose:
- Track how data changes over time
- Identify exactly when a Project Manager completed all projects
- Support time-based analysis

---

## Logic Layer (Power Pivot / DAX)

In this step, calculations are applied to the data using DAX.

Key metrics calculated:
- Total Projects
- Confirmed Projects
- Completion Percentage
- Pending Projects

All calculations are done at Project Manager level using proper filtering.

---

## Completion Logic

A Project Manager is considered complete when:

Confirmed Projects = Total Projects

Only when all assigned projects are confirmed, the PM is eligible for ranking.

---

## Completion Datetime

The system identifies the first time a Project Manager reaches 100% completion.

This is done using the snapshot data.

In simple terms:
- We scan all snapshots
- Find where completion becomes 100%
- Pick the earliest date/time

---

## PM_Ranking (Output Layer)

This is the final output table used for reporting.

It contains:
- Project Manager ID
- Total Projects
- Confirmed Projects
- Pending Projects
- Completion Percentage
- Completion Datetime
- Completion Rank

This table is clean, simple, and has no formulas.

---

## Power BI (Visualization Layer)

Power BI connects to the output table and creates the dashboard.

It shows:
- Winner (Rank 1)
- Top performers
- Performance breakdown
- Vertical-level insights

---

## Daily Process

The system runs in the following sequence:

1. Load new data into PM_CONFIRMATION
2. Take a snapshot into PM_History
3. Apply calculations
4. Generate PM_Ranking
5. Refresh Power BI dashboard

---

## Key Idea

The main idea of this system is:

- Use snapshots to track time
- Use calculations to determine completion
- Use a clean output to drive reporting

---

## Summary

This setup converts raw operational data into a structured output that can be used to identify top performers based on both completion time and workload.
