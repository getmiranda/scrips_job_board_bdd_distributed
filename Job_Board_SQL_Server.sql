--Se debe crear la base de datos primero y despues ejecutar los create.
CREATE DATABASE job_board;
GO
USE job_board;
GO

/* Company Profiles Section */
CREATE TABLE job_board.dbo.business_stream (
	id INT NOT NULL IDENTITY,
	business_stream_name VARCHAR(100) NOT NULL,
	CONSTRAINT PK_business_stream PRIMARY KEY CLUSTERED (id)
);

CREATE TABLE job_board.dbo.company (
    id INT NOT NULL IDENTITY,
    company_name VARCHAR(100) NOT NULL,
    profile_description VARCHAR(100) NOT NULL,
    business_stream_id INT NOT NULL,
    establishment_date DATE,
    company_website_url VARCHAR(255),
    CONSTRAINT PK_company PRIMARY KEY CLUSTERED (id),
    CONSTRAINT FK_BusinessStream_Company FOREIGN KEY (business_stream_id) 
    	REFERENCES job_board.dbo.business_stream (id)
    	ON DELETE CASCADE
      	ON UPDATE CASCADE
);

CREATE TABLE job_board.dbo.company_image (
    id INT NOT NULL IDENTITY,
    company_id INT NOT NULL,
    company_image VARCHAR(255),
    CONSTRAINT PK_company_image PRIMARY KEY CLUSTERED (id),
    CONSTRAINT FK_Company_CompanyImage FOREIGN KEY (company_id) 
    	REFERENCES job_board.dbo.company (id)
    	ON DELETE CASCADE
      	ON UPDATE CASCADE
);

/* User Management Section */
CREATE TABLE job_board.dbo.user_type (
    id INT NOT NULL IDENTITY,
    user_type_name VARCHAR(20) NOT NULL,
    CONSTRAINT PK_user_type PRIMARY KEY CLUSTERED (id)
);

CREATE TABLE job_board.dbo.user_account (
    id INT NOT NULL IDENTITY,
    user_type_id INT NOT NULL,
    email VARCHAR(255) NOT NULL,
    password VARCHAR(100) NOT NULL,
    date_of_birth DATE NOT NULL,
    gender CHAR(1) NOT NULL,
    is_active CHAR(1) NOT NULL,
    contact_number VARCHAR(10) NOT NULL,
    email_notification_active char(1) NOT NULL,
    user_image VARCHAR(255),
    registration_date DATE NOT NULL,
    CONSTRAINT PK_user_account PRIMARY KEY CLUSTERED (id),
    CONSTRAINT FK_UserType_UserAccount FOREIGN KEY (user_type_id) 
    	REFERENCES job_board.dbo.user_type (id)
    	ON DELETE CASCADE
      	ON UPDATE CASCADE
);

CREATE TABLE job_board.dbo.user_log (
    user_account_id INT NOT NULL,
    last_login_date DATE,
    last_job_apply_date DATE,
    CONSTRAINT PK_user_log PRIMARY KEY CLUSTERED (user_account_id),
    CONSTRAINT FK_UserAccount_UserLog FOREIGN KEY (user_account_id) 
    	REFERENCES job_board.dbo.user_account (id)
);

/* Seeker Profile Builder Section */
CREATE TABLE job_board.dbo.seeker_profile (
	--id INT NOT NULL IDENTITY,
    user_account_id INT NOT NULL,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    current_salary DECIMAL(5,2),
    is_annually_monthly CHAR(1),
    currency VARCHAR(50),
    CONSTRAINT PK_seeker_profile PRIMARY KEY CLUSTERED (user_account_id),
    CONSTRAINT FK_UserAccount_SeekerProfile FOREIGN KEY (user_account_id) 
    	REFERENCES job_board.dbo.user_account (id)
    	ON DELETE CASCADE
      	ON UPDATE CASCADE
);

CREATE TABLE job_board.dbo.eduaction_detail (
	--id INT NOT NULL IDENTITY,
    user_account_id INT NOT NULL,
    certificate_degree_name VARCHAR(50) NOT NULL,
    major VARCHAR(50) NOT NULL,
    institute_university_name VARCHAR(50) NOT NULL,
    starting_date DATE NOT NULL,
    completion_date DATE,
    porcentage DECIMAL(5,2),
    cgpa DECIMAL(5,2),
    CONSTRAINT PK_eduaction_detail PRIMARY KEY CLUSTERED (user_account_id),
    CONSTRAINT FK_UserAccount_EducationalDetail FOREIGN KEY (user_account_id) 
    	REFERENCES job_board.dbo.user_account (id)
    	ON DELETE CASCADE
      	ON UPDATE CASCADE
);

