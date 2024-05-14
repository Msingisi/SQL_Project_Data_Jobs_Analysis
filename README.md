# Introduction
Dive into the data job market! Focusing on data analyst roles specifically in South Africa, this project explores top-paying jobs, in-demand skills, and  where high demand meets high salary in data analytics.

🔍 SQL queries? Check them out here: [project_sql folder](/project_sql/)

# Background
### Project questions I wanted to answer through SQL queries were:
* What are the top-paying data analyst jobs?
* What skills are required for these top-paying jobs?
* What skills are most in demand for data analysts?
* Which skills are associated with higher salaries?
* What are the most optimal skills to learn?

# Tools I Used and Resources
For my deep dive into the data analyst job market, I harnessed the power of several key tools:
* **SQL:** The backbone of my analysis, allowing me to query the database and unearth critical insights.
* **PostgreSQL:** The chosen database management system, ideal for handling the job posting data.
* **Visual Studio Code:** My go-to for database management and executing SQL queries.

# The Analysis
### 1. Top Paying Data Analyst Jobs
To identify the highest-paying roles, I filtered data analyst positions by average yearly salary and location, focusing on remote jobs. This query highlights the high paying opportunities in the field.


```sql
SELECT	
	job_id,
	job_title,
	job_location,
	job_schedule_type,
	salary_year_avg,
	job_posted_date,
    name AS company_name
FROM
    job_postings_fact
LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
WHERE
    job_title_short = 'Data Analyst' AND 
    job_country = 'South Africa' AND 
    salary_year_avg IS NOT NULL
ORDER BY
    salary_year_avg DESC
LIMIT 10;
```

Here's the breakdown of the top data analyst jobs in 2023:

* **Wide Salary Range:** Top 10 paying data analyst roles span from from ZAR 100,500 to ZAR 165,000 per year, indicating significant salary potential in the field.
* **Diverse Employers:** Companies like Luno, Deloitte, Impact, takealot.com, Standard Bank Group, and Kuda Technologies Ltd are among those offering high salaries, showing a broad interest across different industries.
* **Job Title Variety:** The job titles reflect a variety of roles within the data field, from Data Analyst in different specializations (Insurance, Marketing, Growth) to Data Architect and Data Manager, showing a breadth of career paths available in the industry.

## 2. Skills for Top Paying Jobs
To understand what skills are required for the top-paying jobs, I joined the job postings with the skills data, providing insights into what employers value for high-compensation roles.

