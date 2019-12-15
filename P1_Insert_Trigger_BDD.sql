/* Create Trigger in bussiness_stream table */
USE [job_board]
GO

CREATE TRIGGER [dbo].[Insert_BDD]
ON [job_board].[dbo].[business_stream]
INSTEAD OF INSERT AS 
BEGIN
      SET NOCOUNT ON;
      DECLARE @business_stream_name VARCHAR(100);

      SELECT @business_stream_name = INSERTED.business_stream_name
      FROM INSERTED

      INSERT INTO [job_board].[dbo].[business_stream]
            ([business_stream_name])
      VALUES
            (@business_stream_name)
    
      INSERT INTO [192.168.100.20].[job_board].[dbo].[business_stream]
            ([business_stream_name])
      VALUES
            (@business_stream_name)

END
GO

/* Test Insert in table */
USE [job_board]
GO

INSERT INTO [dbo].[business_stream]
           ([business_stream_name])
     VALUES
           ('INSERT desde THINKPAD :D')
GO

/* Query result */
USE [job_board]
GO

SELECT *
  FROM [dbo].[business_stream]
UNION 
SELECT *
  FROM [192.168.100.20].[job_board].[dbo].[business_stream]
GO