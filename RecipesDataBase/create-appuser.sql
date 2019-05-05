-- create SQL auth login from master 
USE master;

CREATE LOGIN appuser 
WITH PASSWORD = 'SuperSecret!' -- create SQL auth login from master 
CREATE LOGIN test 
WITH PASSWORD = 'SuperSecret!' 


-- select your db in the dropdown and create a user mapped to a login 
USE [RecipesDatabase]
CREATE USER [appuser] 
FOR LOGIN [appuser] 
WITH DEFAULT_SCHEMA = dbo; 
  
-- add user to role(s) in db 
ALTER ROLE db_datareader ADD MEMBER [appuser]; 
ALTER ROLE db_datawriter ADD MEMBER [appuser]; 

-- Reference: https://www.mssqltips.com/sqlservertip/5242/adding-users-to-azure-sql-databases/
