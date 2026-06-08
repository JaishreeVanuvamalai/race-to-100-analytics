create schema raw;
create schema analytics;
create table raw.current_pm_confirmation (
project_id VARCHAR(50),
project_name VARCHAR(255),
project_customer VARCHAR(255),
project_vertical VARCHAR(255),
project_execution_unit VARCHAR(255),
project_type VARCHAR(100),
project_status VARCHAR(100),
project_manager_id VARCHAR(50),
project_manager_name VARCHAR(255),
asdm_number VARCHAR(50),
asdm_name VARCHAR(255),
pm_status VARCHAR(50),
billing_cycle_start_date DATE,
billing_cycle_end_date DATE,
vertical VARCHAR(255),
unit VARCHAR(255),
commercial_model VARCHAR(100)
);
create table raw.fact_pm_history(
project_id VARCHAR(50),
project_name VARCHAR(255),
project_customer VARCHAR(255),
project_vertical VARCHAR(255),
project_execution_unit VARCHAR(255),
project_type VARCHAR(100),
project_status VARCHAR(100),
project_manager_id VARCHAR(50),
project_manager_name VARCHAR(255),
asdm_number VARCHAR(50),
asdm_name VARCHAR(255),
pm_status VARCHAR(50),
billing_cycle_start_date DATE,
billing_cycle_end_date DATE,
vertical VARCHAR(255),
unit VARCHAR(255),
commercial_model VARCHAR(100),
snapshot_datetime TEXT
);
