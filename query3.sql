SELECT 
    P.project_id, 
    P.team_id, 
    P.project_name, 
    U.user_id, 
    U.username
FROM 
    Project P
JOIN 
    User_Member_Of_Team UMOT ON P.team_id = UMOT.team_id
JOIN 
    User U ON UMOT.user_id = U.user_id
WHERE 
    P.project_status = 'In Progress';
