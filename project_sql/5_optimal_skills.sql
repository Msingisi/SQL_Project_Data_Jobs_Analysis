/*
Answer: What are the most optimal skills to learn (aka it’s in high demand and a high-paying skill)?
- Identify skills in high demand and associated with high average salaries for Data Analyst roles
- Concentrates on South African positions with specified salaries
- Why? Targets skills that offer job security (high demand) and financial benefits (high salaries), 
    offering strategic insights for career development in data analysis
*/

-- Identify skills in high demand for Data Analyst roles

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


/*
[
  {
    "skill_id": 92,
    "skills": "spark",
    "demand_count": "3",
    "avg_salary": "126225"
  },
  {
    "skill_id": 75,
    "skills": "databricks",
    "demand_count": "3",
    "avg_salary": "124892"
  },
  {
    "skill_id": 76,
    "skills": "aws",
    "demand_count": "5",
    "avg_salary": "106938"
  },
  {
    "skill_id": 13,
    "skills": "c++",
    "demand_count": "2",
    "avg_salary": "106838"
  },
  {
    "skill_id": 3,
    "skills": "scala",
    "demand_count": "2",
    "avg_salary": "106838"
  },
  {
    "skill_id": 4,
    "skills": "java",
    "demand_count": "2",
    "avg_salary": "106838"
  },
  {
    "skill_id": 96,
    "skills": "airflow",
    "demand_count": "2",
    "avg_salary": "106838"
  },
  {
    "skill_id": 98,
    "skills": "kafka",
    "demand_count": "4",
    "avg_salary": "105838"
  },
  {
    "skill_id": 77,
    "skills": "bigquery",
    "demand_count": "3",
    "avg_salary": "104892"
  },
  {
    "skill_id": 56,
    "skills": "mysql",
    "demand_count": "2",
    "avg_salary": "104838"
  },
  {
    "skill_id": 28,
    "skills": "no-sql",
    "demand_count": "2",
    "avg_salary": "104838"
  },
  {
    "skill_id": 55,
    "skills": "redis",
    "demand_count": "2",
    "avg_salary": "104838"
  },
  {
    "skill_id": 81,
    "skills": "gcp",
    "demand_count": "2",
    "avg_salary": "104838"
  },
  {
    "skill_id": 95,
    "skills": "pyspark",
    "demand_count": "2",
    "avg_salary": "104838"
  },
  {
    "skill_id": 1,
    "skills": "python",
    "demand_count": "8",
    "avg_salary": "94837"
  },
  {
    "skill_id": 185,
    "skills": "looker",
    "demand_count": "6",
    "avg_salary": "94375"
  },
  {
    "skill_id": 215,
    "skills": "flow",
    "demand_count": "4",
    "avg_salary": "93966"
  },
  {
    "skill_id": 2,
    "skills": "nosql",
    "demand_count": "3",
    "avg_salary": "92225"
  },
  {
    "skill_id": 97,
    "skills": "hadoop",
    "demand_count": "3",
    "avg_salary": "92225"
  },
  {
    "skill_id": 63,
    "skills": "cassandra",
    "demand_count": "3",
    "avg_salary": "92225"
  },
  {
    "skill_id": 182,
    "skills": "tableau",
    "demand_count": "6",
    "avg_salary": "90136"
  },
  {
    "skill_id": 192,
    "skills": "sheets",
    "demand_count": "3",
    "avg_salary": "89730"
  },
  {
    "skill_id": 78,
    "skills": "redshift",
    "demand_count": "3",
    "avg_salary": "88230"
  },
  {
    "skill_id": 181,
    "skills": "excel",
    "demand_count": "8",
    "avg_salary": "84741"
  },
  {
    "skill_id": 187,
    "skills": "qlik",
    "demand_count": "2",
    "avg_salary": "81095"
  }
]
*/