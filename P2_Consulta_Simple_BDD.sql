/*
Realizar una consulta distribuida, utilizando los registros de 2 tablas, que se encuentren en diferentes
bases de datos. Por favor, cuide la integridad de los datos.
*/

SELECT *
  FROM [job_board].[dbo].[user_account]
UNION
SELECT *
  FROM [192.168.100.10].[job_board].[dbo].[user_account]
ORDER BY user_type_id
GO