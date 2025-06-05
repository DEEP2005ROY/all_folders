/*Skills that are required for top paying data analyst roles?*/

with top_paying_jobs as(
SELECT
job_id,
job_title,
job_location,
job_schedule_type,
salary_year_avg,
job_posted_date,
name as company_name

FROM
job_postings_fact
LEFT JOIN company_dim on job_postings_fact.company_id=company_dim.company_id

where 
job_title_short='Data Analyst' AND
job_location='Anywhere' and 
salary_year_avg is NOT NULL


ORDER BY
salary_year_avg DESC
LIMIT 10
)

SELECT
top_paying_jobs.*,
skills
FROM top_paying_jobs
INNER JOIN skills_job_dim on top_paying_jobs.job_id=skills_job_dim.job_id
INNER JOIN skills_dim on skills_job_dim.skill_id=skills_dim.skill_id