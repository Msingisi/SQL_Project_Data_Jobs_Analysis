/*
Question: What skills are required for the top-paying data analyst jobs in South Africa?
- Add the specific skills required for these roles
- Why? It provides a detailed look at which high-paying jobs demand certain skills, 
    helping job seekers understand which skills to develop that align with top salaries
*/

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


/*
SQL: Appears in almost every job posting, indicating its fundamental importance in data analysis.
Python: Highly sought after, reflecting its versatility and popularity in data analysis and automation.
Excel: Still a staple skill, showing the ongoing need for spreadsheet proficiency.

The average salary ranges from $105,000 to $165,000, with the role of Data Architect at Luno
offering the highest average salary.

takealot.com, Deloitte, Standard Bank Group, and Impact are some of the companies hiring,
with takealot.com having multiple listings, indicating a strong focus on data-driven decision-making.

[
  {
    "job_id": 327180,
    "job_title": "Data Architect",
    "salary_year_avg": "165000.0",
    "company_name": "Luno",
    "skills": "databricks"
  },
  {
    "job_id": 327180,
    "job_title": "Data Architect",
    "salary_year_avg": "165000.0",
    "company_name": "Luno",
    "skills": "aws"
  },
  {
    "job_id": 327180,
    "job_title": "Data Architect",
    "salary_year_avg": "165000.0",
    "company_name": "Luno",
    "skills": "spark"
  },
  {
    "job_id": 1718997,
    "job_title": "Marketplace Operations Data Analyst",
    "salary_year_avg": "111175.0",
    "company_name": "takealot.com",
    "skills": "sql"
  },
  {
    "job_id": 1718997,
    "job_title": "Marketplace Operations Data Analyst",
    "salary_year_avg": "111175.0",
    "company_name": "takealot.com",
    "skills": "excel"
  },
  {
    "job_id": 902908,
    "job_title": "Deloitte Consulting: Data Analyst",
    "salary_year_avg": "111175.0",
    "company_name": "Deloitte",
    "skills": "sql"
  },
  {
    "job_id": 902908,
    "job_title": "Deloitte Consulting: Data Analyst",
    "salary_year_avg": "111175.0",
    "company_name": "Deloitte",
    "skills": "excel"
  },
  {
    "job_id": 902908,
    "job_title": "Deloitte Consulting: Data Analyst",
    "salary_year_avg": "111175.0",
    "company_name": "Deloitte",
    "skills": "tableau"
  },
  {
    "job_id": 902908,
    "job_title": "Deloitte Consulting: Data Analyst",
    "salary_year_avg": "111175.0",
    "company_name": "Deloitte",
    "skills": "power bi"
  },
  {
    "job_id": 902908,
    "job_title": "Deloitte Consulting: Data Analyst",
    "salary_year_avg": "111175.0",
    "company_name": "Deloitte",
    "skills": "flow"
  },
  {
    "job_id": 1365919,
    "job_title": "Data Analyst - Marketing",
    "salary_year_avg": "111175.0",
    "company_name": "takealot.com",
    "skills": "sql"
  },
  {
    "job_id": 1365919,
    "job_title": "Data Analyst - Marketing",
    "salary_year_avg": "111175.0",
    "company_name": "takealot.com",
    "skills": "python"
  },
  {
    "job_id": 1365919,
    "job_title": "Data Analyst - Marketing",
    "salary_year_avg": "111175.0",
    "company_name": "takealot.com",
    "skills": "excel"
  },
  {
    "job_id": 1365919,
    "job_title": "Data Analyst - Marketing",
    "salary_year_avg": "111175.0",
    "company_name": "takealot.com",
    "skills": "looker"
  },
  {
    "job_id": 1365919,
    "job_title": "Data Analyst - Marketing",
    "salary_year_avg": "111175.0",
    "company_name": "takealot.com",
    "skills": "qlik"
  },
  {
    "job_id": 1365919,
    "job_title": "Data Analyst - Marketing",
    "salary_year_avg": "111175.0",
    "company_name": "takealot.com",
    "skills": "sheets"
  },
  {
    "job_id": 704017,
    "job_title": "Senior Data Analyst II",
    "salary_year_avg": "111175.0",
    "company_name": "Impact",
    "skills": "sql"
  },
  {
    "job_id": 704017,
    "job_title": "Senior Data Analyst II",
    "salary_year_avg": "111175.0",
    "company_name": "Impact",
    "skills": "python"
  },
  {
    "job_id": 704017,
    "job_title": "Senior Data Analyst II",
    "salary_year_avg": "111175.0",
    "company_name": "Impact",
    "skills": "no-sql"
  },
  {
    "job_id": 704017,
    "job_title": "Senior Data Analyst II",
    "salary_year_avg": "111175.0",
    "company_name": "Impact",
    "skills": "redis"
  },
  {
    "job_id": 704017,
    "job_title": "Senior Data Analyst II",
    "salary_year_avg": "111175.0",
    "company_name": "Impact",
    "skills": "mysql"
  },
  {
    "job_id": 704017,
    "job_title": "Senior Data Analyst II",
    "salary_year_avg": "111175.0",
    "company_name": "Impact",
    "skills": "databricks"
  },
  {
    "job_id": 704017,
    "job_title": "Senior Data Analyst II",
    "salary_year_avg": "111175.0",
    "company_name": "Impact",
    "skills": "bigquery"
  },
  {
    "job_id": 704017,
    "job_title": "Senior Data Analyst II",
    "salary_year_avg": "111175.0",
    "company_name": "Impact",
    "skills": "gcp"
  },
  {
    "job_id": 704017,
    "job_title": "Senior Data Analyst II",
    "salary_year_avg": "111175.0",
    "company_name": "Impact",
    "skills": "pyspark"
  },
  {
    "job_id": 704017,
    "job_title": "Senior Data Analyst II",
    "salary_year_avg": "111175.0",
    "company_name": "Impact",
    "skills": "kafka"
  },
  {
    "job_id": 704017,
    "job_title": "Senior Data Analyst II",
    "salary_year_avg": "111175.0",
    "company_name": "Impact",
    "skills": "tableau"
  },
  {
    "job_id": 704017,
    "job_title": "Senior Data Analyst II",
    "salary_year_avg": "111175.0",
    "company_name": "Impact",
    "skills": "power bi"
  },
  {
    "job_id": 704017,
    "job_title": "Senior Data Analyst II",
    "salary_year_avg": "111175.0",
    "company_name": "Impact",
    "skills": "looker"
  },
  {
    "job_id": 253402,
    "job_title": "Data Analyst - Insurance",
    "salary_year_avg": "111175.0",
    "company_name": "Standard Bank Group",
    "skills": "sql"
  },
  {
    "job_id": 253402,
    "job_title": "Data Analyst - Insurance",
    "salary_year_avg": "111175.0",
    "company_name": "Standard Bank Group",
    "skills": "python"
  },
  {
    "job_id": 253402,
    "job_title": "Data Analyst - Insurance",
    "salary_year_avg": "111175.0",
    "company_name": "Standard Bank Group",
    "skills": "nosql"
  },
  {
    "job_id": 253402,
    "job_title": "Data Analyst - Insurance",
    "salary_year_avg": "111175.0",
    "company_name": "Standard Bank Group",
    "skills": "scala"
  },
  {
    "job_id": 253402,
    "job_title": "Data Analyst - Insurance",
    "salary_year_avg": "111175.0",
    "company_name": "Standard Bank Group",
    "skills": "java"
  },
  {
    "job_id": 253402,
    "job_title": "Data Analyst - Insurance",
    "salary_year_avg": "111175.0",
    "company_name": "Standard Bank Group",
    "skills": "c++"
  },
  {
    "job_id": 253402,
    "job_title": "Data Analyst - Insurance",
    "salary_year_avg": "111175.0",
    "company_name": "Standard Bank Group",
    "skills": "cassandra"
  },
  {
    "job_id": 253402,
    "job_title": "Data Analyst - Insurance",
    "salary_year_avg": "111175.0",
    "company_name": "Standard Bank Group",
    "skills": "aws"
  },
  {
    "job_id": 253402,
    "job_title": "Data Analyst - Insurance",
    "salary_year_avg": "111175.0",
    "company_name": "Standard Bank Group",
    "skills": "redshift"
  },
  {
    "job_id": 253402,
    "job_title": "Data Analyst - Insurance",
    "salary_year_avg": "111175.0",
    "company_name": "Standard Bank Group",
    "skills": "spark"
  },
  {
    "job_id": 253402,
    "job_title": "Data Analyst - Insurance",
    "salary_year_avg": "111175.0",
    "company_name": "Standard Bank Group",
    "skills": "airflow"
  },
  {
    "job_id": 253402,
    "job_title": "Data Analyst - Insurance",
    "salary_year_avg": "111175.0",
    "company_name": "Standard Bank Group",
    "skills": "hadoop"
  },
  {
    "job_id": 253402,
    "job_title": "Data Analyst - Insurance",
    "salary_year_avg": "111175.0",
    "company_name": "Standard Bank Group",
    "skills": "kafka"
  },
  {
    "job_id": 253402,
    "job_title": "Data Analyst - Insurance",
    "salary_year_avg": "111175.0",
    "company_name": "Standard Bank Group",
    "skills": "flow"
  },
  {
    "job_id": 719231,
    "job_title": "Data Analyst",
    "salary_year_avg": "105000.0",
    "company_name": "takealot.com",
    "skills": "sql"
  },
  {
    "job_id": 719231,
    "job_title": "Data Analyst",
    "salary_year_avg": "105000.0",
    "company_name": "takealot.com",
    "skills": "python"
  },
  {
    "job_id": 719231,
    "job_title": "Data Analyst",
    "salary_year_avg": "105000.0",
    "company_name": "takealot.com",
    "skills": "aws"
  },
  {
    "job_id": 719231,
    "job_title": "Data Analyst",
    "salary_year_avg": "105000.0",
    "company_name": "takealot.com",
    "skills": "bigquery"
  },
  {
    "job_id": 719231,
    "job_title": "Data Analyst",
    "salary_year_avg": "105000.0",
    "company_name": "takealot.com",
    "skills": "excel"
  },
  {
    "job_id": 719231,
    "job_title": "Data Analyst",
    "salary_year_avg": "105000.0",
    "company_name": "takealot.com",
    "skills": "sheets"
  },
  {
    "job_id": 1731236,
    "job_title": "Data Analyst",
    "salary_year_avg": "102500.0",
    "company_name": "Standard Bank Group",
    "skills": "sql"
  },
  {
    "job_id": 1731236,
    "job_title": "Data Analyst",
    "salary_year_avg": "102500.0",
    "company_name": "Standard Bank Group",
    "skills": "python"
  },
  {
    "job_id": 1731236,
    "job_title": "Data Analyst",
    "salary_year_avg": "102500.0",
    "company_name": "Standard Bank Group",
    "skills": "nosql"
  },
  {
    "job_id": 1731236,
    "job_title": "Data Analyst",
    "salary_year_avg": "102500.0",
    "company_name": "Standard Bank Group",
    "skills": "scala"
  },
  {
    "job_id": 1731236,
    "job_title": "Data Analyst",
    "salary_year_avg": "102500.0",
    "company_name": "Standard Bank Group",
    "skills": "java"
  },
  {
    "job_id": 1731236,
    "job_title": "Data Analyst",
    "salary_year_avg": "102500.0",
    "company_name": "Standard Bank Group",
    "skills": "c++"
  },
  {
    "job_id": 1731236,
    "job_title": "Data Analyst",
    "salary_year_avg": "102500.0",
    "company_name": "Standard Bank Group",
    "skills": "cassandra"
  },
  {
    "job_id": 1731236,
    "job_title": "Data Analyst",
    "salary_year_avg": "102500.0",
    "company_name": "Standard Bank Group",
    "skills": "aws"
  },
  {
    "job_id": 1731236,
    "job_title": "Data Analyst",
    "salary_year_avg": "102500.0",
    "company_name": "Standard Bank Group",
    "skills": "redshift"
  },
  {
    "job_id": 1731236,
    "job_title": "Data Analyst",
    "salary_year_avg": "102500.0",
    "company_name": "Standard Bank Group",
    "skills": "spark"
  },
  {
    "job_id": 1731236,
    "job_title": "Data Analyst",
    "salary_year_avg": "102500.0",
    "company_name": "Standard Bank Group",
    "skills": "airflow"
  },
  {
    "job_id": 1731236,
    "job_title": "Data Analyst",
    "salary_year_avg": "102500.0",
    "company_name": "Standard Bank Group",
    "skills": "hadoop"
  },
  {
    "job_id": 1731236,
    "job_title": "Data Analyst",
    "salary_year_avg": "102500.0",
    "company_name": "Standard Bank Group",
    "skills": "kafka"
  },
  {
    "job_id": 1731236,
    "job_title": "Data Analyst",
    "salary_year_avg": "102500.0",
    "company_name": "Standard Bank Group",
    "skills": "flow"
  },
  {
    "job_id": 1757639,
    "job_title": "Data Analyst - Growth",
    "salary_year_avg": "100500.0",
    "company_name": "Kuda Technologies Ltd",
    "skills": "sql"
  },
  {
    "job_id": 1757639,
    "job_title": "Data Analyst - Growth",
    "salary_year_avg": "100500.0",
    "company_name": "Kuda Technologies Ltd",
    "skills": "looker"
  },
  {
    "job_id": 1757639,
    "job_title": "Data Analyst - Growth",
    "salary_year_avg": "100500.0",
    "company_name": "Kuda Technologies Ltd",
    "skills": "git"
  },
  {
    "job_id": 1757639,
    "job_title": "Data Analyst - Growth",
    "salary_year_avg": "100500.0",
    "company_name": "Kuda Technologies Ltd",
    "skills": "bitbucket"
  }
]
*/

