/*
Answer: What are the top skills based on salary?
- Look at the average salary associated with each skill for Data Analyst positions
- Focuses on roles with specified salaries, in South Africa
- Why? It reveals how different skills impact salary levels for Data Analysts and 
    helps identify the most financially rewarding skills to acquire or improve
*/

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


/*
[
  {
    "skills": "spark",
    "avg_salary": "126225"
  },
  {
    "skills": "databricks",
    "avg_salary": "124892"
  },
  {
    "skills": "aws",
    "avg_salary": "106938"
  },
  {
    "skills": "java",
    "avg_salary": "106838"
  },
  {
    "skills": "airflow",
    "avg_salary": "106838"
  },
  {
    "skills": "c++",
    "avg_salary": "106838"
  },
  {
    "skills": "scala",
    "avg_salary": "106838"
  },
  {
    "skills": "kafka",
    "avg_salary": "105838"
  },
  {
    "skills": "bigquery",
    "avg_salary": "104892"
  },
  {
    "skills": "no-sql",
    "avg_salary": "104838"
  },
  {
    "skills": "pyspark",
    "avg_salary": "104838"
  },
  {
    "skills": "gcp",
    "avg_salary": "104838"
  },
  {
    "skills": "redis",
    "avg_salary": "104838"
  },
  {
    "skills": "mysql",
    "avg_salary": "104838"
  },
  {
    "skills": "bitbucket",
    "avg_salary": "100500"
  },
  {
    "skills": "git",
    "avg_salary": "100500"
  },
  {
    "skills": "python",
    "avg_salary": "94837"
  },
  {
    "skills": "looker",
    "avg_salary": "94375"
  },
  {
    "skills": "flow",
    "avg_salary": "93966"
  },
  {
    "skills": "nosql",
    "avg_salary": "92225"
  },
  {
    "skills": "cassandra",
    "avg_salary": "92225"
  },
  {
    "skills": "hadoop",
    "avg_salary": "92225"
  },
  {
    "skills": "tableau",
    "avg_salary": "90136"
  },
  {
    "skills": "sheets",
    "avg_salary": "89730"
  },
  {
    "skills": "redshift",
    "avg_salary": "88230"
  }
]
*/