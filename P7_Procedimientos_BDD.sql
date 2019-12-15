/*Crear un procedimiento almacenado, que al pasarle por lo menos un parámetro, permita modificar dos
tablas de diferente base de datos.*/

--Disable account
USE [job_board]
GO
CREATE PROCEDURE [dbo].[disable_account]
    @id INT  
AS   
	UPDATE [job_board].[dbo].[user_account]
	   SET [is_active] = 0
	 WHERE [id] = @id

	UPDATE [192.168.100.20].[job_board].[dbo].[user_account]
	   SET [is_active] = 0
	 WHERE [id] = @id
GO

--test procedure
EXECUTE disable_account 3; 

--consult table
SELECT *
  FROM [job_board].[dbo].[user_account]
UNION
SELECT *
  FROM [192.168.100.20].[job_board].[dbo].[user_account]