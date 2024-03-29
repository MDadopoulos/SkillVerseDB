-- Create user 'individualuser'
CREATE USER 'individualuser'@'localhost' IDENTIFIED BY 'indivpassword';
CREATE USER 'individualuser'@'%' IDENTIFIED BY 'indivpassword';

-- Grant necessary privileges
GRANT SELECT, INSERT, UPDATE ON skillversedb.user TO 'individualuser'@'localhost';
GRANT SELECT, INSERT, UPDATE ON skillversedb.user TO 'individualuser'@'%';
GRANT SELECT ON skillversedb.* TO 'individualuser'@'localhost';
GRANT SELECT ON skillversedb.* TO 'individualuser'@'%';

-- Create user 'adminuser'
CREATE USER 'adminuser'@'localhost' IDENTIFIED BY 'adminpassword';

-- Grant all privileges
GRANT ALL PRIVILEGES ON skillversedb.* TO 'adminuser'@'localhost';

-- Create user 'companyuser'
CREATE USER 'companyuser'@'localhost' IDENTIFIED BY 'comppassword';
CREATE USER 'companyuser'@'%' IDENTIFIED BY 'comppassword';

-- Grant necessary privileges
GRANT INSERT, UPDATE ON skillversedb.company TO 'companyuser'@'localhost';
GRANT INSERT, UPDATE ON skillversedb.company TO 'companyuser'@'%';
GRANT INSERT, UPDATE ON skillversedb.job TO 'companyuser'@'localhost';
GRANT INSERT, UPDATE ON skillversedb.job TO 'companyuser'@'%';
GRANT INSERT, UPDATE ON skillversedb.event TO 'companyuser'@'localhost';
GRANT INSERT, UPDATE ON skillversedb.event TO 'companyuser'@'%';
GRANT SELECT ON skillversedb.* TO 'companyuser'@'localhost';
GRANT SELECT ON skillversedb.* TO 'companyuser'@'%';

-- Create user 'teamleaderuser'
CREATE USER 'teamleaderuser'@'localhost' IDENTIFIED BY 'teamleadpassword';
CREATE USER 'teamleaderuser'@'%' IDENTIFIED BY 'teamleadpassword';

-- Grant necessary privileges
GRANT INSERT, UPDATE ON skillversedb.user TO 'teamleaderuser'@'localhost';
GRANT INSERT, UPDATE ON skillversedb.user TO 'teamleaderuser'@'%';
GRANT INSERT, UPDATE ON skillversedb.team TO 'teamleaderuser'@'localhost';
GRANT INSERT, UPDATE ON skillversedb.team TO 'teamleaderuser'@'%';
GRANT INSERT, UPDATE ON skillversedb.project TO 'teamleaderuser'@'localhost';
GRANT INSERT, UPDATE ON skillversedb.project TO 'teamleaderuser'@'%';
GRANT SELECT ON skillversedb.* TO 'teamleaderuser'@'localhost';
GRANT SELECT ON skillversedb.* TO 'teamleaderuser'@'%';
