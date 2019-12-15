/* Realizar una consulta distribuida, utilizando los registros de 3 tablas, que por lo menos, una se
encuentre en una bases de datos diferente. Las subconsultas deben estar anidas como se muestra en la
introducción. */

SELECT c.company_name AS 'Empresa', (SELECT COUNT(*)
									 FROM [job_board].[dbo].[job_post] AS jp
									WHERE c.id = jp.company_id
									) AS 'No. Posts'				 
FROM [job_board].[dbo].[company] AS c
WHERE c.business_stream_id IN (SELECT bs.id
							  FROM [192.168.100.20].[job_board].[dbo].[business_stream] AS bs
							  WHERE bs.business_stream_name = 'Software'
							  UNION
							  SELECT bs.id
							  FROM [job_board].[dbo].[business_stream] AS bs
							  WHERE bs.business_stream_name = 'Software'
							  )