create database pathwaytojobs;
use pathwaytojobs;

/*table 1*/
CREATE TABLE email_notifications (
    notification_id INT PRIMARY KEY AUTO_INCREMENT,
    subject_id INT,
    content TEXT,
    is_read BOOLEAN,
    timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    sub_id INT
);

INSERT INTO email_notifications (subject_id, content, is_read, sub_id) VALUES
(1, 'Meeting Reminder', false, 1001),
(2, 'New Product Launch', false, 1002),
(3, 'Weekly Newsletter', true, 1003),
(1, 'Report Submission Deadline', false, 1004),
(4, 'Discount Offer', false, 1005);


select*from email_notifications;

/*table 2*/
CREATE TABLE users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    email VARCHAR(255) UNIQUE,
    username VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL,
    sub_id INT
);





select*from users;

/*table 3*/
CREATE TABLE job_listing (
    job_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    title VARCHAR(255) NOT NULL,
    description TEXT,
    location VARCHAR(255),
    salary DECIMAL(10, 2),
    date_posted DATE,
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);


INSERT INTO job_listing (user_id, title, description, location, salary, date_posted) VALUES
(1, 'Software Engineer', 'We are looking for a skilled software engineer to join our team.', 'New York', 80000.00, '2024-03-19'),
(1, 'Data Analyst', 'We are seeking a data analyst with strong analytical skills.', 'San Francisco', 70000.00, '2024-03-18'),
(2, 'Graphic Designer', 'Looking for a creative graphic designer to join our marketing team.', 'Los Angeles', 60000.00, '2024-03-19'),
(3, 'Sales Manager', 'Seeking an experienced sales manager to lead our sales team.', 'Chicago', 90000.00, '2024-03-18'),
(4, 'Web Developer', 'We are in need of a skilled web developer proficient in HTML, CSS, and JavaScript.', 'Seattle', 75000.00, '2024-03-17'),
(5, 'Marketing Specialist', 'Join our marketing team and help us develop and execute marketing strategies.', 'Boston', 65000.00, '2024-03-16');

select*from job_listing;

/*table4*/
CREATE TABLE job_listing_by_company (
    company_id INT AUTO_INCREMENT PRIMARY KEY,
    company_address VARCHAR(255),
    company_branch VARCHAR(255),
    location VARCHAR(255)
);

INSERT INTO job_listing_by_company (company_address, company_branch, location) VALUES
('123 Main St', 'Technology', 'New York'),
('456 Elm St', 'Marketing', 'Los Angeles'),
('789 Oak St', 'Sales', 'Chicago'),
('101 Pine St', 'Finance', 'San Francisco');

select*from job_listing_by_company;

/*table5*/
CREATE TABLE applications (
    application_id INT AUTO_INCREMENT PRIMARY KEY,
    status VARCHAR(50),
    application_date DATE,
    user_id INT,
    job_id INT,
    FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (job_id) REFERENCES job_listing(job_id)
);
INSERT INTO applications (status, application_date, user_id, job_id) VALUES
('Pending', '2024-03-19', 1, 1),
('Under Review', '2024-03-18', 2, 2),
('Accepted', '2024-03-17', 3, 3),
('Rejected', '2024-03-16', 4, 4);

select*from applications;

/*table6*/
CREATE TABLE companies (
    company_id INT AUTO_INCREMENT PRIMARY KEY,
    location VARCHAR(255),
    industry VARCHAR(255),
    website VARCHAR(255),
    description TEXT,
    company_name VARCHAR(255)
);
INSERT INTO companies (location, industry, website, description, company_name) VALUES
('New York', 'Technology', 'http://example.com', 'Leading technology company specializing in software development.', 'Tech Solutions Inc.'),
('Los Angeles', 'Marketing', 'http://example.org', 'Innovative marketing agency providing creative solutions for businesses.', 'Marketing Masters LLC'),
('Chicago', 'Finance', 'http://example.net', 'Finance firm offering investment and advisory services to clients worldwide.', 'Financial Advisors Group'),
('San Francisco', 'Healthcare', 'http://example.co', 'Provider of healthcare services and solutions focused on patient care and innovation.', 'HealthFirst Medical');

select*from companies;

/*table7*/
CREATE TABLE skills (
    skill_id INT AUTO_INCREMENT PRIMARY KEY,
    skill_name VARCHAR(255)
);

INSERT INTO skills (skill_name) VALUES
('Programming'),
('Graphic Design'),
('Data Analysis'),
('Project Management'),
('Marketing'),
('Customer Service');

select*from skills;

/*table8*/
CREATE TABLE resumes (
    resume_id INT AUTO_INCREMENT PRIMARY KEY,
    resume_text TEXT,
    user_id INT,
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);
INSERT INTO resumes (resume_text, user_id) VALUES
('Education: Bachelor of Science in Computer Science. Skills: Java, Python, SQL.', 1),
('Experience: Graphic Designer at XYZ Company. Skills: Adobe Photoshop, Illustrator.', 2),
('Education: Master of Business Administration. Experience: Marketing Manager at ABC Corp.', 3),
('Experience: Web Developer at XYZ Tech. Skills: HTML, CSS, JavaScript.', 4);

select*from resumes;


/*table9*/
create table register (
username VARCHAR(255),
email varchar(255),
pass int not null,
confirm_pass int not null
);

select*from register;