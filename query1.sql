SELECT 
    P.project_name, 
    UC.contibution_rating, 
    UC.contribution_state, 
    UC.contribution_details
FROM 
    User_Contribute_to_Project UC
JOIN 
    Project P ON UC.project_id = P.project_id
WHERE 
    UC.contribution_state = 'Accepted' 
    AND P.project_name = 'Project Mercury';
