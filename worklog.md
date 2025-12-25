# Project Worklog 

 Day 1
* **Entry 1:** Initialized dbt project in dbt Cloud and connected to GitHub.
* **Entry 2:** Successfully linked BigQuery using a Service Account JSON key.
* **Entry 3:** Deleted boilerplate dbt example models to clean up the workspace.
* **Entry 4:** Created `_sources.yml` to define the GA4 public dataset connection.
* **Entry 5:** Developed `stg_ga4_events.sql` to clean timestamps and filter raw events. 
* **Entry 6:** Ran `dbt run` and confirmed the staging table materializes in BigQuery.
* **Entry 7:** Created marts folder to house core business logic.
* **Entry 8:** Developed fct_attribution_first_click using ROW_NUMBER() window function to isolate the earliest marketing touchpoint for each user.
* **Entry 9:** Verified first-click logic by previewing data results in dbt Cloud IDE.
* **Entry 10* **: Developed fct_attribution_last_click using ORDER BY event_timestamp DESC.
* **Entry 11* **: Compared First-Click and Last-Click results to ensure the logic correctly identifies different touchpoints for multi-session users.
* **Entry 12* **: Documented project assumptions regarding tie-breaking and lookback windows for the final README.