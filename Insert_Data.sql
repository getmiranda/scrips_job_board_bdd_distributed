INSERT INTO [job_board].[dbo].[user_type]
           ([user_type_name])
     VALUES
           ('EMPLOYER')
GO

INSERT INTO [job_board].[dbo].[user_type]
           ([user_type_name])
     VALUES
           ('APPLICANT')
GO

/* Inserts for table User Account */
--Applicants
INSERT INTO [job_board].[dbo].[user_account]
           ([user_type_id],[email],[password],[date_of_birth],[gender],[is_active],[contact_number],[email_notification_active],[user_image],[registration_date])
     VALUES
           (2,'miranda@gmail.com','micontraseña','1997-03-28','H','1','2281245656','1','profile.png','2019-03-28')
GO
INSERT INTO [job_board].[dbo].[user_account]
           ([user_type_id],[email],[password],[date_of_birth],[gender],[is_active],[contact_number],[email_notification_active],[user_image],[registration_date])
     VALUES
           (2,'katia@gmail.com','micontraseña','1999-09-02','M','1','2281749396','1','profile.png','2019-11-23')
GO
INSERT INTO [job_board].[dbo].[user_account]
           ([user_type_id],[email],[password],[date_of_birth],[gender],[is_active],[contact_number],[email_notification_active],[user_image],[registration_date])
     VALUES
           (2,'karla@gmail.com','micontraseña','1975-01-02','M','1','2288383492','1','profile.png','2019-06-20')
GO
INSERT INTO [job_board].[dbo].[user_account]
           ([user_type_id],[email],[password],[date_of_birth],[gender],[is_active],[contact_number],[email_notification_active],[user_image],[registration_date])
     VALUES
           (2,'lorena@gmail.com','micontraseña','1975-12-09','M','1','2291537550','1','profile.png','2018-05-06')
GO
INSERT INTO [job_board].[dbo].[user_account]
           ([user_type_id],[email],[password],[date_of_birth],[gender],[is_active],[contact_number],[email_notification_active],[user_image],[registration_date])
     VALUES
           (2,'manuel@gmail.com','micontraseña','1976-10-03','H','1','2881004120','1','profile.png','2018-09-30')
GO
--Employers
INSERT INTO [job_board].[dbo].[user_account]
           ([user_type_id],[email],[password],[date_of_birth],[gender],[is_active],[contact_number],[email_notification_active],[user_image],[registration_date])
     VALUES
           (1,'fernando@clicksoft.com','micontraseña','1990-02-12','H','1','2239472745','1','profile.png','2015-01-02')
GO
INSERT INTO [job_board].[dbo].[user_account]
           ([user_type_id],[email],[password],[date_of_birth],[gender],[is_active],[contact_number],[email_notification_active],[user_image],[registration_date])
     VALUES
           (1,'carlos@ibm.com','micontraseña','1980-04-29','H','1','2681745396','1','profile.png','2017-01-23')
GO
INSERT INTO [job_board].[dbo].[user_account]
           ([user_type_id],[email],[password],[date_of_birth],[gender],[is_active],[contact_number],[email_notification_active],[user_image],[registration_date])
     VALUES
           (1,'maria@softeck.com','micontraseña','1992-09-22','M','1','2588683492','1','profile.png','2019-01-02')
GO
INSERT INTO [job_board].[dbo].[user_account]
           ([user_type_id],[email],[password],[date_of_birth],[gender],[is_active],[contact_number],[email_notification_active],[user_image],[registration_date])
     VALUES
           (1,'isa@oracle.com','micontraseña','1981-12-12','M','1','2371537530','1','profile.png','2017-08-23')
GO
INSERT INTO [job_board].[dbo].[user_account]
           ([user_type_id],[email],[password],[date_of_birth],[gender],[is_active],[contact_number],[email_notification_active],[user_image],[registration_date])
     VALUES
           (1,'noe@google.com','micontraseña','1985-05-13','H','1','2818104120','1','profile.png','2019-09-01')
GO

/* Inserts for table business_stream */
INSERT INTO [job_board].[dbo].[business_stream]
           ([business_stream_name])
     VALUES
           ('Gas y Petróleo')
GO

INSERT INTO [job_board].[dbo].[business_stream]
           ([business_stream_name])
     VALUES
           ('Software')
GO

INSERT INTO [job_board].[dbo].[business_stream]
           ([business_stream_name])
     VALUES
           ('Imprenta')
GO

/* User logs */
INSERT INTO [job_board].[dbo].[user_log]
           ([user_account_id]
           ,[last_login_date]
           ,[last_job_apply_date])
     VALUES
           (1
           ,'2019-12-12'
           ,'2019-10-10')
GO
INSERT INTO [job_board].[dbo].[user_log]
           ([user_account_id]
           ,[last_login_date]
           ,[last_job_apply_date])
     VALUES
           (2
           ,'2019-12-10'
           ,'2018-10-10')
GO