CREATE TABLE job_board.dbo.experience_detail (
	--id INT NOT NULL IDENTITY,
    user_account_id INT NOT NULL,
    is_current_job CHAR(1) NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE,
    job_title VARCHAR(50) NOT NULL,
    company_name VARCHAR(100) NOT NULL,
    job_location_city VARCHAR(50) NOT NULL,
    job_location_state VARCHAR(50) NOT NULL,
    job_location_country VARCHAR(50) NOT NULL,
    description VARCHAR(4000) NOT NULL,
    CONSTRAINT PK_experience_detail PRIMARY KEY CLUSTERED (user_account_id),
    CONSTRAINT FK_UserAccount_ExperienceDetail FOREIGN KEY (user_account_id) 
    	REFERENCES job_board.dbo.user_account (id)
    	ON DELETE CASCADE
      	ON UPDATE CASCADE
);

CREATE TABLE job_board.dbo.skill_set (
    id INT NOT NULL IDENTITY,
    skill_set_name VARCHAR(50) NOT NULL,
    CONSTRAINT PK_skill_set PRIMARY KEY CLUSTERED (id)
);

CREATE TABLE job_board.dbo.user_account_skill_set (
	--id INT NOT NULL IDENTITY,
    user_account_id INT NOT NULL,
    skill_set_id INT NOT NULL,
    skill_level INT NOT NULL,
    CONSTRAINT PK_user_account_skill_set PRIMARY KEY CLUSTERED (user_account_id,skill_set_id),
    CONSTRAINT FK_UserAccount_AccountSkillSet FOREIGN KEY (user_account_id) 
    	REFERENCES job_board.dbo.user_account (id)
    	ON DELETE CASCADE
      	ON UPDATE CASCADE,
    CONSTRAINT FK_SkillSet_AccountSkillSet FOREIGN KEY (skill_set_id) 
    	REFERENCES job_board.dbo.skill_set (id)
    	ON DELETE CASCADE
      	ON UPDATE CASCADE
);

/* Job Post Management Section */
CREATE TABLE job_board.dbo.job_location (
    id INT NOT NULL IDENTITY,
    street_address VARCHAR(100) NOT NULL,
    city VARCHAR(50) NOT NULL,
    state VARCHAR(50) NOT NULL,
    country VARCHAR(50) NOT NULL,
    zip VARCHAR(50) NOT NULL,
    CONSTRAINT PK_job_location PRIMARY KEY CLUSTERED (id)
);

CREATE TABLE job_board.dbo.job_type (
    id INT NOT NULL IDENTITY,
    job_type VARCHAR(20) NOT NULL,
    CONSTRAINT PK_job_type PRIMARY KEY CLUSTERED (id)
);

CREATE TABLE job_board.dbo.job_post (
    id INT NOT NULL IDENTITY,
    posted_by_id INT NOT NULL,
    job_type_id INT NOT NULL,
    company_id INT NOT NULL,
    is_company_name_hidden CHAR(1) NOT NULL,
    create_date DATE NOT NULL,
    job_description VARCHAR(500) NOT NULL,
    job_location_id INT NOT NULL,
    is_active CHAR(1) NOT NULL,
    CONSTRAINT PK_job_post PRIMARY KEY CLUSTERED (id),
    CONSTRAINT FK_UserAccount_JobPost FOREIGN KEY (posted_by_id) 
    	REFERENCES job_board.dbo.user_account (id)
    	ON DELETE CASCADE
      	ON UPDATE CASCADE,
    CONSTRAINT FK_JobType_JobPost FOREIGN KEY (job_type_id) 
    	REFERENCES job_board.dbo.job_type (id)
    	ON DELETE CASCADE
      	ON UPDATE CASCADE,
    CONSTRAINT FK_Company_JobPost FOREIGN KEY (company_id) 
    	REFERENCES job_board.dbo.company (id)
    	ON DELETE CASCADE
      	ON UPDATE CASCADE,
    CONSTRAINT FK_JobLocation_JobPost FOREIGN KEY (job_location_id) 
    	REFERENCES job_board.dbo.job_location (id)
    	ON DELETE CASCADE
      	ON UPDATE CASCADE
);

CREATE TABLE job_board.dbo.job_post_skill_set (
    skill_set_id INT NOT NULL,
    job_post_id INT NOT NULL,
    skill_level INT NOT NULL,
    CONSTRAINT PK_job_post_skill_set PRIMARY KEY CLUSTERED (skill_set_id,job_post_id),
    CONSTRAINT FK_SkillSet_JobPostSkillSet FOREIGN KEY (skill_set_id)
    	REFERENCES job_board.dbo.skill_set (id),
    CONSTRAINT FK_JobPost_JobPostSkillSet FOREIGN KEY (job_post_id) 
    	REFERENCES job_board.dbo.job_post (id)
);

CREATE TABLE job_board.dbo.job_post_activity (
    user_account_id INT NOT NULL,
    job_post_id INT,
    apply_date DATE NOT NULL,
    CONSTRAINT PK_job_post_activity PRIMARY KEY CLUSTERED (user_account_id, job_post_id),
    CONSTRAINT FK_UserAccount_JobPostActivity FOREIGN KEY (user_account_id) 
    	REFERENCES user_account (id),
    CONSTRAINT FK_JobPost_JobPostActivity FOREIGN KEY (job_post_id) 
    	REFERENCES job_post (id)
    	ON DELETE CASCADE
      	ON UPDATE CASCADE
);