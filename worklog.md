# Project Worklog 

 Day 1
* **Entry 1:** Initialized dbt project in dbt Cloud and connected to GitHub.
* **Entry 2:** Successfully linked BigQuery using a Service Account JSON key.
* **Entry 3:** Deleted boilerplate dbt example models to clean up the workspace.
* **Entry 4:** Created `_sources.yml` to define the GA4 public dataset connection.
* **Entry 5:** Developed `stg_ga4_events.sql` to clean timestamps and filter raw events. 
* **Entry 6:** Ran `dbt run` and confirmed the staging table materializes in BigQuery.