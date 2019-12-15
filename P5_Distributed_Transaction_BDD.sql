/*Realizar un ejemplo de transacciones y explicar como afectan a las consultas de la Base de Datos.*/

SELECT *
  FROM [job_board].[dbo].[skill_set]
GO

SELECT *
  FROM [192.168.100.20].[job_board].[dbo].[skill_set]
GO

USE [job_board]
GO
SET XACT_ABORT ON
BEGIN DISTRIBUTED TRANSACTION;  
-- Insert skill from local instance.  
INSERT INTO [dbo].[skill_set]
           ([skill_set_name])
     VALUES
           ('Comunicación')
-- Inset skill from remote instance.  
INSERT INTO [192.168.100.20].[job_board].[dbo].[skill_set]
           ([skill_set_name])
     VALUES
           ('Comunicación') 
COMMIT TRANSACTION;  
GO

USE [job_board]
GO
SET XACT_ABORT ON
BEGIN DISTRIBUTED TRANSACTION;  
-- Insert skill from local instance.  
INSERT INTO [dbo].[skill_set]
           ([skill_set_name])
     VALUES
           ('Another skill')
-- Insert skill from remote instance.  
INSERT INTO [192.168.100.20].[job_board].[dbo].[skill_set]
           ([skill_set_name])
     VALUES
           ('Another skill') 
-- Query before rollback
SELECT * FROM [job_board].[dbo].[skill_set]
UNION
SELECT * FROM [192.168.100.20].[job_board].[dbo].[skill_set]

ROLLBACK TRANSACTION;  
GO
-- Query after rollback
SELECT * FROM [job_board].[dbo].[skill_set]
UNION
SELECT * FROM [192.168.100.20].[job_board].[dbo].[skill_set]