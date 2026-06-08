CREATE OR REPLACE VIEW analytics.vw_pm_detail
AS SELECT project_manager_id,
    project_manager_name,
    pm_status,
    project_id,
    project_name
   FROM raw.current_pm_confirmation;

CREATE OR REPLACE VIEW analytics.vw_pm_ranking
AS SELECT project_manager_id,
    project_manager_name,
    completion_datetime,
    row_number() OVER (ORDER BY completion_datetime) AS completion_rank
   FROM ( SELECT ranked.project_manager_id,
            min(ranked.project_manager_name::text) AS project_manager_name,
            min(ranked.completion_datetime) AS completion_datetime
           FROM ( SELECT p.project_manager_id,
                    p.project_manager_name,
                    min(p.snapshot_datetime) AS completion_datetime
                   FROM analytics.vw_pm_snapshot_progress p
                     JOIN ( SELECT DISTINCT current_pm_confirmation.project_manager_id
                           FROM raw.current_pm_confirmation) c ON p.project_manager_id::text = c.project_manager_id::text
                  WHERE p.completion_percentage = 100::numeric
                  GROUP BY p.project_manager_id, p.project_manager_name) ranked
          GROUP BY ranked.project_manager_id) final_ranked;

CREATE OR REPLACE VIEW analytics.vw_pm_summary
AS SELECT project_manager_id,
    project_manager_name,
    count(*) AS total_projects,
    sum(
        CASE
            WHEN pm_status::text = 'Confirmed'::text THEN 1
            ELSE 0
        END) AS confirmed_projects,
    sum(
        CASE
            WHEN pm_status::text = 'Yet to be confirmed'::text THEN 1
            ELSE 0
        END) AS pending_projects,
    round(sum(
        CASE
            WHEN pm_status::text = 'Confirmed'::text THEN 1
            ELSE 0
        END)::numeric * 100.0 / count(*)::numeric, 2) AS completion_percentage
   FROM raw.current_pm_confirmation cpc
  GROUP BY project_manager_id, project_manager_name;

CREATE OR REPLACE VIEW analytics.vw_vertical_summary
AS SELECT vertical,
    count(*) AS total_projects,
    sum(
        CASE
            WHEN pm_status::text = 'Confirmed'::text THEN 1
            ELSE 0
        END) AS confirmed_projects,
    sum(
        CASE
            WHEN pm_status::text = 'Yet to be confirmed'::text THEN 1
            ELSE 0
        END) AS pending_projects,
    round(sum(
        CASE
            WHEN pm_status::text = 'Confirmed'::text THEN 1
            ELSE 0
        END)::numeric * 100.0 / count(*)::numeric, 2) AS completion_percentage
   FROM raw.current_pm_confirmation cpc
  GROUP BY vertical;

CREATE OR REPLACE VIEW analytics.vw_pm_snapshot_progress
AS SELECT snapshot_datetime,
    project_manager_id,
    project_manager_name,
    count(*) AS total_projects,
    sum(
        CASE
            WHEN pm_status::text = 'Confirmed'::text THEN 1
            ELSE 0
        END) AS confirmed_projects,
    sum(
        CASE
            WHEN pm_status::text = 'Yet to be confirmed'::text THEN 1
            ELSE 0
        END) AS pending_projects,
    round(sum(
        CASE
            WHEN pm_status::text = 'Confirmed'::text THEN 1
            ELSE 0
        END)::numeric * 100.0 / count(*)::numeric, 2) AS completion_percentage
   FROM analytics.fact_pm_history_clean fphc
  GROUP BY snapshot_datetime, project_manager_id, project_manager_name;
