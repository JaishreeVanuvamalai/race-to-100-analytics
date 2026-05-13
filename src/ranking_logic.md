# Ranking Logic

## Overview

This project ranks Project Managers based on how quickly they complete all their assigned projects.

The ranking is designed to be fair and consistent, considering both:
- Completion time
- Workload handled

---

## Completion Rule

A Project Manager is considered fully complete when:

Confirmed Projects = Total Projects

Only after reaching 100% completion is a PM included in the ranking.

---

## Ranking Criteria

The ranking is based on two conditions:

### 1. Completion Datetime (Primary)

- The PM who completes first gets the highest rank
- Earlier completion = better rank

---

### 2. Total Projects (Secondary)

- If multiple PMs complete at the same time,
- The PM with more total projects gets a better rank

---

## Simple Explanation

Ranking is done like this:

1. First compare completion time
2. If completion time is same, compare number of projects
3. Assign ranks in order

---

## Example

| PM | Completion Date | Projects | Rank |
|----|-----------------|----------|------|
| PM_01 | 22-Apr | 10 | 1 |
| PM_02 | 22-Apr | 5  | 2 |
| PM_03 | 23-Apr | 8  | 3 |

Explanation:
- PM_01 and PM_02 completed on same day
- PM_01 had more projects → gets Rank 1
- PM_03 completed later → gets Rank 3

---

## How Completion Time is Found

The system uses snapshot data to determine when a PM reached full completion.

Steps:
- Look at all historical snapshots
- Find when Completion % becomes 100%
- Take the earliest timestamp

---

## Important Fix Applied

### Problem

Initially, ranking started from values like:
20, 21, 22 instead of 1

### Reason

The ranking calculation included all Project Managers, even those who had not completed their work.

---

### Solution

Ranking was restricted to only those PMs who have:

Completion % = 100%

---

### Result

- Ranking now starts from 1
- No incorrect gaps
- Only completed PMs are ranked

---

## Tie Handling

If multiple PMs:
- Complete at the same time
- Have the same number of projects

Then:
- They will share the same rank

---

## Final Logic in Simple Terms

Ranking is based on:

1. Who finished first
2. Who handled more work

---

## Summary

This ranking system ensures that:
- Faster completion is rewarded
- Higher workload is recognized
- Results are fair and consistent
