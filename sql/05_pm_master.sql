CREATE OR REPLACE VIEW analytics.vw_pm_master
AS SELECT project_manager_id,
    min(project_manager_name::text)::character varying(255) AS project_manager_name
   FROM raw.current_pm_confirmation
  GROUP BY project_manager_id;
