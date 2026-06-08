create schema raw;
create schema analytics;
CREATE TABLE raw.current_pm_confirmation (
	project_id varchar(50) NULL,
	project_name varchar(255) NULL,
	project_customer varchar(255) NULL,
	project_vertical varchar(255) NULL,
	project_execution_unit varchar(255) NULL,
	project_type varchar(100) NULL,
	project_status varchar(100) NULL,
	project_manager_id varchar(50) NULL,
	project_manager_name varchar(255) NULL,
	asdm_number varchar(50) NULL,
	asdm_name varchar(255) NULL,
	pm_status varchar(50) NULL,
	billing_cycle_start_date date NULL,
	billing_cycle_end_date date NULL,
	vertical varchar(255) NULL,
	unit varchar(255) NULL,
	commercial_model varchar(100) NULL
);
CREATE TABLE raw.fact_pm_history (
	project_id varchar(50) NULL,
	project_name varchar(255) NULL,
	project_customer varchar(255) NULL,
	project_vertical varchar(255) NULL,
	project_execution_unit varchar(255) NULL,
	project_type varchar(100) NULL,
	project_status varchar(100) NULL,
	project_manager_id varchar(50) NULL,
	project_manager_name varchar(255) NULL,
	asdm_number varchar(50) NULL,
	asdm_name varchar(255) NULL,
	pm_status varchar(50) NULL,
	billing_cycle_start_date date NULL,
	billing_cycle_end_date date NULL,
	vertical varchar(255) NULL,
	unit varchar(255) NULL,
	commercial_model varchar(100) NULL,
	snapshot_datetime text NULL
);
