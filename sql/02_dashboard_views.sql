CREATE OR REPLACE VIEW analytics.vw_dashboard_summary
AS SELECT count(*) AS total_projects,
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
        END)::numeric * 100.0 / count(*)::numeric, 2) AS confirmation_percentage,
    CURRENT_TIMESTAMP AS last_refresh_time
   FROM raw.current_pm_confirmation;

CREATE OR REPLACE VIEW analytics.vw_confirmation_status
AS SELECT 'Confirmed'::text AS status,
    count(*) AS project_count
   FROM raw.current_pm_confirmation
  WHERE current_pm_confirmation.pm_status::text = 'Confirmed'::text
UNION ALL
 SELECT 'Yet to be confirmed'::text AS status,
    count(*) AS project_count
   FROM raw.current_pm_confirmation
  WHERE current_pm_confirmation.pm_status::text = 'Yet to be confirmed'::text;
