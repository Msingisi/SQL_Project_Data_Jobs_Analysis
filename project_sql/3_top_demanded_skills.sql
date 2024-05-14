/*
Question: What are the most in-demand skills for data analysts?
- Identify the top 5 in-demand skills for a data analyst in South Africa.
- Why? Retrieves the top 5 skills with the highest demand in the job market, 
    providing insights into the most valuable skills for job seekers.
*/

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


/*
[
  {
    "skills": "sql",
    "demand_count": "1342"
  },
  {
    "skills": "excel",
    "demand_count": "823"
  },
  {
    "skills": "python",
    "demand_count": "676"
  },
  {
    "skills": "power bi",
    "demand_count": "526"
  },
  {
    "skills": "sas",
    "demand_count": "444"
  },
  {
    "skills": "r",
    "demand_count": "428"
  },
  {
    "skills": "tableau",
    "demand_count": "342"
  },
  {
    "skills": "azure",
    "demand_count": "216"
  },
  {
    "skills": "aws",
    "demand_count": "204"
  },
  {
    "skills": "sap",
    "demand_count": "203"
  }
]
*/