/*
Realizar una consulta distribuida, utilizando los registros de 3 tablas, que por lo menos, una se
encuentre en una bases de datos diferente.
*/

SELECT u.[email], l.[last_login_date] AS 'Último login'
FROM [192.168.100.20].[job_board].[dbo].[user_account] AS u,
	[192.168.100.20].[job_board].[dbo].[user_log] AS l,
	[job_board].[dbo].[user_type] AS t
WHERE t.id = u.user_type_id
    AND u.id = l.user_account_id
    AND t.user_type_name = 'EMPLOYER'

/* Utilizando Inner Join */
SELECT * FROM [192.168.100.20].[job_board].[dbo].[user_account] AS u
INNER JOIN [192.168.100.20].[job_board].[dbo].[user_log] AS l ON u.id = l.user_account_id
INNER JOIN [job_board].[dbo].[user_type] AS t ON t.id = u.user_type_id
WHERE t.user_type_name = 'EMPLOYER'