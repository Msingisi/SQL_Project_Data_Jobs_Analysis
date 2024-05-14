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

```sql
WITH top_paying_jobs AS (
    SELECT	
        job_id,
        job_title,
        salary_year_avg,
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
    LIMIT 10
)

SELECT 
    top_paying_jobs.*,
    skills
FROM top_paying_jobs
INNER JOIN skills_job_dim ON top_paying_jobs.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
ORDER BY
    salary_year_avg DESC;
```

* **SQL** Appears in almost every job posting, indicating its fundamental importance in data analysis.
* **Python** Highly sought after, reflecting its versatility and popularity in data analysis and automation.
* **Excel** Still a staple skill, showing the ongoing need for spreadsheet proficiency.

## 3. In-Demand Skills for Data Analysts
This query helped identify the skills most frequently requested in job postings, directing focus to areas with high demand.

```sql
SELECT 
    skills,
    COUNT(skills_job_dim.job_id) AS demand_count
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst' AND
    job_country = 'South Africa'
GROUP BY
    skills
ORDER BY
    demand_count DESC
LIMIT 10;
```
* The high demand for **SQL** and **Excel** suggests that businesses value the ability to handle and analyze data at a fundamental level.
* **Python’s** popularity underscores its importance in more advanced data manipulation, analysis, and machine learning tasks.
* The presence of **Power BI**, **SAS**, and **Tableau** indicates a strong market for professionals who can turn data into actionable insights through visualization.
* Cloud platforms like **Azure** and **AWS** are essential for modern data workflows, and their growing demand reflects the shift towards cloud-based solutions.
* **SAP’s** demand, while lower, points to its niche role in enterprise resource planning and data processing.

| Skill    | Demand Count |
|----------|--------------|
| SQL      | 1342         |
| Excel    | 823          |
| Python   | 676          |
| Power BI | 526          |
| SAS      | 444          |
| R        | 428          |
| Tableau  | 342          |
| Azure    | 216          |
| AWS      | 204          |
| SAP      | 203          |

*Table of the demand for the top 10 skills in data analyst job postings*

## 4. Skills Based on Salary
Exploring the average salaries associated with different skills revealed which skills are the highest paying.

```sql
SELECT 
    skills,
    ROUND(AVG(salary_year_avg), 0) AS avg_salary
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst' AND
    job_country = 'South Africa' AND
    salary_year_avg IS NOT NULL
GROUP BY
    skills
ORDER BY
    avg_salary DESC
LIMIT 25;
```

## 5.1. Most Optimal Skills to Learn
Combining insights from demand and salary data, this query aimed to pinpoint skills that are both in high demand and have high salaries, offering a strategic focus for skill development.

```sql
SELECT 
    skills_dim.skill_id,
    skills_dim.skills,
    COUNT(skills_job_dim.job_id) AS demand_count,
    ROUND(AVG(job_postings_fact.salary_year_avg), 0) AS avg_salary
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst'
    AND salary_year_avg IS NOT NULL 
    AND job_country = 'South Africa'
GROUP BY
    skills_dim.skill_id
HAVING
    COUNT(skills_job_dim.job_id) != 1
ORDER BY
    avg_salary DESC,
    demand_count DESC
LIMIT 25;
```

## 5.2. Most Optimal Skills to Learn
Combining insights from demand and salary data, this query aimed to pinpoint skills that are both in high demand and have high salaries, offering a strategic focus for skill development.

```sql
SELECT 
    skills_dim.skill_id,
    skills_dim.skills,
    COUNT(skills_job_dim.job_id) AS demand_count,
    ROUND(AVG(job_postings_fact.salary_year_avg), 0) AS avg_salary
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst'
    AND salary_year_avg IS NOT NULL
    AND job_work_from_home = True 
GROUP BY
    skills_dim.skill_id
HAVING
    COUNT(skills_job_dim.job_id) > 10
ORDER BY
    avg_salary DESC,
    demand_count DESC
LIMIT 25;
```
