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
* **Luke Barousse SQL Course:** https://www.lukebarousse.com/sql
* **Luke Barousse:** https://www.youtube.com/watch?v=7mz73uXD9DA&t=7392s

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

| Job ID   | Job Title                         | Average Salary (ZAR) |
|----------|-----------------------------------|----------------------|
| 327180   | Data Architect                    | 165,000.0            |
| 902908   | Deloitte Consulting: Data Analyst | 111,175.0            |
| 704017   | Senior Data Analyst II            | 111,175.0            |
| 1718997  | Marketplace Operations Data Analyst| 111,175.0           |
| 253402   | Data Analyst - Insurance          | 111,175.0            |
| 1365919  | Data Analyst - Marketing          | 111,175.0            |
| 601938   | Data Manager                      | 105,650.0            |
| 719231   | Data Analyst                      | 105,000.0            |
| 1731236  | Data Analyst                      | 102,500.0            |
| 1757639  | Data Analyst - Growth             | 100,500.0            |

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

Here's the breakdown of the most demanded skills for data analysts in 2023

* The high demand for **SQL** and **Excel** suggests that businesses value the ability to handle and analyze data at a fundamental level.
* **Python’s** popularity underscores its importance in more advanced data manipulation, analysis, and machine learning tasks.
* The presence of **Power BI**, **SAS**, and **Tableau** indicates a strong market for professionals who can turn data into actionable insights through visualization.
* Cloud platforms like **Azure** and **AWS** are essential for modern data workflows, and their growing demand reflects the shift towards cloud-based solutions.
* **SAP’s** demand, while lower, points to its niche role in enterprise resource planning and data processing.

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

| Skill       | Average Salary (ZAR) |
|-------------|----------------------|
| Spark       | 126,225              |
| Databricks  | 124,892              |
| AWS         | 106,938              |
| Java        | 106,838              |
| Airflow     | 106,838              |
| C++         | 106,838              |
| Scala       | 106,838              |
| Kafka       | 105,838              |
| BigQuery    | 104,892              |
| No-SQL      | 104,838              |
| PySpark     | 104,838              |
| GCP         | 104,838              |
| Redis       | 104,838              |
| MySQL       | 104,838              |
| Bitbucket   | 100,500              |
| Git         | 100,500              |
| Python      | 94,837               |
| Looker      | 94,375               |
| Flow        | 93,966               |
| NoSQL       | 92,225               |
| Cassandra   | 92,225               |
| Hadoop      | 92,225               |
| Tableau     | 90,136               |
| Sheets      | 89,730               |
| Redshift    | 88,230               |

*Table of the average salary for the top 25 paying skills for data analysts*

Here's a breakdown of the results for top paying skills for Data Analysts:

* **High-Value Skills:** **Spark** and **Databricks** top the list with average salaries of ZAR 126,225 and ZAR 124,892 respectively, indicating a high value placed on big data processing frameworks and platforms that support large-scale data analytics.
* **Cloud and Big Data:** Skills related to cloud services (**AWS**, **GCP**) and big data technologies (**BigQuery**, **No-SQL**, **PySpark**) command average salaries over ZAR 100,000, reflecting the industry’s emphasis on scalable, cloud-based data solutions.
* **Programming Languages:** Traditional programming languages like **Java** and **C++**, along with newer ones like **Scala**, are still in demand, with salaries around ZAR 106,838. This suggests a steady market for developers with these skills.
* **Streaming and Real-Time Processing:** **Kafka**, a tool for building real-time data pipelines and streaming apps, has an average salary of ZAR 105,838, showing the importance of real-time data processing in modern applications.
* **Database Management:** **MySQL** and **Redis**, representing relational and in-memory databases, have similar average salaries of ZAR 104,838, indicating the necessity of database management skills in the tech ecosystem.
* **Version Control and Collaboration:** **Bitbucket** and **Git** show the lowest salaries in the higher range (ZAR 100,500), which could be due to the widespread necessity of version control skills, making them more of a standard expectation than a specialized skill.
* **Popular Scripting Language:*** **Python**, despite being a highly popular scripting language for data science and automation, is at the lower end of the salary spectrum (ZAR 94,837). This could be due to the large pool of Python developers, which may drive down the average salary.
* **Business Intelligence and Visualization:** **Tableau** and **Looker**, tools for business intelligence and data visualization, have average salaries of ZAR 90,136 and ZAR 94,375 respectively, which are essential for translating data insights into business decisions.
* **Emerging Technologies:** **Airflow** and **Flow**, tools for orchestrating complex computational workflows, have average salaries around ZAR 93,966 to ZAR 106,838, suggesting a growing market for workflow management in data operations.

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
| Skill ID | Skill      | Demand Count | Average Salary (ZAR) |
|----------|------------|--------------|----------------------|
| 92       | Spark      | 3            | 126,225              |
| 75       | Databricks | 3            | 124,892              |
| 76       | AWS        | 5            | 106,938              |
| 13       | C++        | 2            | 106,838              |
| 3        | Scala      | 2            | 106,838              |
| 4        | Java       | 2            | 106,838              |
| 96       | Airflow    | 2            | 106,838              |
| 98       | Kafka      | 4            | 105,838              |
| 77       | BigQuery   | 3            | 104,892              |
| 56       | MySQL      | 2            | 104,838              |
| 28       | No-SQL     | 2            | 104,838              |
| 55       | Redis      | 2            | 104,838              |
| 81       | GCP        | 2            | 104,838              |
| 95       | PySpark    | 2            | 104,838              |
| 1        | Python     | 8            | 94,837               |
| 185      | Looker     | 6            | 94,375               |
| 215      | Flow       | 4            | 93,966               |
| 2        | NoSQL      | 3            | 92,225               |
| 97       | Hadoop     | 3            | 92,225               |
| 63       | Cassandra  | 3            | 92,225               |
| 182      | Tableau    | 6            | 90,136               |
| 192      | Sheets     | 3            | 89,730               |
| 78       | Redshift   | 3            | 88,230               |
| 181      | Excel      | 8            | 84,741               |
| 187      | Qlik       | 2            | 81,095               |

