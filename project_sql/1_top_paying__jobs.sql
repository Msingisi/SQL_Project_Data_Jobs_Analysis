/*
Question: What are the top-paying data analyst jobs?
- Identify the top 10 highest-paying Data Analyst roles that are available in South Africa
- Focuses on job postings with specified salaries (remove nulls)
- Include company names of top 10 roles
- Why? Highlight the top-paying opportunities for Data Analysts, offering insights into employment options and location flexibility.
*/

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


/*
[
  {
    "job_id": 327180,
    "job_title": "Data Architect",
    "job_location": "Johannesburg, South Africa",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "165000.0",
    "job_posted_date": "2023-03-23 15:34:43",
    "company_name": "Luno"
  },
  {
    "job_id": 902908,
    "job_title": "Deloitte Consulting: Data Analyst",
    "job_location": "Midrand, South Africa",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "111175.0",
    "job_posted_date": "2023-04-18 16:50:00",
    "company_name": "Deloitte"
  },
  {
    "job_id": 704017,
    "job_title": "Senior Data Analyst II",
    "job_location": "Cape Town, South Africa",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "111175.0",
    "job_posted_date": "2023-06-30 19:22:53",
    "company_name": "Impact"
  },
  {
    "job_id": 1718997,
    "job_title": "Marketplace Operations Data Analyst",
    "job_location": "Cape Town, South Africa",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "111175.0",
    "job_posted_date": "2023-01-17 04:02:42",
    "company_name": "takealot.com"
  },
  {
    "job_id": 253402,
    "job_title": "Data Analyst - Insurance",
    "job_location": "Johannesburg, South Africa",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "111175.0",
    "job_posted_date": "2023-08-21 19:13:27",
    "company_name": "Standard Bank Group"
  },
  {
    "job_id": 1365919,
    "job_title": "Data Analyst - Marketing",
    "job_location": "Cape Town, South Africa",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "111175.0",
    "job_posted_date": "2023-06-21 12:42:44",
    "company_name": "takealot.com"
  },
  {
    "job_id": 601938,
    "job_title": "Data Manager",
    "job_location": "Johannesburg, South Africa",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "105650.0",
    "job_posted_date": "2023-06-28 14:05:13",
    "company_name": "Standard Bank Group"
  },
  {
    "job_id": 719231,
    "job_title": "Data Analyst",
    "job_location": "Cape Town, South Africa",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "105000.0",
    "job_posted_date": "2023-05-31 10:26:51",
    "company_name": "takealot.com"
  },
  {
    "job_id": 1731236,
    "job_title": "Data Analyst",
    "job_location": "Roodepoort, South Africa",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "102500.0",
    "job_posted_date": "2023-04-19 11:06:12",
    "company_name": "Standard Bank Group"
  },
  {
    "job_id": 1757639,
    "job_title": "Data Analyst - Growth",
    "job_location": "Cape Town, South Africa",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "100500.0",
    "job_posted_date": "2023-08-15 09:30:44",
    "company_name": "Kuda Technologies Ltd"
  }
]
*/