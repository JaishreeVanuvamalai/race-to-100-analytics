CREATE OR REPLACE VIEW analytics.vw_vertical_ranking
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
        END)::numeric * 100.0 / count(*)::numeric, 2) AS completion_percentage,
    rank() OVER (ORDER BY (round(sum(
        CASE
            WHEN pm_status::text = 'Confirmed'::text THEN 1
            ELSE 0
        END)::numeric * 100.0 / count(*)::numeric, 2)) DESC) AS vertical_rank
   FROM raw.current_pm_confirmation
  GROUP BY vertical;

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
