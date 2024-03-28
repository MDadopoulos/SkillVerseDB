SELECT 
    J.job_id, 
    J.title, 
    J.description, 
    J.requirements
FROM 
    COMPANY C
JOIN 
    JOB J ON C.company_id = J.company_company_id
JOIN 
    Job_Requires_Skill JRS ON J.job_id = JRS.job_id
JOIN 
    Skill S ON JRS.skill_id = S.skill_id
WHERE 
    C.name = 'Google' 
    AND (S.skill_name = 'Python' OR S.skill_name = 'HTML');