INSERT INTO [job_board].[dbo].[user_log]
           ([user_account_id]
           ,[last_login_date]
           ,[last_job_apply_date])
     VALUES
           (3
           ,'2019-11-30'
           ,'2018-10-10')
GO

INSERT INTO [job_board].[dbo].[user_log]
           ([user_account_id]
           ,[last_login_date]
           ,[last_job_apply_date])
     VALUES
           (4
           ,'2019-11-20'
           ,'2018-10-10')
GO

INSERT INTO [job_board].[dbo].[user_log]
           ([user_account_id]
           ,[last_login_date]
           ,[last_job_apply_date])
     VALUES
           (5
           ,'2019-12-01'
           ,'2018-10-10')
GO

/* Companies */
INSERT INTO [dbo].[company]
           ([company_name]
           ,[profile_description]
           ,[business_stream_id]
           ,[establishment_date]
           ,[company_website_url])
     VALUES
           ('Google'
           ,'Inovación tecnológica'
           ,14
           ,'1990-03-28'
           ,'www.google.com')
GO
INSERT INTO [dbo].[company]
           ([company_name]
           ,[profile_description]
           ,[business_stream_id]
           ,[establishment_date]
           ,[company_website_url])
     VALUES
           ('Microsoft'
           ,'Inovación tecnológica'
           ,14
           ,'1995-03-28'
           ,'www.microsoft.com')
GO
INSERT INTO [dbo].[company]
           ([company_name]
           ,[profile_description]
           ,[business_stream_id]
           ,[establishment_date]
           ,[company_website_url])
     VALUES
           ('Amazon'
           ,'Inovación tecnológica'
           ,14
           ,'1980-03-28'
           ,'www.amazon.com')
GO
INSERT INTO [dbo].[company]
           ([company_name]
           ,[profile_description]
           ,[business_stream_id]
           ,[establishment_date]
           ,[company_website_url])
     VALUES
           ('IBM'
           ,'Inovación tecnológica'
           ,14
           ,'2000-03-28'
           ,'www.ibm.com')
GO
INSERT INTO [dbo].[company]
           ([company_name]
           ,[profile_description]
           ,[business_stream_id]
           ,[establishment_date]
           ,[company_website_url])
     VALUES
           ('CIMAT'
           ,'Centro de Investigación'
           ,11
           ,'2000-03-28'
           ,'www.cimat.com')
GO
INSERT INTO [dbo].[company]
           ([company_name]
           ,[profile_description]
           ,[business_stream_id]
           ,[establishment_date]
           ,[company_website_url])
     VALUES
           ('Computación del Golfo'
           ,'Bachillerato Tecnológico'
           ,11
           ,'2000-03-28'
           ,'www.cg.com')
GO

/*Job_Type*/
INSERT INTO [dbo].[job_type]
           ([job_type])
     VALUES
           ('Full')
GO
INSERT INTO [dbo].[job_type]
           ([job_type])
     VALUES
           ('Part-time')
GO
INSERT INTO [dbo].[job_type]
           ([job_type])
     VALUES
           ('Intership')
GO
INSERT INTO [dbo].[job_type]
           ([job_type])
     VALUES
           ('Voluntier')
GO

/*Job location*/
INSERT INTO [dbo].[job_location]
           ([street_address]
           ,[city]
           ,[state]
           ,[country]
           ,[zip])
     VALUES
           ('St. one 12'
           ,'Palo Alto'
           ,'California'
           ,'EUA'
           ,'00000')
GO

/*Job Post*/
INSERT INTO [dbo].[job_post]
           ([posted_by_id]
           ,[job_type_id]
           ,[company_id]
           ,[is_company_name_hidden]
           ,[create_date]
           ,[job_description]
           ,[job_location_id]
           ,[is_active])
     VALUES
           (6
           ,2
           ,1
           ,'0'
           ,'2019-10-10'
           ,'Description'
           ,1
           ,'1')
GO
INSERT INTO [dbo].[job_post]
           ([posted_by_id]
           ,[job_type_id]
           ,[company_id]
           ,[is_company_name_hidden]
           ,[create_date]
           ,[job_description]
           ,[job_location_id]
           ,[is_active])
     VALUES
           (6
           ,3
           ,2
           ,'0'
           ,'2019-10-10'
           ,'Description'
           ,1
           ,'1')
GO
INSERT INTO [dbo].[job_post]
           ([posted_by_id]
           ,[job_type_id]
           ,[company_id]
           ,[is_company_name_hidden]
           ,[create_date]
           ,[job_description]
           ,[job_location_id]
           ,[is_active])
     VALUES
           (6
           ,4
           ,3
           ,'0'
           ,'2019-10-10'
           ,'Description'
           ,1
           ,'1')
GO
INSERT INTO [dbo].[job_post]
           ([posted_by_id]
           ,[job_type_id]
           ,[company_id]
           ,[is_company_name_hidden]
           ,[create_date]
           ,[job_description]
           ,[job_location_id]
           ,[is_active])
     VALUES
           (6
           ,5
           ,4
           ,'0'
           ,'2019-10-10'
           ,'Description'
           ,1
           ,'1')
GO