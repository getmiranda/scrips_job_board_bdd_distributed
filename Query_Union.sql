SELECT [id]
      ,[business_stream_name]
  FROM [job_board].[dbo].[business_stream]
union
SELECT [id]
      ,[business_stream_name]
  FROM [192.168.100.10].[job_board].[dbo].[business_stream]
GO
