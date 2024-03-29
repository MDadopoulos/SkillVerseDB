SELECT 
    U.user_id AS id, 
    S.skill_name AS skill, 
    UHS.skill_proficiency AS proficiency, 
    U.username AS name, 
    U.user_email AS email
FROM 
    User_Has_Skill UHS
JOIN 
    Skill S ON UHS.skill_id = S.skill_id
JOIN 
    User U ON UHS.user_id = U.user_id
WHERE 
    S.skill_name = 'React' 
    AND UHS.skill_proficiency > 80;