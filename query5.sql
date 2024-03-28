SELECT 
    U.username, 
    U.user_email
FROM 
    User U
WHERE 
    NOT EXISTS (
        SELECT 
            S.skill_id
        FROM 
            Skill S
        WHERE 
            (S.skill_name = 'PHP' OR S.skill_name = 'React')
            AND NOT EXISTS (
                SELECT 
                    *
                FROM 
                    User_Has_Skill UHS
                WHERE 
                    UHS.user_id = U.user_id 
                    AND UHS.skill_id = S.skill_id 
                    AND UHS.skill_proficiency > 35
            )
    );