*Table of the most optimal skills for data analyst in South Africa sorted by salary*

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

| Skill ID | Skill      | Demand Count | Average Salary (ZAR) |
|----------|------------|--------------|----------------------|
| 8        | Go         | 27           | 115,320              |
| 234      | Confluence | 11           | 114,210              |
| 97       | Hadoop     | 22           | 113,193              |
| 80       | Snowflake  | 37           | 112,948              |
| 74       | Azure      | 34           | 111,225              |
| 77       | BigQuery   | 13           | 109,654              |
| 76       | AWS        | 32           | 108,317              |
| 4        | Java       | 17           | 106,906              |
| 194      | SSIS       | 12           | 106,683              |
| 233      | Jira       | 20           | 104,918              |
| 79       | Oracle     | 37           | 104,534              |
| 185      | Looker     | 49           | 103,795              |
| 2        | NoSQL      | 13           | 101,414              |
| 1        | Python     | 236          | 101,397              |
| 5        | R          | 148          | 100,499              |
| 78       | Redshift   | 16           | 99,936               |
| 187      | Qlik       | 13           | 99,631               |
| 182      | Tableau    | 230          | 99,288               |
| 197      | SSRS       | 14           | 99,171               |
| 92       | Spark      | 13           | 99,077               |
| 13       | C++        | 11           | 98,958               |
| 186      | SAS        | 63           | 98,902               |
| 7        | SAS        | 63           | 98,902               |
| 61       | SQL Server | 35           | 97,786               |
| 9        | JavaScript | 20           | 97,587               |

*Table of the most optimal skills for data analyst sorted by salary*

Here's a breakdown of the most optimal skills for Data Analysts in 2023:

* **High-Demand Programming Languages:** **Python** and **R** are in high demand, with 236 and 148 demand counts respectively. Despite their high demand, their average salaries are 101,397 for **Python** and 100,499 for **R**, which are not at the top of the salary range. This could indicate a robust supply of professionals with these skills.
* **Specialized Skills Premium:** **Go**, **Confluence**, and **Hadoop** show a higher average salary (115,320, Z114,210, and 113,193 respectively) with a moderate demand count. This suggests that specialized skills can command a premium in the job market.
* **Cloud Technologies and Big Data:** **Snowflake**, **Azure**, **AWS**, and **BigQuery** have significant demand counts and offer salaries above 108,000. This reflects the growing importance of cloud technologies and big data platforms in the industry.
* **Database and Business Intelligence:** **Oracle**, **SSIS**, **Looker**, and **Tableau** are widely used for database management and business intelligence. They have a strong presence in the market with demand counts ranging from 12 to 49 and salaries around 103,795 to 104,534.
* **Project Management Tools:** **Jira** and **Confluence** are essential tools for project management and collaboration, with demand counts of 20 and 11 respectively, and salaries around 104,918 and 114,210. Their salary figures suggest that expertise in project management tools is highly valued.
* **Emerging and Niche Technologies:** Technologies like **Go**, **Snowflake**, and **Hadoop** are on the higher end of the salary spectrum, which may indicate a niche demand for these skills where supply is not as abundant.

# Conclusions

### Insights

The data suggests that there is a healthy demand for data-related roles in South Africa, with competitive salaries that reflect the importance of data management and analysis in today’s business environment.
Companies seem to offer similar salaries for Data Analyst roles regardless of the specialization, which might indicate a standardized 
approach to valuing these positions.

The significant difference in salary between the Data Architect and the other roles suggests that there is a premium on leadership and advanced technical skills within the data field.

The data indicates that while foundational skills like Python are essential, there is a premium on specialized skills in big data, cloud services, and real-time data processing. Professionals with expertise in these areas are likely to command higher salaries. Additionally, the data suggests that as certain skills become more common, such as version control with Git, the average salary may not be as high, possibly due to a larger supply of professionals with those skills.

There is a clear trend that while foundational skills like Python and R are essential and widely demanded, they may not offer the highest salaries due to a larger talent pool.
Specialized skills, particularly in cloud services and big data, are highly sought after and offer competitive salaries.
Expertise in project management and collaboration tools is also well-compensated, reflecting the need for professionals who can manage complex projects and teams.

