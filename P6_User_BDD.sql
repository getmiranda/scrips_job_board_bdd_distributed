/*Crear un usuario, que solo tenga acceso a unos campos de una tabla, para select e Insert.*/

CREATE LOGIN miranda   
    WITH PASSWORD = '8fdKJl3$nlNv3049jsKK';  
USE [job_board]
GO

CREATE USER miranda FOR LOGIN miranda   
    WITH DEFAULT_SCHEMA = [dbo];  
GO

GRANT SELECT ON OBJECT::[job_board].[dbo].[user_account]([email],[contact_number]) TO miranda;  
GO
GRANT INSERT ON OBJECT::[job_board].[dbo].[job_location] TO miranda;  
GO

-- Select
SELECT * FROM [job_board].[dbo].[user_account]
SELECT [email],[contact_number] FROM [job_board].[dbo].[user_account]

-- Insert 
USE [job_board]
GO

INSERT INTO [dbo].[job_location]
           ([street_address]
           ,[city]
           ,[state]
           ,[country]
           ,[zip])
     VALUES
           ('Sin direccion'
           ,'Xalapa'
           ,'Veracruz'
           ,'Mexico'
           ,'00000')
GO

