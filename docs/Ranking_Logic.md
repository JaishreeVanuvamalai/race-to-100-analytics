# Ranking Logic

## Overview

The PM Confirmation Dashboard uses ranking mechanisms to identify high-performing business verticals and project managers based on project confirmation progress.

The ranking framework enables stakeholders to:

* Compare performance
* Identify leaders
* Identify lagging areas
* Monitor progress toward organizational goals

---

# Ranking Philosophy

The objective of ranking is not simply to count projects.

The objective is to measure confirmation progress.

The ranking framework focuses on:

* Completion Percentage
* Confirmation Status
* Progress Tracking

rather than raw project volume.

---

# Vertical Ranking

## Purpose

Measure confirmation performance across business verticals.

---

## Metrics Used

Each vertical is evaluated using:

* Total Projects
* Confirmed Projects
* Pending Projects
* Completion Percentage

---

## Primary Ranking Metric

Completion Percentage

Formula:

Confirmed Projects

÷

Total Projects

×

100

---

## Example

| Vertical   | Total Projects | Confirmed | Completion % |
| ---------- | -------------- | --------- | ------------ |
| Finance    | 100            | 95        | 95%          |
| HR         | 100            | 90        | 90%          |
| Operations | 100            | 80        | 80%          |

Ranking:

1. Finance
2. HR
3. Operations

---

## Business Value

Vertical rankings allow leadership teams to:

* Monitor adoption
* Identify risk areas
* Prioritize follow-ups

---

# Project Manager Ranking

## Purpose

Measure confirmation performance at the Project Manager level.

---

## Metrics Used

Each PM is evaluated using:

* Total Projects
* Confirmed Projects
* Pending Projects
* Completion Percentage

---

## Primary Ranking Metric

Completion Percentage

Formula:

Confirmed Projects

÷

Total Projects

×

100

---

## Example

| PM   | Total Projects | Confirmed | Completion % |
| ---- | -------------- | --------- | ------------ |
| PM A | 20             | 20        | 100%         |
| PM B | 20             | 18        | 90%          |
| PM C | 20             | 15        | 75%          |

Ranking:

1. PM A
2. PM B
3. PM C

---

## Business Value

Project Manager rankings help:

* Recognize high performers
* Identify coaching opportunities
* Monitor accountability

---

# Race To 100

## Purpose

Provide a leaderboard view of Project Manager progress toward full project confirmation.

---

## Concept

The Race To 100 visual tracks completion percentage rather than absolute project counts.

The objective is:

100% Confirmation

for all assigned projects.

---

## Why Race To 100?

A Project Manager with:

100%

confirmation rate

has achieved the target regardless of project volume.

The visual focuses attention on completion rather than workload size.

---

## Benefits

* Easy to understand
* Encourages accountability
* Highlights leaders
* Highlights pending work

---

# Ranking Data Sources

## Vertical Ranking

Source View:

vw_vertical_ranking

---

## PM Ranking

Source View:

vw_pm_ranking

---

## Vertical PM Ranking

Source View:

vw_pm_vertical_summary

---

# Tie Handling

Current Version

Version 2.0

Rankings are ordered using:

1. Completion Percentage

Future versions may include secondary ranking criteria such as:

* Number of Confirmed Projects
* Earliest Completion Date
* Historical Progress Rate

---

# Current Ranking Framework

## Vertical Ranking

Primary Metric:

Completion Percentage

---

## PM Ranking

Primary Metric:

Completion Percentage

---

## Race To 100

Primary Metric:

Completion Percentage

---

# Future Enhancements

## Historical Rankings

Using:

fact_pm_history

Future versions will support:

* Weekly Rankings
* Monthly Rankings
* Trend-Based Rankings

---

## Velocity Rankings

Future versions may calculate:

Projects Confirmed Per Week

allowing stakeholders to identify the fastest-improving Project Managers.

---

## Predictive Rankings

Potential future enhancements include:

* Completion Forecasting
* Risk Scoring
* Target Achievement Prediction

---

# Design Principles

The ranking framework was designed around three principles:

1. Simplicity

2. Transparency

3. Business Relevance

The objective is to provide rankings that are easy to understand, easy to validate, and directly aligned with business goals.
