-- -- This file is to bootstrap a database for the CS3200 project. 

-- -- Create a new database.  You can change the Username later.  You'll
-- -- need this Username in the FLASK API file(s),  the AppSmith 
-- -- data source creation.
-- create database nosmoke_db;
-- -- Via the Docker Compose file, a special user called webapp will 
-- -- be created in MySQL. We are going to grant that user 
-- -- all privilages to the new database we just created. 
-- -- TODO: If you changed the Username of the database above, you need 
-- -- to change it here too.
-- grant all privileges on nosmoke_db.* to 'webapp'@'%';
-- flush privileges;

-- -- Move into the database we just created.
-- -- TODO: If you changed the Username of the database above, you need to
-- -- change it here too. 
-- use nosmoke_db;

-- -- Put your DDL 

-- -- Users table
-- CREATE TABLE IF NOT EXISTS Users (
--   User_ID INT AUTO_INCREMENT PRIMARY KEY,
--   Username VARCHAR(255) NOT NULL,
--   Age INT,
--   Economic_Status VARCHAR(60),
--   Health VARCHAR(60),
--   Years_Vaping INT
-- );

-- -- Badges table
-- CREATE TABLE IF NOT EXISTS Badges (
--   Badge_ID INT AUTO_INCREMENT PRIMARY KEY,
--   Username TEXT,
--   Details TEXT
-- );

-- -- Challenges table
-- CREATE TABLE IF NOT EXISTS Challenges (
--   Challenge_ID INT AUTO_INCREMENT PRIMARY KEY,
--   Levels INT,
--   User_ID INT,
--   Badges VARCHAR(255),
--   Begin_Date DATE,
--   End_Date DATE,
--   FOREIGN KEY (User_ID) REFERENCES Users(User_ID) 
--      ON DELETE CASCADE
--      ON UPDATE CASCADE
-- );

-- -- Education table
-- CREATE TABLE IF NOT EXISTS Education (
--   Resource_ID INT AUTO_INCREMENT PRIMARY KEY,
--   Articles TEXT,
--   Videos TEXT,
--   User_ID INT,
--   Figures TEXT,
--   FOREIGN KEY (User_ID) REFERENCES Users(User_ID) 
--      ON DELETE CASCADE 
--      ON UPDATE CASCADE
-- );

-- -- Savings table
-- CREATE TABLE IF NOT EXISTS Savings (
--   Savings_ID INT AUTO_INCREMENT PRIMARY KEY,
--   User_ID INT,
--   Amount DECIMAL(10, 2),
--   Curr_Date DATE,
--   FOREIGN KEY (User_ID) REFERENCES Users(User_ID) 
--      ON DELETE CASCADE 
--      ON UPDATE CASCADE
-- );

-- -- SocialSupport table
-- CREATE TABLE IF NOT EXISTS SocialSupport (
--   Support_ID INT AUTO_INCREMENT PRIMARY KEY,
--   User_ID INT,
--   Content TEXT,
--   Interactions TEXT,
--   Posts TEXT,
--   FOREIGN KEY (User_ID) REFERENCES Users(User_ID)
--      ON DELETE CASCADE 
--      ON UPDATE CASCADE
-- );

-- -- Posts table
-- CREATE TABLE IF NOT EXISTS Posts (
--   Post_ID INT AUTO_INCREMENT PRIMARY KEY,
--   Support_ID INT,
--   User_ID INT,
--   Interactions TEXT,
--   Content TEXT,
--   Curr_Date DATE,
--   FOREIGN KEY (Support_ID) REFERENCES SocialSupport(Support_ID)
--      ON DELETE CASCADE 
--      ON UPDATE CASCADE,
--   FOREIGN KEY (User_ID) REFERENCES Users(User_ID)
--      ON DELETE CASCADE 
--      ON UPDATE CASCADE
-- );

-- -- Comments table
-- CREATE TABLE IF NOT EXISTS Comments (
--   Comment_ID INT AUTO_INCREMENT PRIMARY KEY,
--   Post_ID INT,
--   User_ID INT,
--   Content TEXT,
--   Curr_Date DATE,
--   FOREIGN KEY (Post_ID) REFERENCES Posts(Post_ID)
--      ON DELETE CASCADE 
--      ON UPDATE CASCADE,
--   FOREIGN KEY (User_ID) REFERENCES Users(User_ID)
--      ON DELETE CASCADE 
--      ON UPDATE CASCADE
-- );

-- -- User_Badges table
-- CREATE TABLE IF NOT EXISTS User_Badges (
--   User_ID INT NOT NULL,
--   Badge_ID INT NOT NULL,
--   Earned_Date DATE,
--   PRIMARY KEY (User_ID, Badge_ID),
--   FOREIGN KEY (User_ID) REFERENCES Users(User_ID)
--      ON DELETE CASCADE 
--      ON UPDATE CASCADE,
--   FOREIGN KEY (Badge_ID) REFERENCES Badges(Badge_ID)
--      ON DELETE CASCADE 
--      ON UPDATE CASCADE
-- );

-- -- User_Challenges table
-- CREATE TABLE IF NOT EXISTS User_Challenges (
--   User_ID INT NOT NULL,
--   Challenge_ID INT NOT NULL,
--   Progress FLOAT,
--   Completion VARCHAR(50),
--   PRIMARY KEY (User_ID, Challenge_ID),
--   FOREIGN KEY (User_ID) REFERENCES Users(User_ID)
--      ON DELETE CASCADE 
--      ON UPDATE CASCADE,
--   FOREIGN KEY (Challenge_ID) REFERENCES Challenges(Challenge_ID)
--      ON DELETE CASCADE 
--      ON UPDATE CASCADE
-- );

-- -- User_Education table
-- CREATE TABLE IF NOT EXISTS User_Education (
--   User_ID INT NOT NULL,
--   Resource_ID INT NOT NULL,
--   PRIMARY KEY(User_ID, Resource_ID),
--   FOREIGN KEY (User_ID) REFERENCES Users(User_ID)
--      ON DELETE CASCADE 
--      ON UPDATE CASCADE,
--   FOREIGN KEY (Resource_ID) REFERENCES Education(Resource_ID)
--      ON DELETE CASCADE 
--      ON UPDATE CASCADE
-- );

-- -- User_Support table
-- CREATE TABLE IF NOT EXISTS User_Support (
--   User_ID INT NOT NULL,
--   Support_ID INT NOT NULL,
--   PRIMARY KEY(User_ID, Support_ID),
--   FOREIGN KEY (User_ID) REFERENCES Users(User_ID)
--      ON DELETE CASCADE 
--      ON UPDATE CASCADE,
--   FOREIGN KEY (Support_ID) REFERENCES SocialSupport(Support_ID)
--      ON DELETE CASCADE 
--      ON UPDATE CASCADE
-- );

-- -- Post_Comments table
-- CREATE TABLE IF NOT EXISTS Post_Coments (
--   Post_ID INT NOT NULL,
--   Comment_ID INT NOT NULL,
--   PRIMARY KEY(Post_ID, Comment_ID),
--   FOREIGN KEY (Post_ID) REFERENCES Posts(Post_ID)
--      ON DELETE CASCADE 
--      ON UPDATE CASCADE,
--   FOREIGN KEY (Comment_ID) REFERENCES Comments(Comment_ID)
--      ON DELETE CASCADE 
--      ON UPDATE CASCADE
-- );

-- -- Support_Posts table
-- CREATE TABLE IF NOT EXISTS Support_Posts (
--   Support_ID INT NOT NULL,
--   Post_ID INT NOT NULL,
--   PRIMARY KEY(Support_ID, Post_ID),
--   FOREIGN KEY (Support_ID) REFERENCES SocialSupport(Support_ID)
--      ON DELETE CASCADE 
--      ON UPDATE CASCADE,
--   FOREIGN KEY (Post_ID) REFERENCES Posts(Post_ID)
--      ON DELETE CASCADE 
--      ON UPDATE CASCADE
-- );

-- -- Badges_Challenges table
-- CREATE TABLE IF NOT EXISTS Badges_Challenges (
--   Badge_ID INT NOT NULL,
--   Challenge_ID INT NOT NULL,
--   PRIMARY KEY(Badge_ID, Challenge_ID),
--   FOREIGN KEY (Badge_ID) REFERENCES Badges(Badge_ID)
--      ON DELETE CASCADE 
--      ON UPDATE CASCADE,
--   FOREIGN KEY (Challenge_ID) REFERENCES Challenges(Challenge_ID)
--      ON DELETE CASCADE 
--      ON UPDATE CASCADE
-- );

-- -- Completed_Challenge table
-- CREATE TABLE IF NOT EXISTS Completed_Challenge (
--   User_ID INT NOT NULL,
--   Challenge_ID INT NOT NULL,
--   PRIMARY KEY(User_ID, Challenge_ID),
--   FOREIGN KEY (User_ID) REFERENCES Users(User_ID)
--      ON DELETE CASCADE 
--      ON UPDATE CASCADE,
--   FOREIGN KEY (Challenge_ID) REFERENCES Challenges(Challenge_ID)
--      ON DELETE CASCADE 
--      ON UPDATE CASCADE
-- );


-- -- Add sample data. 
-- insert into Users (Username, Age, Economics_Status, Health, Years_Vaping) values ('Leandra Salerg', 19, 'Low', 'Fair', 10);
-- insert into Users (Username, Age, Economics_Status, Health, Years_Vaping) values ('Benedicta Lauderdale', 37, 'Middle', 'Fair', 10);
-- insert into Users (Username, Age, Economics_Status, Health, Years_Vaping) values ('Josselyn Malamore', 33, 'Low', 'Excellent', 4);
-- insert into Users (Username, Age, Economics_Status, Health, Years_Vaping) values ('Alfy Bereford', 23, 'Middle', 'Poor', 10);
-- insert into Users (Username, Age, Economics_Status, Health, Years_Vaping) values ('Codee Claricoates', 31, 'High', 'Poor', 10);
-- insert into Users (Username, Age, Economics_Status, Health, Years_Vaping) values ('Pooh Fernehough', 60, 'Middle', 'Poor', 5);
-- insert into Users (Username, Age, Economics_Status, Health, Years_Vaping) values ('Lois Pond', 30, 'Low', 'Fair', 8);
-- insert into Users (Username, Age, Economics_Status, Health, Years_Vaping) values ('Bond Titchard', 30, 'Middle', 'Good', 8);
-- insert into Users (Username, Age, Economics_Status, Health, Years_Vaping) values ('Alexandros Rubenczyk', 22, 'High', 'Fair', 3);
-- insert into Users (Username, Age, Economics_Status, Health, Years_Vaping) values ('Talbot Hess', 31, 'Middle', 'Poor', 4);
-- insert into Users (Username, Age, Economics_Status, Health, Years_Vaping) values ('Cullen Hesse', 33, 'High', 'Critical', 10);
-- insert into Users (Username, Age, Economics_Status, Health, Years_Vaping) values ('Yelena Sandells', 40, 'Middle', 'Critical', 2);
-- insert into Users (Username, Age, Economics_Status, Health, Years_Vaping) values ('Alphonso Scandroot', 45, 'High', 'Good', 5);
-- insert into Users (Username, Age, Economics_Status, Health, Years_Vaping) values ('Joby Obbard', 40, 'Middle', 'Poor', 2);
-- insert into Users (Username, Age, Economics_Status, Health, Years_Vaping) values ('Annalise Richley', 50, 'High', 'Fair', 6);
-- insert into Users (Username, Age, Economics_Status, Health, Years_Vaping) values ('Tania Ormrod', 45, 'High', 'Excellent', 3);
-- insert into Users (Username, Age, Economics_Status, Health, Years_Vaping) values ('Kristos MacGilrewy', 24, 'High', 'Critical', 3);
-- insert into Users (Username, Age, Economics_Status, Health, Years_Vaping) values ('Jaquith Sorsbie', 45, 'High', 'Poor', 5);
-- insert into Users (Username, Age, Economics_Status, Health, Years_Vaping) values ('Kahaleel Imlin', 32, 'Low', 'Fair', 6);
-- insert into Users (Username, Age, Economics_Status, Health, Years_Vaping) values ('Holly Thrush', 60, 'High', 'Poor', 4);
-- insert into Users (Username, Age, Economics_Status, Health, Years_Vaping) values ('Bradan Callender', 26, 'Middle', 'Fair', 1);
-- insert into Users (Username, Age, Economics_Status, Health, Years_Vaping) values ('Linn Vasilchenko', 50, 'Low', 'Fair', 6);
-- insert into Users (Username, Age, Economics_Status, Health, Years_Vaping) values ('Alfreda Colson', 39, 'Low', 'Fair', 9);
-- insert into Users (Username, Age, Economics_Status, Health, Years_Vaping) values ('Maddi Ritzman', 19, 'High', 'Critical', 3);
-- insert into Users (Username, Age, Economics_Status, Health, Years_Vaping) values ('Nikoletta Daborne', 26, 'Middle', 'Fair', 5);
-- insert into Users (Username, Age, Economics_Status, Health, Years_Vaping) values ('Persis McBrearty', 38, 'Middle', 'Fair', 9);
-- insert into Users (Username, Age, Economics_Status, Health, Years_Vaping) values ('Max McAreavey', 48, 'Low', 'Good', 6);
-- insert into Users (Username, Age, Economics_Status, Health, Years_Vaping) values ('Tess Duran', 19, 'Low', 'Excellent', 1);
-- insert into Users (Username, Age, Economics_Status, Health, Years_Vaping) values ('Myranda Salla', 27, 'Middle', 'Poor', 7);
-- insert into Users (Username, Age, Economics_Status, Health, Years_Vaping) values ('Nani Dunthorn', 35, 'Middle', 'Good', 3);
-- insert into Users (Username, Age, Economics_Status, Health, Years_Vaping) values ('Leon Osipenko', 31, 'High', 'Critical', 4);
-- insert into Users (Username, Age, Economics_Status, Health, Years_Vaping) values ('Grier Lyttle', 23, 'High', 'Critical', 2);
-- insert into Users (Username, Age, Economics_Status, Health, Years_Vaping) values ('Dyan Jeandillou', 30, 'Middle', 'Critical', 2);
-- insert into Users (Username, Age, Economics_Status, Health, Years_Vaping) values ('Fitz Lackinton', 33, 'Middle', 'Poor', 10);
-- insert into Users (Username, Age, Economics_Status, Health, Years_Vaping) values ('Roz Blenkhorn', 23, 'High', 'Fair', 9);
-- insert into Users (Username, Age, Economics_Status, Health, Years_Vaping) values ('Naomi Mahood', 45, 'Low', 'Poor', 2);
-- insert into Users (Username, Age, Economics_Status, Health, Years_Vaping) values ('Brennan Allonby', 18, 'Low', 'Critical', 10);
-- insert into Users (Username, Age, Economics_Status, Health, Years_Vaping) values ('Heidi Kneale', 45, 'Low', 'Fair', 9);
-- insert into Users (Username, Age, Economics_Status, Health, Years_Vaping) values ('Goldie MacKibbon', 22, 'Middle', 'Fair', 10);
-- insert into Users (Username, Age, Economics_Status, Health, Years_Vaping) values ('Victoir Crafter', 25, 'Middle', 'Critical', 1);
-- insert into Users (Username, Age, Economics_Status, Health, Years_Vaping) values ('Jemmie Learman', 29, 'Middle', 'Critical', 2);
-- insert into Users (Username, Age, Economics_Status, Health, Years_Vaping) values ('Tommy Ledes', 45, 'Middle', 'Excellent', 6);
-- insert into Users (Username, Age, Economics_Status, Health, Years_Vaping) values ('Bari Semeradova', 40, 'Middle', 'Critical', 3);
-- insert into Users (Username, Age, Economics_Status, Health, Years_Vaping) values ('Verina Cocozza', 20, 'Middle', 'Critical', 6);
-- insert into Users (Username, Age, Economics_Status, Health, Years_Vaping) values ('Flory Blasgen', 32, 'Low', 'Poor', 1);

-- insert into Badges (Username, Details) values ('Beginner', 'For new members who have just started');
-- insert into Badges (Username, Details) values ('Intermediate', 'For members who have completed half challenges');
-- insert into Badges (Username, Details) values ('Champion', 'For members who have completed all challenges');
-- insert into Badges (Username, Details) values ('Beginner', 'For new members who have just started');
-- insert into Badges (Username, Details) values ('Intermediate', 'For members who have completed half challenges');
-- insert into Badges (Username, Details) values ('Champion', 'For members who have completed all challenges');
-- insert into Badges (Username, Details) values ('Beginner', 'For new members who have just started');
-- insert into Badges (Username, Details) values ('Intermediate', 'For members who have completed half challenges');
-- insert into Badges (Username, Details) values ('Champion', 'For members who have completed all challenges');
-- insert into Badges (Username, Details) values ('Beginner', 'For new members who have just started');
-- insert into Badges (Username, Details) values ('Intermediate', 'For members who have completed half challenges');
-- insert into Badges (Username, Details) values ('Champion', 'For members who have completed all challenges');
-- insert into Badges (Username, Details) values ('Beginner', 'For new members who have just started');
-- insert into Badges (Username, Details) values ('Intermediate', 'For members who have completed half challenges');
-- insert into Badges (Username, Details) values ('Champion', 'For members who have completed all challenges');
-- insert into Badges (Username, Details) values ('Beginner', 'For new members who have just started');
-- insert into Badges (Username, Details) values ('Intermediate', 'For members who have completed half challenges');
-- insert into Badges (Username, Details) values ('Champion', 'For members who have completed all challenges');
-- insert into Badges (Username, Details) values ('Beginner', 'For new members who have just started');
-- insert into Badges (Username, Details) values ('Intermediate', 'For members who have completed half challenges');
-- insert into Badges (Username, Details) values ('Champion', 'For members who have completed all challenges');
-- insert into Badges (Username, Details) values ('Beginner', 'For new members who have just started');
-- insert into Badges (Username, Details) values ('Intermediate', 'For members who have completed half challenges');
-- insert into Badges (Username, Details) values ('Champion', 'For members who have completed all challenges');
-- insert into Badges (Username, Details) values ('Beginner', 'For new members who have just started');
-- insert into Badges (Username, Details) values ('Intermediate', 'For members who have completed half challenges');
-- insert into Badges (Username, Details) values ('Champion', 'For members who have completed all challenges');
-- insert into Badges (Username, Details) values ('Beginner', 'For new members who have just started');
-- insert into Badges (Username, Details) values ('Intermediate', 'For members who have completed half challenges');
-- insert into Badges (Username, Details) values ('Champion', 'For members who have completed all challenges');
-- insert into Badges (Username, Details) values ('Beginner', 'For new members who have just started');
-- insert into Badges (Username, Details) values ('Intermediate', 'For members who have completed half challenges');
-- insert into Badges (Username, Details) values ('Champion', 'For members who have completed all challenges');
-- insert into Badges (Username, Details) values ('Beginner', 'For new members who have just started');
-- insert into Badges (Username, Details) values ('Intermediate', 'For members who have completed half challenges');
-- insert into Badges (Username, Details) values ('Champion', 'For members who have completed all challenges');
-- insert into Badges (Username, Details) values ('Beginner', 'For new members who have just started');
-- insert into Badges (Username, Details) values ('Intermediate', 'For members who have completed half challenges');
-- insert into Badges (Username, Details) values ('Champion', 'For members who have completed all challenges');
-- insert into Badges (Username, Details) values ('Beginner', 'For new members who have just started');
-- insert into Badges (Username, Details) values ('Intermediate', 'For members who have completed half challenges');
-- insert into Badges (Username, Details) values ('Champion', 'For members who have completed all challenges');
-- insert into Badges (Username, Details) values ('Beginner', 'For new members who have just started');
-- insert into Badges (Username, Details) values ('Intermediate', 'For members who have completed half challenges');
-- insert into Badges (Username, Details) values ('Champion', 'For members who have completed all challenges');

-- insert into Challenges (Levels, Badges, Begin_Date, End_Date) values (1, 'Beginner', '2022-01-01', '2024-06-30');
-- insert into Challenges (Levels, Badges, Begin_Date, End_Date) values (2, 'Intermediate', '2022-10-22', '2024-04-20');
-- insert into Challenges (Levels, Badges, Begin_Date, End_Date) values (3, 'Champion', '2022-02-15', '2024-11-11');
-- insert into Challenges (Levels, Badges, Begin_Date, End_Date) values (4, 'Beginner', '2022-08-12', '2024-11-11');
-- insert into Challenges (Levels, Badges, Begin_Date, End_Date) values (5, 'Intermediate', '2022-06-30', '2024-05-05');
-- insert into Challenges (Levels, Badges, Begin_Date, End_Date) values (6, 'Champion', '2022-06-30', '2024-02-15');
-- insert into Challenges (Levels, Badges, Begin_Date, End_Date) values (7, 'Beginner', '2022-05-05', '2024-10-22');
-- insert into Challenges (Levels, Badges, Begin_Date, End_Date) values (8, 'Intermediate', '2022-11-11', '2024-10-22');
-- insert into Challenges (Levels, Badges, Begin_Date, End_Date) values (9, 'Champion', '2022-01-01', '2024-10-22');
-- insert into Challenges (Levels, Badges, Begin_Date, End_Date) values (10, 'Beginner', '2022-07-25', '2024-12-05');
-- insert into Challenges (Levels, Badges, Begin_Date, End_Date) values (11, 'Intermediate', '2022-03-10', '2024-12-05');
-- insert into Challenges (Levels, Badges, Begin_Date, End_Date) values (12, 'Champion', '2022-08-12', '2024-07-25');
-- insert into Challenges (Levels, Badges, Begin_Date, End_Date) values (13, 'Beginner', '2022-11-11', '2024-05-05');
-- insert into Challenges (Levels, Badges, Begin_Date, End_Date) values (14, 'Intermediate', '2022-06-30', '2024-05-05');
-- insert into Challenges (Levels, Badges, Begin_Date, End_Date) values (15, 'Champion', '2022-04-20', '2024-05-05');
-- insert into Challenges (Levels, Badges, Begin_Date, End_Date) values (16, 'Beginner', '2022-02-15', '2024-11-11');
-- insert into Challenges (Levels, Badges, Begin_Date, End_Date) values (17, 'Intermediate', '2022-09-18', '2024-11-11');
-- insert into Challenges (Levels, Badges, Begin_Date, End_Date) values (18, 'Champion', '2022-03-10', '2024-12-05');
-- insert into Challenges (Levels, Badges, Begin_Date, End_Date) values (19, 'Beginner', '2022-02-15', '2024-06-30');
-- insert into Challenges (Levels, Badges, Begin_Date, End_Date) values (20, 'Intermediate', '2022-04-20', '2024-02-15');
-- insert into Challenges (Levels, Badges, Begin_Date, End_Date) values (21, 'Champion', '2022-08-12', '2024-06-30');
-- insert into Challenges (Levels, Badges, Begin_Date, End_Date) values (22, 'Beginner', '2022-11-11', '2024-02-15');
-- insert into Challenges (Levels, Badges, Begin_Date, End_Date) values (23, 'Intermediate', '2022-01-01', '2024-01-01');
-- insert into Challenges (Levels, Badges, Begin_Date, End_Date) values (24, 'Champion', '2022-08-12', '2024-10-22');
-- insert into Challenges (Levels, Badges, Begin_Date, End_Date) values (25, 'Beginner', '2022-03-10', '2024-07-25');
-- insert into Challenges (Levels, Badges, Begin_Date, End_Date) values (26, 'Intermediate', '2022-08-12', '2024-08-12');
-- insert into Challenges (Levels, Badges, Begin_Date, End_Date) values (27, 'Champion', '2022-04-20', '2024-03-10');
-- insert into Challenges (Levels, Badges, Begin_Date, End_Date) values (28, 'Beginner', '2022-05-05', '2024-01-01');
-- insert into Challenges (Levels, Badges, Begin_Date, End_Date) values (29, 'Intermediate', '2022-10-22', '2024-04-20');
-- insert into Challenges (Levels, Badges, Begin_Date, End_Date) values (30, 'Champion', '2022-08-12', '2024-09-18');
-- insert into Challenges (Levels, Badges, Begin_Date, End_Date) values (31, 'Beginner', '2022-04-20', '2024-03-10');
-- insert into Challenges (Levels, Badges, Begin_Date, End_Date) values (32, 'Intermediate', '2022-11-11', '2024-03-10');
-- insert into Challenges (Levels, Badges, Begin_Date, End_Date) values (33, 'Champion', '2022-04-20', '2024-08-12');
-- insert into Challenges (Levels, Badges, Begin_Date, End_Date) values (34, 'Beginner', '2022-02-15', '2024-01-01');
-- insert into Challenges (Levels, Badges, Begin_Date, End_Date) values (35, 'Intermediate', '2022-11-11', '2024-03-10');
-- insert into Challenges (Levels, Badges, Begin_Date, End_Date) values (36, 'Champion', '2022-11-11', '2024-05-05');
-- insert into Challenges (Levels, Badges, Begin_Date, End_Date) values (37, 'Beginner', '2022-07-25', '2024-12-05');
-- insert into Challenges (Levels, Badges, Begin_Date, End_Date) values (38, 'Intermediate', '2022-07-25', '2024-09-18');
-- insert into Challenges (Levels, Badges, Begin_Date, End_Date) values (39, 'Champion', '2022-02-15', '2024-02-15');
-- insert into Challenges (Levels, Badges, Begin_Date, End_Date) values (40, 'Beginner', '2022-01-01', '2024-08-12');
-- insert into Challenges (Levels, Badges, Begin_Date, End_Date) values (41, 'Intermediate', '2022-10-22', '2024-12-05');
-- insert into Challenges (Levels, Badges, Begin_Date, End_Date) values (42, 'Champion', '2022-06-30', '2024-05-05');
-- insert into Challenges (Levels, Badges, Begin_Date, End_Date) values (43, 'Beginner', '2022-10-22', '2024-02-15');
-- insert into Challenges (Levels, Badges, Begin_Date, End_Date) values (44, 'Intermediate', '2022-12-05', '2024-06-30');
-- insert into Challenges (Levels, Badges, Begin_Date, End_Date) values (45, 'Champion', '2022-01-01', '2024-12-05');

-- insert into Education (Articles, Videos, Figures) values ('The Dangers of Vaping for Teens', 'Vaping Myths Debunked', 'Vaping can cause headaches');
-- insert into Education (Articles, Videos, Figures) values ('How Vaping Affects Lung Health', 'Dangers of Vaping', 'Vaping can cause dry mouth');
-- insert into Education (Articles, Videos, Figures) values ('Vaping vs. Smoking: Which is Worse?', 'Vaping and Heart Health', 'Vaping can cause dizziness');
-- insert into Education (Articles, Videos, Figures) values ('The Rise of Vaping Among Young Adults', 'Vaping and Your Health', 'Vaping can cause dry mouth');
-- insert into Education (Articles, Videos, Figures) values ('Vaping and Heart Health Risks', 'Introduction to Vaping', 'Vaping can cause dry mouth');
-- insert into Education (Articles, Videos, Figures) values ('The Truth About Vaping and Nicotine Addiction', 'Vaping Alternatives', 'Vaping can cause dry mouth');
-- insert into Education (Articles, Videos, Figures) values ('Vaping and its Impact on Mental Health', 'Vaping and Lung Health', 'Vaping may lead to lung irritation');
-- insert into Education (Articles, Videos, Figures) values ('Vaping Regulations and Laws: What You Need to Know', 'Vaping Myths Debunked', 'Vaping can cause dry mouth');
-- insert into Education (Articles, Videos, Figures) values ('The Science Behind Vaping and its Effects on the Body', 'How to Quit Vaping', 'Vaping can cause dizziness');
-- insert into Education (Articles, Videos, Figures) values ('Vaping and Pregnancy: Risks and Precautions', 'Vaping Alternatives', 'Vaping can cause headaches');
-- insert into Education (Articles, Videos, Figures) values ('The Dangers of Vaping for Teens', 'Vaping and Heart Health', 'Vaping can cause dry mouth');
-- insert into Education (Articles, Videos, Figures) values ('How Vaping Affects Lung Health', 'Teen Vaping Prevention', 'Vaping can cause dizziness');
-- insert into Education (Articles, Videos, Figures) values ('Vaping vs. Smoking: Which is Worse?', 'How to Quit Vaping', 'Vaping may lead to increased heart rate');
-- insert into Education (Articles, Videos, Figures) values ('The Rise of Vaping Among Young Adults', 'Dangers of Vaping', 'Vaping can cause dry mouth');
-- insert into Education (Articles, Videos, Figures) values ('Vaping and Heart Health Risks', 'Vaping and Your Health', 'Vaping may lead to lung irritation');
-- insert into Education (Articles, Videos, Figures) values ('The Truth About Vaping and Nicotine Addiction', 'Vaping Alternatives', 'Vaping can cause dizziness');
-- insert into Education (Articles, Videos, Figures) values ('Vaping and its Impact on Mental Health', 'Introduction to Vaping', 'Vaping may lead to increased heart rate');
-- insert into Education (Articles, Videos, Figures) values ('Vaping Regulations and Laws: What You Need to Know', 'Vaping Alternatives', 'Vaping may lead to increased heart rate');
-- insert into Education (Articles, Videos, Figures) values ('The Science Behind Vaping and its Effects on the Body', 'Teen Vaping Prevention', 'Vaping can cause dizziness');
-- insert into Education (Articles, Videos, Figures) values ('Vaping and Pregnancy: Risks and Precautions', 'Dangers of Vaping', 'Vaping can cause dizziness');
-- insert into Education (Articles, Videos, Figures) values ('The Dangers of Vaping for Teens', 'Dangers of Vaping', 'Vaping may lead to lung irritation');
-- insert into Education (Articles, Videos, Figures) values ('How Vaping Affects Lung Health', 'Vaping Addiction Support', 'Vaping can cause headaches');
-- insert into Education (Articles, Videos, Figures) values ('Vaping vs. Smoking: Which is Worse?', 'Introduction to Vaping', 'Vaping may lead to lung irritation');
-- insert into Education (Articles, Videos, Figures) values ('The Rise of Vaping Among Young Adults', 'Teen Vaping Prevention', 'Vaping may lead to lung irritation');
-- insert into Education (Articles, Videos, Figures) values ('Vaping and Heart Health Risks', 'Vaping and Heart Health', 'Vaping may lead to increased heart rate');
-- insert into Education (Articles, Videos, Figures) values ('The Truth About Vaping and Nicotine Addiction', 'Vaping and Heart Health', 'Vaping can cause headaches');
-- insert into Education (Articles, Videos, Figures) values ('Vaping and its Impact on Mental Health', 'Vaping Myths Debunked', 'Vaping may lead to lung irritation');
-- insert into Education (Articles, Videos, Figures) values ('Vaping Regulations and Laws: What You Need to Know', 'Vaping Addiction Support', 'Vaping may lead to lung irritation');
-- insert into Education (Articles, Videos, Figures) values ('The Science Behind Vaping and its Effects on the Body', 'Vaping and Your Health', 'Vaping can cause dizziness');
-- insert into Education (Articles, Videos, Figures) values ('Vaping and Pregnancy: Risks and Precautions', 'How to Quit Vaping', 'Vaping may lead to increased heart rate');
-- insert into Education (Articles, Videos, Figures) values ('The Dangers of Vaping for Teens', 'Dangers of Vaping', 'Vaping may lead to lung irritation');
-- insert into Education (Articles, Videos, Figures) values ('How Vaping Affects Lung Health', 'Teen Vaping Prevention', 'Vaping can cause dizziness');
-- insert into Education (Articles, Videos, Figures) values ('Vaping vs. Smoking: Which is Worse?', 'Dangers of Vaping', 'Vaping may lead to increased heart rate');
-- insert into Education (Articles, Videos, Figures) values ('The Rise of Vaping Among Young Adults', 'Introduction to Vaping', 'Vaping can cause dry mouth');
-- insert into Education (Articles, Videos, Figures) values ('Vaping and Heart Health Risks', 'How to Quit Vaping', 'Vaping can cause dizziness');
-- insert into Education (Articles, Videos, Figures) values ('The Truth About Vaping and Nicotine Addiction', 'How to Quit Vaping', 'Vaping may lead to lung irritation');
-- insert into Education (Articles, Videos, Figures) values ('Vaping and its Impact on Mental Health', 'Dangers of Vaping', 'Vaping can cause dry mouth');
-- insert into Education (Articles, Videos, Figures) values ('Vaping Regulations and Laws: What You Need to Know', 'Vaping Addiction Support', 'Vaping can cause dry mouth');
-- insert into Education (Articles, Videos, Figures) values ('The Science Behind Vaping and its Effects on the Body', 'Vaping and Heart Health', 'Vaping can cause dizziness');
-- insert into Education (Articles, Videos, Figures) values ('Vaping and Pregnancy: Risks and Precautions', 'Vaping and Lung Health', 'Vaping can cause headaches');
-- insert into Education (Articles, Videos, Figures) values ('The Dangers of Vaping for Teens', 'Vaping and Heart Health', 'Vaping can cause headaches');
-- insert into Education (Articles, Videos, Figures) values ('How Vaping Affects Lung Health', 'Teen Vaping Prevention', 'Vaping may lead to increased heart rate');
-- insert into Education (Articles, Videos, Figures) values ('Vaping vs. Smoking: Which is Worse?', 'Vaping and Lung Health', 'Vaping may lead to increased heart rate');
-- insert into Education (Articles, Videos, Figures) values ('The Rise of Vaping Among Young Adults', 'Vaping Alternatives', 'Vaping can cause dry mouth');
-- insert into Education (Articles, Videos, Figures) values ('Vaping and Heart Health Risks', 'How to Quit Vaping', 'Vaping can cause headaches');
-- insert into Education (Articles, Videos, Figures) values ('The Truth About Vaping and Nicotine Addiction', 'Vaping and Lung Health', 'Vaping can cause dizziness');
-- insert into Education (Articles, Videos, Figures) values ('Vaping and its Impact on Mental Health', 'Vaping and Your Health', 'Vaping may lead to lung irritation');
-- insert into Education (Articles, Videos, Figures) values ('Vaping Regulations and Laws: What You Need to Know', 'Vaping Myths Debunked', 'Vaping may lead to lung irritation');
-- insert into Education (Articles, Videos, Figures) values ('The Science Behind Vaping and its Effects on the Body', 'Vaping Alternatives', 'Vaping can cause dizziness');
-- insert into Education (Articles, Videos, Figures) values ('Vaping and Pregnancy: Risks and Precautions', 'Vaping Addiction Support', 'Vaping may lead to lung irritation');
-- insert into Education (Articles, Videos, Figures) values ('The Dangers of Vaping for Teens', 'Dangers of Vaping', 'Vaping may lead to increased heart rate');
-- insert into Education (Articles, Videos, Figures) values ('How Vaping Affects Lung Health', 'Vaping Myths Debunked', 'Vaping can cause dizziness');
-- insert into Education (Articles, Videos, Figures) values ('Vaping vs. Smoking: Which is Worse?', 'Vaping and Your Health', 'Vaping may lead to increased heart rate');
-- insert into Education (Articles, Videos, Figures) values ('The Rise of Vaping Among Young Adults', 'Vaping and Lung Health', 'Vaping may lead to lung irritation');
-- insert into Education (Articles, Videos, Figures) values ('Vaping and Heart Health Risks', 'Vaping Alternatives', 'Vaping may lead to increased heart rate');
-- insert into Education (Articles, Videos, Figures) values ('The Truth About Vaping and Nicotine Addiction', 'Vaping and Lung Health', 'Vaping can cause headaches');
-- insert into Education (Articles, Videos, Figures) values ('Vaping and its Impact on Mental Health', 'Vaping and Heart Health', 'Vaping can cause dry mouth');
-- insert into Education (Articles, Videos, Figures) values ('Vaping Regulations and Laws: What You Need to Know', 'Vaping Addiction Support', 'Vaping may lead to increased heart rate');
-- insert into Education (Articles, Videos, Figures) values ('The Science Behind Vaping and its Effects on the Body', 'Vaping and Your Health', 'Vaping can cause headaches');
-- insert into Education (Articles, Videos, Figures) values ('Vaping and Pregnancy: Risks and Precautions', 'Vaping Alternatives', 'Vaping may lead to lung irritation');
-- insert into Education (Articles, Videos, Figures) values ('The Dangers of Vaping for Teens', 'Introduction to Vaping', 'Vaping can cause dizziness');
-- insert into Education (Articles, Videos, Figures) values ('How Vaping Affects Lung Health', 'How to Quit Vaping', 'Vaping can cause headaches');
-- insert into Education (Articles, Videos, Figures) values ('Vaping vs. Smoking: Which is Worse?', 'Introduction to Vaping', 'Vaping can cause headaches');
-- insert into Education (Articles, Videos, Figures) values ('The Rise of Vaping Among Young Adults', 'Teen Vaping Prevention', 'Vaping may lead to lung irritation');
-- insert into Education (Articles, Videos, Figures) values ('Vaping and Heart Health Risks', 'Vaping Alternatives', 'Vaping may lead to increased heart rate');
-- insert into Education (Articles, Videos, Figures) values ('The Truth About Vaping and Nicotine Addiction', 'Vaping and Your Health', 'Vaping can cause dry mouth');
-- insert into Education (Articles, Videos, Figures) values ('Vaping and its Impact on Mental Health', 'Introduction to Vaping', 'Vaping may lead to lung irritation');
-- insert into Education (Articles, Videos, Figures) values ('Vaping Regulations and Laws: What You Need to Know', 'Vaping Alternatives', 'Vaping may lead to increased heart rate');
-- insert into Education (Articles, Videos, Figures) values ('The Science Behind Vaping and its Effects on the Body', 'Vaping Addiction Support', 'Vaping may lead to increased heart rate');
-- insert into Education (Articles, Videos, Figures) values ('Vaping and Pregnancy: Risks and Precautions', 'Dangers of Vaping', 'Vaping may lead to lung irritation');
-- insert into Education (Articles, Videos, Figures) values ('The Dangers of Vaping for Teens', 'Vaping and Heart Health', 'Vaping can cause dizziness');
-- insert into Education (Articles, Videos, Figures) values ('How Vaping Affects Lung Health', 'Dangers of Vaping', 'Vaping can cause dry mouth');
-- insert into Education (Articles, Videos, Figures) values ('Vaping vs. Smoking: Which is Worse?', 'Vaping Alternatives', 'Vaping may lead to lung irritation');
-- insert into Education (Articles, Videos, Figures) values ('The Rise of Vaping Among Young Adults', 'Vaping Alternatives', 'Vaping can cause headaches');
-- insert into Education (Articles, Videos, Figures) values ('Vaping and Heart Health Risks', 'Vaping and Heart Health', 'Vaping may lead to increased heart rate');
-- insert into Education (Articles, Videos, Figures) values ('The Truth About Vaping and Nicotine Addiction', 'Vaping and Your Health', 'Vaping can cause dizziness');
-- insert into Education (Articles, Videos, Figures) values ('Vaping and its Impact on Mental Health', 'Dangers of Vaping', 'Vaping can cause headaches');
-- insert into Education (Articles, Videos, Figures) values ('Vaping Regulations and Laws: What You Need to Know', 'Dangers of Vaping', 'Vaping can cause dizziness');
-- insert into Education (Articles, Videos, Figures) values ('The Science Behind Vaping and its Effects on the Body', 'Teen Vaping Prevention', 'Vaping may lead to increased heart rate');
-- insert into Education (Articles, Videos, Figures) values ('Vaping and Pregnancy: Risks and Precautions', 'Introduction to Vaping', 'Vaping may lead to increased heart rate');
-- insert into Education (Articles, Videos, Figures) values ('The Dangers of Vaping for Teens', 'Vaping and Your Health', 'Vaping can cause headaches');
-- insert into Education (Articles, Videos, Figures) values ('How Vaping Affects Lung Health', 'Vaping and Heart Health', 'Vaping may lead to lung irritation');
-- insert into Education (Articles, Videos, Figures) values ('Vaping vs. Smoking: Which is Worse?', 'Vaping and Your Health', 'Vaping can cause dizziness');
-- insert into Education (Articles, Videos, Figures) values ('The Rise of Vaping Among Young Adults', 'Introduction to Vaping', 'Vaping may lead to increased heart rate');
-- insert into Education (Articles, Videos, Figures) values ('Vaping and Heart Health Risks', 'Vaping Addiction Support', 'Vaping may lead to lung irritation');
-- insert into Education (Articles, Videos, Figures) values ('The Truth About Vaping and Nicotine Addiction', 'Dangers of Vaping', 'Vaping can cause dizziness');
-- insert into Education (Articles, Videos, Figures) values ('Vaping and its Impact on Mental Health', 'Vaping Addiction Support', 'Vaping can cause headaches');
-- insert into Education (Articles, Videos, Figures) values ('Vaping Regulations and Laws: What You Need to Know', 'Introduction to Vaping', 'Vaping may lead to lung irritation');
-- insert into Education (Articles, Videos, Figures) values ('The Science Behind Vaping and its Effects on the Body', 'Dangers of Vaping', 'Vaping can cause headaches');
-- insert into Education (Articles, Videos, Figures) values ('Vaping and Pregnancy: Risks and Precautions', 'Introduction to Vaping', 'Vaping can cause dizziness');
-- insert into Education (Articles, Videos, Figures) values ('The Dangers of Vaping for Teens', 'How to Quit Vaping', 'Vaping can cause dizziness');
-- insert into Education (Articles, Videos, Figures) values ('How Vaping Affects Lung Health', 'Vaping and Heart Health', 'Vaping may lead to lung irritation');
-- insert into Education (Articles, Videos, Figures) values ('Vaping vs. Smoking: Which is Worse?', 'Introduction to Vaping', 'Vaping can cause dizziness');
-- insert into Education (Articles, Videos, Figures) values ('The Rise of Vaping Among Young Adults', 'Dangers of Vaping', 'Vaping may lead to lung irritation');
-- insert into Education (Articles, Videos, Figures) values ('Vaping and Heart Health Risks', 'Vaping and Heart Health', 'Vaping can cause dizziness');
-- insert into Education (Articles, Videos, Figures) values ('The Truth About Vaping and Nicotine Addiction', 'How to Quit Vaping', 'Vaping can cause dry mouth');
-- insert into Education (Articles, Videos, Figures) values ('Vaping and its Impact on Mental Health', 'Teen Vaping Prevention', 'Vaping may lead to increased heart rate');
-- insert into Education (Articles, Videos, Figures) values ('Vaping Regulations and Laws: What You Need to Know', 'Vaping Myths Debunked', 'Vaping can cause headaches');
-- insert into Education (Articles, Videos, Figures) values ('The Science Behind Vaping and its Effects on the Body', 'Vaping Addiction Support', 'Vaping may lead to lung irritation');
-- insert into Education (Articles, Videos, Figures) values ('Vaping and Pregnancy: Risks and Precautions', 'Vaping Myths Debunked', 'Vaping may lead to lung irritation');
-- insert into Education (Articles, Videos, Figures) values ('The Dangers of Vaping for Teens', 'Vaping and Heart Health', 'Vaping may lead to lung irritation');
-- insert into Education (Articles, Videos, Figures) values ('How Vaping Affects Lung Health', 'Teen Vaping Prevention', 'Vaping may lead to increased heart rate');
-- insert into Education (Articles, Videos, Figures) values ('Vaping vs. Smoking: Which is Worse?', 'Introduction to Vaping', 'Vaping may lead to increased heart rate');
-- insert into Education (Articles, Videos, Figures) values ('The Rise of Vaping Among Young Adults', 'Teen Vaping Prevention', 'Vaping can cause headaches');
-- insert into Education (Articles, Videos, Figures) values ('Vaping and Heart Health Risks', 'Introduction to Vaping', 'Vaping may lead to increased heart rate');
-- insert into Education (Articles, Videos, Figures) values ('The Truth About Vaping and Nicotine Addiction', 'Vaping Myths Debunked', 'Vaping can cause dry mouth');
-- insert into Education (Articles, Videos, Figures) values ('Vaping and its Impact on Mental Health', 'Vaping Alternatives', 'Vaping can cause headaches');
-- insert into Education (Articles, Videos, Figures) values ('Vaping Regulations and Laws: What You Need to Know', 'Teen Vaping Prevention', 'Vaping can cause headaches');
-- insert into Education (Articles, Videos, Figures) values ('The Science Behind Vaping and its Effects on the Body', 'Introduction to Vaping', 'Vaping may lead to increased heart rate');
-- insert into Education (Articles, Videos, Figures) values ('Vaping and Pregnancy: Risks and Precautions', 'Teen Vaping Prevention', 'Vaping can cause headaches');
-- insert into Education (Articles, Videos, Figures) values ('The Dangers of Vaping for Teens', 'Dangers of Vaping', 'Vaping can cause headaches');
-- insert into Education (Articles, Videos, Figures) values ('How Vaping Affects Lung Health', 'How to Quit Vaping', 'Vaping may lead to lung irritation');
-- insert into Education (Articles, Videos, Figures) values ('Vaping vs. Smoking: Which is Worse?', 'Vaping Addiction Support', 'Vaping may lead to increased heart rate');
-- insert into Education (Articles, Videos, Figures) values ('The Rise of Vaping Among Young Adults', 'Vaping Addiction Support', 'Vaping may lead to increased heart rate');
-- insert into Education (Articles, Videos, Figures) values ('Vaping and Heart Health Risks', 'Vaping and Heart Health', 'Vaping may lead to increased heart rate');
-- insert into Education (Articles, Videos, Figures) values ('The Truth About Vaping and Nicotine Addiction', 'Vaping and Heart Health', 'Vaping may lead to lung irritation');
-- insert into Education (Articles, Videos, Figures) values ('Vaping and its Impact on Mental Health', 'Dangers of Vaping', 'Vaping may lead to lung irritation');
-- insert into Education (Articles, Videos, Figures) values ('Vaping Regulations and Laws: What You Need to Know', 'Vaping and Lung Health', 'Vaping can cause dry mouth');
-- insert into Education (Articles, Videos, Figures) values ('The Science Behind Vaping and its Effects on the Body', 'How to Quit Vaping', 'Vaping can cause headaches');
-- insert into Education (Articles, Videos, Figures) values ('Vaping and Pregnancy: Risks and Precautions', 'Dangers of Vaping', 'Vaping may lead to increased heart rate');
-- insert into Education (Articles, Videos, Figures) values ('The Dangers of Vaping for Teens', 'Introduction to Vaping', 'Vaping may lead to lung irritation');
-- insert into Education (Articles, Videos, Figures) values ('How Vaping Affects Lung Health', 'Vaping Myths Debunked', 'Vaping can cause headaches');
-- insert into Education (Articles, Videos, Figures) values ('Vaping vs. Smoking: Which is Worse?', 'Teen Vaping Prevention', 'Vaping may lead to lung irritation');
-- insert into Education (Articles, Videos, Figures) values ('The Rise of Vaping Among Young Adults', 'Dangers of Vaping', 'Vaping may lead to increased heart rate');
-- insert into Education (Articles, Videos, Figures) values ('Vaping and Heart Health Risks', 'Introduction to Vaping', 'Vaping may lead to lung irritation');
-- insert into Education (Articles, Videos, Figures) values ('The Truth About Vaping and Nicotine Addiction', 'Dangers of Vaping', 'Vaping can cause dry mouth');
-- insert into Education (Articles, Videos, Figures) values ('Vaping and its Impact on Mental Health', 'Vaping and Lung Health', 'Vaping can cause dizziness');
-- insert into Education (Articles, Videos, Figures) values ('Vaping Regulations and Laws: What You Need to Know', 'Teen Vaping Prevention', 'Vaping can cause dry mouth');
-- insert into Education (Articles, Videos, Figures) values ('The Science Behind Vaping and its Effects on the Body', 'Vaping and Heart Health', 'Vaping can cause dry mouth');
-- insert into Education (Articles, Videos, Figures) values ('Vaping and Pregnancy: Risks and Precautions', 'Teen Vaping Prevention', 'Vaping can cause dizziness');
-- insert into Education (Articles, Videos, Figures) values ('The Dangers of Vaping for Teens', 'How to Quit Vaping', 'Vaping can cause headaches');
-- insert into Education (Articles, Videos, Figures) values ('How Vaping Affects Lung Health', 'Dangers of Vaping', 'Vaping may lead to lung irritation');
-- insert into Education (Articles, Videos, Figures) values ('Vaping vs. Smoking: Which is Worse?', 'How to Quit Vaping', 'Vaping may lead to lung irritation');
-- insert into Education (Articles, Videos, Figures) values ('The Rise of Vaping Among Young Adults', 'Introduction to Vaping', 'Vaping can cause dizziness');
-- insert into Education (Articles, Videos, Figures) values ('Vaping and Heart Health Risks', 'Dangers of Vaping', 'Vaping may lead to increased heart rate');
-- insert into Education (Articles, Videos, Figures) values ('The Truth About Vaping and Nicotine Addiction', 'Vaping and Heart Health', 'Vaping can cause headaches');
-- insert into Education (Articles, Videos, Figures) values ('Vaping and its Impact on Mental Health', 'Vaping Alternatives', 'Vaping can cause dizziness');
-- insert into Education (Articles, Videos, Figures) values ('Vaping Regulations and Laws: What You Need to Know', 'Vaping and Lung Health', 'Vaping may lead to lung irritation');
-- insert into Education (Articles, Videos, Figures) values ('The Science Behind Vaping and its Effects on the Body', 'Vaping Myths Debunked', 'Vaping can cause dizziness');
-- insert into Education (Articles, Videos, Figures) values ('Vaping and Pregnancy: Risks and Precautions', 'Introduction to Vaping', 'Vaping can cause dizziness');
-- insert into Education (Articles, Videos, Figures) values ('The Dangers of Vaping for Teens', 'Vaping Addiction Support', 'Vaping can cause dizziness');
-- insert into Education (Articles, Videos, Figures) values ('How Vaping Affects Lung Health', 'Vaping and Heart Health', 'Vaping can cause dry mouth');
-- insert into Education (Articles, Videos, Figures) values ('Vaping vs. Smoking: Which is Worse?', 'Vaping and Your Health', 'Vaping can cause headaches');
-- insert into Education (Articles, Videos, Figures) values ('The Rise of Vaping Among Young Adults', 'Vaping and Lung Health', 'Vaping can cause dizziness');
-- insert into Education (Articles, Videos, Figures) values ('Vaping and Heart Health Risks', 'Vaping Alternatives', 'Vaping may lead to lung irritation');
-- insert into Education (Articles, Videos, Figures) values ('The Truth About Vaping and Nicotine Addiction', 'How to Quit Vaping', 'Vaping can cause headaches');
-- insert into Education (Articles, Videos, Figures) values ('Vaping and its Impact on Mental Health', 'Vaping and Heart Health', 'Vaping may lead to lung irritation');
-- insert into Education (Articles, Videos, Figures) values ('Vaping Regulations and Laws: What You Need to Know', 'Teen Vaping Prevention', 'Vaping can cause dizziness');
-- insert into Education (Articles, Videos, Figures) values ('The Science Behind Vaping and its Effects on the Body', 'Vaping and Lung Health', 'Vaping can cause dry mouth');
-- insert into Education (Articles, Videos, Figures) values ('Vaping and Pregnancy: Risks and Precautions', 'Vaping and Your Health', 'Vaping can cause dry mouth');
-- insert into Education (Articles, Videos, Figures) values ('The Dangers of Vaping for Teens', 'Introduction to Vaping', 'Vaping can cause headaches');
-- insert into Education (Articles, Videos, Figures) values ('How Vaping Affects Lung Health', 'Vaping Myths Debunked', 'Vaping can cause headaches');
-- insert into Education (Articles, Videos, Figures) values ('Vaping vs. Smoking: Which is Worse?', 'Vaping Alternatives', 'Vaping may lead to increased heart rate');
-- insert into Education (Articles, Videos, Figures) values ('The Rise of Vaping Among Young Adults', 'Vaping Myths Debunked', 'Vaping can cause dizziness');
-- insert into Education (Articles, Videos, Figures) values ('Vaping and Heart Health Risks', 'Vaping and Lung Health', 'Vaping can cause dry mouth');
-- insert into Education (Articles, Videos, Figures) values ('The Truth About Vaping and Nicotine Addiction', 'Vaping Myths Debunked', 'Vaping may lead to lung irritation');
-- insert into Education (Articles, Videos, Figures) values ('Vaping and its Impact on Mental Health', 'Vaping and Your Health', 'Vaping can cause headaches');
-- insert into Education (Articles, Videos, Figures) values ('Vaping Regulations and Laws: What You Need to Know', 'Vaping and Your Health', 'Vaping can cause headaches');
-- insert into Education (Articles, Videos, Figures) values ('The Science Behind Vaping and its Effects on the Body', 'Vaping Myths Debunked', 'Vaping can cause headaches');
-- insert into Education (Articles, Videos, Figures) values ('Vaping and Pregnancy: Risks and Precautions', 'Vaping Myths Debunked', 'Vaping can cause headaches');
-- insert into Education (Articles, Videos, Figures) values ('The Dangers of Vaping for Teens', 'Vaping and Your Health', 'Vaping can cause dizziness');
-- insert into Education (Articles, Videos, Figures) values ('How Vaping Affects Lung Health', 'Vaping Alternatives', 'Vaping may lead to lung irritation');
-- insert into Education (Articles, Videos, Figures) values ('Vaping vs. Smoking: Which is Worse?', 'Dangers of Vaping', 'Vaping may lead to lung irritation');
-- insert into Education (Articles, Videos, Figures) values ('The Rise of Vaping Among Young Adults', 'Vaping and Lung Health', 'Vaping may lead to increased heart rate');
-- insert into Education (Articles, Videos, Figures) values ('Vaping and Heart Health Risks', 'Vaping and Your Health', 'Vaping can cause headaches');
-- insert into Education (Articles, Videos, Figures) values ('The Truth About Vaping and Nicotine Addiction', 'Vaping Alternatives', 'Vaping can cause dry mouth');
-- insert into Education (Articles, Videos, Figures) values ('Vaping and its Impact on Mental Health', 'Introduction to Vaping', 'Vaping can cause headaches');
-- insert into Education (Articles, Videos, Figures) values ('Vaping Regulations and Laws: What You Need to Know', 'Vaping Addiction Support', 'Vaping can cause headaches');
-- insert into Education (Articles, Videos, Figures) values ('The Science Behind Vaping and its Effects on the Body', 'Teen Vaping Prevention', 'Vaping can cause dry mouth');
-- insert into Education (Articles, Videos, Figures) values ('Vaping and Pregnancy: Risks and Precautions', 'Vaping and Lung Health', 'Vaping can cause dry mouth');
-- insert into Education (Articles, Videos, Figures) values ('The Dangers of Vaping for Teens', 'Vaping Alternatives', 'Vaping may lead to increased heart rate');
-- insert into Education (Articles, Videos, Figures) values ('How Vaping Affects Lung Health', 'Vaping and Heart Health', 'Vaping can cause headaches');
-- insert into Education (Articles, Videos, Figures) values ('Vaping vs. Smoking: Which is Worse?', 'Vaping and Lung Health', 'Vaping can cause dry mouth');
-- insert into Education (Articles, Videos, Figures) values ('The Rise of Vaping Among Young Adults', 'Vaping and Heart Health', 'Vaping can cause dizziness');
-- insert into Education (Articles, Videos, Figures) values ('Vaping and Heart Health Risks', 'Vaping Alternatives', 'Vaping can cause dizziness');
-- insert into Education (Articles, Videos, Figures) values ('The Truth About Vaping and Nicotine Addiction', 'Introduction to Vaping', 'Vaping may lead to increased heart rate');
-- insert into Education (Articles, Videos, Figures) values ('Vaping and its Impact on Mental Health', 'Vaping Alternatives', 'Vaping can cause headaches');
-- insert into Education (Articles, Videos, Figures) values ('Vaping Regulations and Laws: What You Need to Know', 'Vaping and Heart Health', 'Vaping can cause dizziness');
-- insert into Education (Articles, Videos, Figures) values ('The Science Behind Vaping and its Effects on the Body', 'Vaping Addiction Support', 'Vaping can cause dizziness');
-- insert into Education (Articles, Videos, Figures) values ('Vaping and Pregnancy: Risks and Precautions', 'How to Quit Vaping', 'Vaping can cause headaches');
-- insert into Education (Articles, Videos, Figures) values ('The Dangers of Vaping for Teens', 'Vaping Myths Debunked', 'Vaping can cause dizziness');
-- insert into Education (Articles, Videos, Figures) values ('How Vaping Affects Lung Health', 'Vaping Addiction Support', 'Vaping can cause dizziness');
-- insert into Education (Articles, Videos, Figures) values ('Vaping vs. Smoking: Which is Worse?', 'Vaping Addiction Support', 'Vaping may lead to increased heart rate');
-- insert into Education (Articles, Videos, Figures) values ('The Rise of Vaping Among Young Adults', 'Vaping Myths Debunked', 'Vaping may lead to increased heart rate');
-- insert into Education (Articles, Videos, Figures) values ('Vaping and Heart Health Risks', 'Vaping and Lung Health', 'Vaping may lead to lung irritation');
-- insert into Education (Articles, Videos, Figures) values ('The Truth About Vaping and Nicotine Addiction', 'Introduction to Vaping', 'Vaping can cause headaches');
-- insert into Education (Articles, Videos, Figures) values ('Vaping and its Impact on Mental Health', 'Vaping Alternatives', 'Vaping may lead to increased heart rate');
-- insert into Education (Articles, Videos, Figures) values ('Vaping Regulations and Laws: What You Need to Know', 'Introduction to Vaping', 'Vaping can cause dizziness');
-- insert into Education (Articles, Videos, Figures) values ('The Science Behind Vaping and its Effects on the Body', 'Vaping Myths Debunked', 'Vaping can cause headaches');
-- insert into Education (Articles, Videos, Figures) values ('Vaping and Pregnancy: Risks and Precautions', 'Vaping Addiction Support', 'Vaping can cause dry mouth');
-- insert into Education (Articles, Videos, Figures) values ('The Dangers of Vaping for Teens', 'Introduction to Vaping', 'Vaping may lead to lung irritation');
-- insert into Education (Articles, Videos, Figures) values ('How Vaping Affects Lung Health', 'Introduction to Vaping', 'Vaping can cause dry mouth');
-- insert into Education (Articles, Videos, Figures) values ('Vaping vs. Smoking: Which is Worse?', 'Teen Vaping Prevention', 'Vaping may lead to increased heart rate');
-- insert into Education (Articles, Videos, Figures) values ('The Rise of Vaping Among Young Adults', 'How to Quit Vaping', 'Vaping may lead to lung irritation');
-- insert into Education (Articles, Videos, Figures) values ('Vaping and Heart Health Risks', 'How to Quit Vaping', 'Vaping can cause headaches');
-- insert into Education (Articles, Videos, Figures) values ('The Truth About Vaping and Nicotine Addiction', 'Vaping and Heart Health', 'Vaping can cause dry mouth');
-- insert into Education (Articles, Videos, Figures) values ('Vaping and its Impact on Mental Health', 'Vaping and Heart Health', 'Vaping may lead to increased heart rate');
-- insert into Education (Articles, Videos, Figures) values ('Vaping Regulations and Laws: What You Need to Know', 'Vaping and Lung Health', 'Vaping may lead to increased heart rate');
-- insert into Education (Articles, Videos, Figures) values ('The Science Behind Vaping and its Effects on the Body', 'Introduction to Vaping', 'Vaping may lead to increased heart rate');
-- insert into Education (Articles, Videos, Figures) values ('Vaping and Pregnancy: Risks and Precautions', 'Vaping Myths Debunked', 'Vaping may lead to lung irritation');

-- insert into Savings (User_ID, Amount, Curr_Date) values (1, 946.47, '2022-05-20');
-- insert into Savings (User_ID, Amount, Curr_Date) values (2, 1157.64, '2022-09-30');
-- insert into Savings (User_ID, Amount, Curr_Date) values (3, 99.95, '2022-05-20');
-- insert into Savings (User_ID, Amount, Curr_Date) values (4, 2083.74, '2022-01-15');
-- insert into Savings (User_ID, Amount, Curr_Date) values (5, 456.43, '2022-07-12');
-- insert into Savings (User_ID, Amount, Curr_Date) values (6, 3633.11, '2022-01-15');
-- insert into Savings (User_ID, Amount, Curr_Date) values (7, 2843.04, '2022-09-30');
-- insert into Savings (User_ID, Amount, Curr_Date) values (8, 4577.02, '2022-03-08');
-- insert into Savings (User_ID, Amount, Curr_Date) values (9, 2420.49, '2022-03-08');
-- insert into Savings (User_ID, Amount, Curr_Date) values (10, 162.53, '2022-07-12');
-- insert into Savings (User_ID, Amount, Curr_Date) values (11, 4400.12, '2022-01-15');
-- insert into Savings (User_ID, Amount, Curr_Date) values (12, 3820.14, '2022-01-15');
-- insert into Savings (User_ID, Amount, Curr_Date) values (13, 1442.83, '2022-05-20');
-- insert into Savings (User_ID, Amount, Curr_Date) values (14, 1826.19, '2022-05-20');
-- insert into Savings (User_ID, Amount, Curr_Date) values (15, 4640.91, '2022-09-30');
-- insert into Savings (User_ID, Amount, Curr_Date) values (16, 3574.91, '2022-05-20');
-- insert into Savings (User_ID, Amount, Curr_Date) values (17, 3153.45, '2022-03-08');
-- insert into Savings (User_ID, Amount, Curr_Date) values (18, 4105.61, '2022-03-08');
-- insert into Savings (User_ID, Amount, Curr_Date) values (19, 2075.99, '2022-07-12');
-- insert into Savings (User_ID, Amount, Curr_Date) values (20, 2062.76, '2022-09-30');
-- insert into Savings (User_ID, Amount, Curr_Date) values (21, 2270.98, '2022-03-08');
-- insert into Savings (User_ID, Amount, Curr_Date) values (22, 1196.06, '2022-05-20');
-- insert into Savings (User_ID, Amount, Curr_Date) values (23, 803.06, '2022-01-15');
-- insert into Savings (User_ID, Amount, Curr_Date) values (24, 271.72, '2022-01-15');
-- insert into Savings (User_ID, Amount, Curr_Date) values (25, 3101.04, '2022-01-15');
-- insert into Savings (User_ID, Amount, Curr_Date) values (26, 2726.66, '2022-03-08');
-- insert into Savings (User_ID, Amount, Curr_Date) values (27, 1982.43, '2022-03-08');
-- insert into Savings (User_ID, Amount, Curr_Date) values (28, 278.47, '2022-01-15');
-- insert into Savings (User_ID, Amount, Curr_Date) values (29, 541.26, '2022-09-30');
-- insert into Savings (User_ID, Amount, Curr_Date) values (30, 1753.16, '2022-05-20');
-- insert into Savings (User_ID, Amount, Curr_Date) values (31, 635.77, '2022-05-20');
-- insert into Savings (User_ID, Amount, Curr_Date) values (32, 4408.65, '2022-09-30');
-- insert into Savings (User_ID, Amount, Curr_Date) values (33, 1272.83, '2022-05-20');
-- insert into Savings (User_ID, Amount, Curr_Date) values (34, 2304.17, '2022-03-08');
-- insert into Savings (User_ID, Amount, Curr_Date) values (35, 4310.85, '2022-09-30');
-- insert into Savings (User_ID, Amount, Curr_Date) values (36, 4460.42, '2022-05-20');
-- insert into Savings (User_ID, Amount, Curr_Date) values (37, 2499.57, '2022-01-15');
-- insert into Savings (User_ID, Amount, Curr_Date) values (38, 3081.91, '2022-05-20');
-- insert into Savings (User_ID, Amount, Curr_Date) values (39, 4207.73, '2022-07-12');
-- insert into Savings (User_ID, Amount, Curr_Date) values (40, 1288.65, '2022-05-20');
-- insert into Savings (User_ID, Amount, Curr_Date) values (41, 3141.44, '2022-09-30');
-- insert into Savings (User_ID, Amount, Curr_Date) values (42, 1845.8, '2022-01-15');
-- insert into Savings (User_ID, Amount, Curr_Date) values (43, 3397.75, '2022-01-15');
-- insert into Savings (User_ID, Amount, Curr_Date) values (44, 2871.11, '2022-07-12');
-- insert into Savings (User_ID, Amount, Curr_Date) values (45, 3343.24, '2022-01-15');

-- insert into SocialSupport (User_ID, Content, Interactions, Posts) values (1, 'I can breathe easier now that I''ve quit smoking.', 'Shares', 'Ava''s Post');
-- insert into SocialSupport (User_ID, Content, Interactions, Posts) values (2, 'I have more energy now that I''ve stopped smoking.', 'Likes', 'Ethan''s Post');
-- insert into SocialSupport (User_ID, Content, Interactions, Posts) values (3, 'I''m setting a good example for my friends and family by quitting smoking.', 'Comments', 'Michael''s Post');
-- insert into SocialSupport (User_ID, Content, Interactions, Posts) values (4, 'I can breathe easier now that I''ve quit smoking.', 'Likes', 'Ava''s Post');
-- insert into SocialSupport (User_ID, Content, Interactions, Posts) values (5, 'I''m setting a good example for my friends and family by quitting smoking.', 'Shares', 'Ethan''s Post');
-- insert into SocialSupport (User_ID, Content, Interactions, Posts) values (6, 'I''m proud of myself for breaking the habit and quitting smoking.', 'Shares', 'Emily''s Post');
-- insert into SocialSupport (User_ID, Content, Interactions, Posts) values (7, 'I no longer have that lingering smell of smoke on my clothes and hair.', 'Likes', 'Emily''s Post');
-- insert into SocialSupport (User_ID, Content, Interactions, Posts) values (8, 'I can breathe easier now that I''ve quit smoking.', 'Likes', 'Olivia''s Post');
-- insert into SocialSupport (User_ID, Content, Interactions, Posts) values (9, 'I''m setting a good example for my friends and family by quitting smoking.', 'Comments', 'Ethan''s Post');
-- insert into SocialSupport (User_ID, Content, Interactions, Posts) values (10, 'I feel empowered knowing that I can overcome my addiction to smoking.', 'Likes', 'John''s Post');
-- insert into SocialSupport (User_ID, Content, Interactions, Posts) values (11, 'I''m setting a good example for my friends and family by quitting smoking.', 'Likes', 'Liam''s Post');
-- insert into SocialSupport (User_ID, Content, Interactions, Posts) values (12, 'I''m proud of myself for breaking the habit and quitting smoking.', 'Likes', 'Emily''s Post');
-- insert into SocialSupport (User_ID, Content, Interactions, Posts) values (13, 'I''ve saved so much money by not buying cigarettes anymore.', 'Likes', 'Olivia''s Post');
-- insert into SocialSupport (User_ID, Content, Interactions, Posts) values (14, 'I feel empowered knowing that I can overcome my addiction to smoking.', 'Shares', 'Sarah''s Post');
-- insert into SocialSupport (User_ID, Content, Interactions, Posts) values (15, 'My sense of taste and smell has improved since quitting smoking.', 'Comments', 'John''s Post');
-- insert into SocialSupport (User_ID, Content, Interactions, Posts) values (16, 'My sense of taste and smell has improved since quitting smoking.', 'Shares', 'Emily''s Post');
-- insert into SocialSupport (User_ID, Content, Interactions, Posts) values (17, 'My sense of taste and smell has improved since quitting smoking.', 'Comments', 'Olivia''s Post');
-- insert into SocialSupport (User_ID, Content, Interactions, Posts) values (18, 'I no longer have that lingering smell of smoke on my clothes and hair.', 'Likes', 'Sophia''s Post');
-- insert into SocialSupport (User_ID, Content, Interactions, Posts) values (19, 'I have more energy now that I''ve stopped smoking.', 'Likes', 'Alex''s Post');
-- insert into SocialSupport (User_ID, Content, Interactions, Posts) values (20, 'My sense of taste and smell has improved since quitting smoking.', 'Likes', 'Ethan''s Post');
-- insert into SocialSupport (User_ID, Content, Interactions, Posts) values (21, 'I feel empowered knowing that I can overcome my addiction to smoking.', 'Comments', 'Ava''s Post');
-- insert into SocialSupport (User_ID, Content, Interactions, Posts) values (22, 'I feel empowered knowing that I can overcome my addiction to smoking.', 'Comments', 'Emily''s Post');
-- insert into SocialSupport (User_ID, Content, Interactions, Posts) values (23, 'I''m setting a good example for my friends and family by quitting smoking.', 'Comments', 'John''s Post');
-- insert into SocialSupport (User_ID, Content, Interactions, Posts) values (24, 'I can breathe easier now that I''ve quit smoking.', 'Comments', 'John''s Post');
-- insert into SocialSupport (User_ID, Content, Interactions, Posts) values (25, 'I feel more in control of my life now that I''ve quit smoking.', 'Comments', 'John''s Post');
-- insert into SocialSupport (User_ID, Content, Interactions, Posts) values (26, 'I feel more in control of my life now that I''ve quit smoking.', 'Comments', 'Emily''s Post');
-- insert into SocialSupport (User_ID, Content, Interactions, Posts) values (27, 'I feel more in control of my life now that I''ve quit smoking.', 'Shares', 'Ethan''s Post');
-- insert into SocialSupport (User_ID, Content, Interactions, Posts) values (28, 'I''ve saved so much money by not buying cigarettes anymore.', 'Shares', 'John''s Post');
-- insert into SocialSupport (User_ID, Content, Interactions, Posts) values (29, 'I have more energy now that I''ve stopped smoking.', 'Shares', 'Emily''s Post');
-- insert into SocialSupport (User_ID, Content, Interactions, Posts) values (30, 'I feel so much healthier since quitting smoking!', 'Shares', 'Sophia''s Post');
-- insert into SocialSupport (User_ID, Content, Interactions, Posts) values (31, 'My sense of taste and smell has improved since quitting smoking.', 'Shares', 'Michael''s Post');
-- insert into SocialSupport (User_ID, Content, Interactions, Posts) values (32, 'I''m proud of myself for breaking the habit and quitting smoking.', 'Comments', 'Sarah''s Post');
-- insert into SocialSupport (User_ID, Content, Interactions, Posts) values (33, 'I no longer have that lingering smell of smoke on my clothes and hair.', 'Comments', 'Ava''s Post');
-- insert into SocialSupport (User_ID, Content, Interactions, Posts) values (34, 'I feel more in control of my life now that I''ve quit smoking.', 'Shares', 'Ava''s Post');
-- insert into SocialSupport (User_ID, Content, Interactions, Posts) values (35, 'I''m setting a good example for my friends and family by quitting smoking.', 'Shares', 'Emily''s Post');
-- insert into SocialSupport (User_ID, Content, Interactions, Posts) values (36, 'I feel so much healthier since quitting smoking!', 'Likes', 'Sophia''s Post');
-- insert into SocialSupport (User_ID, Content, Interactions, Posts) values (37, 'I feel so much healthier since quitting smoking!', 'Comments', 'Michael''s Post');
-- insert into SocialSupport (User_ID, Content, Interactions, Posts) values (38, 'I feel more in control of my life now that I''ve quit smoking.', 'Shares', 'Alex''s Post');
-- insert into SocialSupport (User_ID, Content, Interactions, Posts) values (39, 'I''ve saved so much money by not buying cigarettes anymore.', 'Shares', 'Ava''s Post');
-- insert into SocialSupport (User_ID, Content, Interactions, Posts) values (40, 'I can breathe easier now that I''ve quit smoking.', 'Likes', 'Michael''s Post');
-- insert into SocialSupport (User_ID, Content, Interactions, Posts) values (41, 'I have more energy now that I''ve stopped smoking.', 'Comments', 'Sophia''s Post');
-- insert into SocialSupport (User_ID, Content, Interactions, Posts) values (42, 'I feel so much healthier since quitting smoking!', 'Comments', 'Liam''s Post');
-- insert into SocialSupport (User_ID, Content, Interactions, Posts) values (43, 'I''m proud of myself for breaking the habit and quitting smoking.', 'Shares', 'Emily''s Post');
-- insert into SocialSupport (User_ID, Content, Interactions, Posts) values (44, 'My sense of taste and smell has improved since quitting smoking.', 'Likes', 'Ava''s Post');
-- insert into SocialSupport (User_ID, Content, Interactions, Posts) values (45, 'I feel so much healthier since quitting smoking!', 'Likes', 'Emily''s Post');

-- insert into Posts (Support_ID, User_ID, Interactions, Posts, Curr_Date) values (1, 1, 'Shares', 'John''s Post', '2022-01-15');
-- insert into Posts (Support_ID, User_ID, Interactions, Posts, Curr_Date) values (2, 2, 'Comments', 'Sophia''s Post', '2022-05-20');
-- insert into Posts (Support_ID, User_ID, Interactions, Posts, Curr_Date) values (3, 3, 'Shares', 'Olivia''s Post', '2022-05-20');
-- insert into Posts (Support_ID, User_ID, Interactions, Posts, Curr_Date) values (4, 4, 'Shares', 'Sarah''s Post', '2022-07-12');
-- insert into Posts (Support_ID, User_ID, Interactions, Posts, Curr_Date) values (5, 5, 'Comments', 'Sophia''s Post', '2022-01-15');
-- insert into Posts (Support_ID, User_ID, Interactions, Posts, Curr_Date) values (6, 6, 'Comments', 'Alex''s Post', '2022-03-08');
-- insert into Posts (Support_ID, User_ID, Interactions, Posts, Curr_Date) values (7, 7, 'Comments', 'Emily''s Post', '2022-09-30');
-- insert into Posts (Support_ID, User_ID, Interactions, Posts, Curr_Date) values (8, 8, 'Comments', 'Michael''s Post', '2022-03-08');
-- insert into Posts (Support_ID, User_ID, Interactions, Posts, Curr_Date) values (9, 9, 'Comments', 'John''s Post', '2022-09-30');
-- insert into Posts (Support_ID, User_ID, Interactions, Posts, Curr_Date) values (10, 10, 'Comments', 'Michael''s Post', '2022-05-20');
-- insert into Posts (Support_ID, User_ID, Interactions, Posts, Curr_Date) values (11, 11, 'Comments', 'Emily''s Post', '2022-03-08');
-- insert into Posts (Support_ID, User_ID, Interactions, Posts, Curr_Date) values (12, 12, 'Likes', 'Alex''s Post', '2022-09-30');
-- insert into Posts (Support_ID, User_ID, Interactions, Posts, Curr_Date) values (13, 13, 'Comments', 'Liam''s Post', '2022-09-30');
-- insert into Posts (Support_ID, User_ID, Interactions, Posts, Curr_Date) values (14, 14, 'Comments', 'Michael''s Post', '2022-09-30');
-- insert into Posts (Support_ID, User_ID, Interactions, Posts, Curr_Date) values (15, 15, 'Comments', 'Sophia''s Post', '2022-07-12');
-- insert into Posts (Support_ID, User_ID, Interactions, Posts, Curr_Date) values (16, 16, 'Comments', 'Sarah''s Post', '2022-07-12');
-- insert into Posts (Support_ID, User_ID, Interactions, Posts, Curr_Date) values (17, 17, 'Likes', 'John''s Post', '2022-03-08');
-- insert into Posts (Support_ID, User_ID, Interactions, Posts, Curr_Date) values (18, 18, 'Likes', 'Emily''s Post', '2022-05-20');
-- insert into Posts (Support_ID, User_ID, Interactions, Posts, Curr_Date) values (19, 19, 'Shares', 'Emily''s Post', '2022-01-15');
-- insert into Posts (Support_ID, User_ID, Interactions, Posts, Curr_Date) values (20, 20, 'Shares', 'Olivia''s Post', '2022-09-30');
-- insert into Posts (Support_ID, User_ID, Interactions, Posts, Curr_Date) values (21, 21, 'Comments', 'Emily''s Post', '2022-07-12');
-- insert into Posts (Support_ID, User_ID, Interactions, Posts, Curr_Date) values (22, 22, 'Comments', 'Ava''s Post', '2022-09-30');
-- insert into Posts (Support_ID, User_ID, Interactions, Posts, Curr_Date) values (23, 23, 'Likes', 'Sarah''s Post', '2022-09-30');
-- insert into Posts (Support_ID, User_ID, Interactions, Posts, Curr_Date) values (24, 24, 'Likes', 'Emily''s Post', '2022-07-12');
-- insert into Posts (Support_ID, User_ID, Interactions, Posts, Curr_Date) values (25, 25, 'Shares', 'Sarah''s Post', '2022-03-08');
-- insert into Posts (Support_ID, User_ID, Interactions, Posts, Curr_Date) values (26, 26, 'Likes', 'Sophia''s Post', '2022-01-15');
-- insert into Posts (Support_ID, User_ID, Interactions, Posts, Curr_Date) values (27, 27, 'Likes', 'Ethan''s Post', '2022-01-15');
-- insert into Posts (Support_ID, User_ID, Interactions, Posts, Curr_Date) values (28, 28, 'Likes', 'Liam''s Post', '2022-09-30');
-- insert into Posts (Support_ID, User_ID, Interactions, Posts, Curr_Date) values (29, 29, 'Shares', 'Ethan''s Post', '2022-01-15');
-- insert into Posts (Support_ID, User_ID, Interactions, Posts, Curr_Date) values (30, 30, 'Likes', 'Liam''s Post', '2022-01-15');
-- insert into Posts (Support_ID, User_ID, Interactions, Posts, Curr_Date) values (31, 31, 'Comments', 'Emily''s Post', '2022-09-30');
-- insert into Posts (Support_ID, User_ID, Interactions, Posts, Curr_Date) values (32, 32, 'Likes', 'Ethan''s Post', '2022-07-12');
-- insert into Posts (Support_ID, User_ID, Interactions, Posts, Curr_Date) values (33, 33, 'Comments', 'Olivia''s Post', '2022-05-20');
-- insert into Posts (Support_ID, User_ID, Interactions, Posts, Curr_Date) values (34, 34, 'Likes', 'Michael''s Post', '2022-05-20');
-- insert into Posts (Support_ID, User_ID, Interactions, Posts, Curr_Date) values (35, 35, 'Likes', 'John''s Post', '2022-01-15');
-- insert into Posts (Support_ID, User_ID, Interactions, Posts, Curr_Date) values (36, 36, 'Shares', 'Michael''s Post', '2022-03-08');
-- insert into Posts (Support_ID, User_ID, Interactions, Posts, Curr_Date) values (37, 37, 'Comments', 'Michael''s Post', '2022-07-12');
-- insert into Posts (Support_ID, User_ID, Interactions, Posts, Curr_Date) values (38, 38, 'Likes', 'Olivia''s Post', '2022-05-20');
-- insert into Posts (Support_ID, User_ID, Interactions, Posts, Curr_Date) values (39, 39, 'Shares', 'Ethan''s Post', '2022-09-30');
-- insert into Posts (Support_ID, User_ID, Interactions, Posts, Curr_Date) values (40, 40, 'Likes', 'Alex''s Post', '2022-01-15');
-- insert into Posts (Support_ID, User_ID, Interactions, Posts, Curr_Date) values (41, 41, 'Likes', 'Alex''s Post', '2022-07-12');
-- insert into Posts (Support_ID, User_ID, Interactions, Posts, Curr_Date) values (42, 42, 'Shares', 'Michael''s Post', '2022-01-15');
-- insert into Posts (Support_ID, User_ID, Interactions, Posts, Curr_Date) values (43, 43, 'Comments', 'Sophia''s Post', '2022-03-08');
-- insert into Posts (Support_ID, User_ID, Interactions, Posts, Curr_Date) values (44, 44, 'Shares', 'Olivia''s Post', '2022-09-30');
-- insert into Posts (Support_ID, User_ID, Interactions, Posts, Curr_Date) values (45, 45, 'Shares', 'Ethan''s Post', '2022-09-30');

-- insert into Comments (Post_ID, User_ID, Content, Curr_Date) values (1, 1, 'I''m proud of myself for making the decision to quit vaping.', '2022-08-12');
-- insert into Comments (Post_ID, User_ID, Content, Curr_Date) values (2, 2, 'I''m setting a positive example for others by quitting vaping.', '2022-01-15');
-- insert into Comments (Post_ID, User_ID, Content, Curr_Date) values (3, 3, 'I feel free from the addiction to vaping.', '2022-02-28');
-- insert into Comments (Post_ID, User_ID, Content, Curr_Date) values (4, 4, 'I feel free from the addiction to vaping.', '2022-02-28');
-- insert into Comments (Post_ID, User_ID, Content, Curr_Date) values (5, 5, 'I''m setting a positive example for others by quitting vaping.', '2022-10-07');
-- insert into Comments (Post_ID, User_ID, Content, Curr_Date) values (6, 6, 'I can breathe easier now that I''ve quit vaping.', '2022-10-07');
-- insert into Comments (Post_ID, User_ID, Content, Curr_Date) values (7, 7, 'I''ve saved so much money by quitting vaping.', '2022-01-15');
-- insert into Comments (Post_ID, User_ID, Content, Curr_Date) values (8, 8, 'I no longer have to worry about the negative health effects of vaping.', '2022-07-30');
-- insert into Comments (Post_ID, User_ID, Content, Curr_Date) values (9, 9, 'I''m proud of myself for making the decision to quit vaping.', '2022-05-05');
-- insert into Comments (Post_ID, User_ID, Content, Curr_Date) values (10, 10, 'I can breathe easier now that I''ve quit vaping.', '2022-07-30');
-- insert into Comments (Post_ID, User_ID, Content, Curr_Date) values (11, 11, 'I feel so much healthier since quitting vaping!', '2022-07-30');
-- insert into Comments (Post_ID, User_ID, Content, Curr_Date) values (12, 12, 'I''m setting a positive example for others by quitting vaping.', '2022-10-07');
-- insert into Comments (Post_ID, User_ID, Content, Curr_Date) values (13, 13, 'I can breathe easier now that I''ve quit vaping.', '2022-03-10');
-- insert into Comments (Post_ID, User_ID, Content, Curr_Date) values (14, 14, 'My skin looks so much better after quitting vaping.', '2022-09-24');
-- insert into Comments (Post_ID, User_ID, Content, Curr_Date) values (15, 15, 'I''m setting a positive example for others by quitting vaping.', '2022-10-07');
-- insert into Comments (Post_ID, User_ID, Content, Curr_Date) values (16, 16, 'My skin looks so much better after quitting vaping.', '2022-08-12');
-- insert into Comments (Post_ID, User_ID, Content, Curr_Date) values (17, 17, 'I feel free from the addiction to vaping.', '2022-04-22');
-- insert into Comments (Post_ID, User_ID, Content, Curr_Date) values (18, 18, 'I can breathe easier now that I''ve quit vaping.', '2022-09-24');
-- insert into Comments (Post_ID, User_ID, Content, Curr_Date) values (19, 19, 'I can taste food better now that I''m not vaping anymore.', '2022-08-12');
-- insert into Comments (Post_ID, User_ID, Content, Curr_Date) values (20, 20, 'I have more energy now that I''ve stopped vaping.', '2022-05-05');
-- insert into Comments (Post_ID, User_ID, Content, Curr_Date) values (21, 21, 'My skin looks so much better after quitting vaping.', '2022-08-12');
-- insert into Comments (Post_ID, User_ID, Content, Curr_Date) values (22, 22, 'I have more energy now that I''ve stopped vaping.', '2022-04-22');
-- insert into Comments (Post_ID, User_ID, Content, Curr_Date) values (23, 23, 'I''m setting a positive example for others by quitting vaping.', '2022-07-30');
-- insert into Comments (Post_ID, User_ID, Content, Curr_Date) values (24, 24, 'I''m proud of myself for making the decision to quit vaping.', '2022-04-22');
-- insert into Comments (Post_ID, User_ID, Content, Curr_Date) values (25, 25, 'I no longer have to worry about the negative health effects of vaping.', '2022-01-15');
-- insert into Comments (Post_ID, User_ID, Content, Curr_Date) values (26, 26, 'I feel so much healthier since quitting vaping!', '2022-08-12');
-- insert into Comments (Post_ID, User_ID, Content, Curr_Date) values (27, 27, 'I no longer have to worry about the negative health effects of vaping.', '2022-01-15');
-- insert into Comments (Post_ID, User_ID, Content, Curr_Date) values (28, 28, 'My skin looks so much better after quitting vaping.', '2022-03-10');
-- insert into Comments (Post_ID, User_ID, Content, Curr_Date) values (29, 29, 'I have more energy now that I''ve stopped vaping.', '2022-07-30');
-- insert into Comments (Post_ID, User_ID, Content, Curr_Date) values (30, 30, 'I feel so much healthier since quitting vaping!', '2022-09-24');
-- insert into Comments (Post_ID, User_ID, Content, Curr_Date) values (31, 31, 'I can breathe easier now that I''ve quit vaping.', '2022-03-10');
-- insert into Comments (Post_ID, User_ID, Content, Curr_Date) values (32, 32, 'I''m proud of myself for making the decision to quit vaping.', '2022-06-18');
-- insert into Comments (Post_ID, User_ID, Content, Curr_Date) values (33, 33, 'I can breathe easier now that I''ve quit vaping.', '2022-06-18');
-- insert into Comments (Post_ID, User_ID, Content, Curr_Date) values (34, 34, 'I feel so much healthier since quitting vaping!', '2022-08-12');
-- insert into Comments (Post_ID, User_ID, Content, Curr_Date) values (35, 35, 'I''m proud of myself for making the decision to quit vaping.', '2022-09-24');
-- insert into Comments (Post_ID, User_ID, Content, Curr_Date) values (36, 36, 'I have more energy now that I''ve stopped vaping.', '2022-01-15');
-- insert into Comments (Post_ID, User_ID, Content, Curr_Date) values (37, 37, 'I''ve saved so much money by quitting vaping.', '2022-01-15');
-- insert into Comments (Post_ID, User_ID, Content, Curr_Date) values (38, 38, 'I no longer have to worry about the negative health effects of vaping.', '2022-07-30');
-- insert into Comments (Post_ID, User_ID, Content, Curr_Date) values (39, 39, 'I''ve saved so much money by quitting vaping.', '2022-01-15');
-- insert into Comments (Post_ID, User_ID, Content, Curr_Date) values (40, 40, 'I have more energy now that I''ve stopped vaping.', '2022-01-15');
-- insert into Comments (Post_ID, User_ID, Content, Curr_Date) values (41, 41, 'I''ve saved so much money by quitting vaping.', '2022-04-22');
-- insert into Comments (Post_ID, User_ID, Content, Curr_Date) values (42, 42, 'I no longer have to worry about the negative health effects of vaping.', '2022-06-18');
-- insert into Comments (Post_ID, User_ID, Content, Curr_Date) values (43, 43, 'I can taste food better now that I''m not vaping anymore.', '2022-02-28');
-- insert into Comments (Post_ID, User_ID, Content, Curr_Date) values (44, 44, 'I have more energy now that I''ve stopped vaping.', '2022-08-12');
-- insert into Comments (Post_ID, User_ID, Content, Curr_Date) values (45, 45, 'I''m setting a positive example for others by quitting vaping.', '2022-10-07');

-- insert into User_Badges (Badge_ID, User_ID, Earned_Date) values (45, 12345, '2022-01-15');
-- insert into User_Badges (Badge_ID, User_ID, Earned_Date) values (12, 12345, '2022-02-28');
-- insert into User_Badges (Badge_ID, User_ID, Earned_Date) values (46, 98765, '2022-03-10');
-- insert into User_Badges (Badge_ID, User_ID, Earned_Date) values (63, 67890, '2022-04-22');
-- insert into User_Badges (Badge_ID, User_ID, Earned_Date) values (55, 12345, '2022-05-05');
-- insert into User_Badges (Badge_ID, User_ID, Earned_Date) values (61, 24680, '2022-06-18');
-- insert into User_Badges (Badge_ID, User_ID, Earned_Date) values (51, 67890, '2022-07-30');
-- insert into User_Badges (Badge_ID, User_ID, Earned_Date) values (7, 54321, '2022-08-12');
-- insert into User_Badges (Badge_ID, User_ID, Earned_Date) values (98, 12345, '2022-09-24');
-- insert into User_Badges (Badge_ID, User_ID, Earned_Date) values (88, 67890, '2022-10-07');
-- insert into User_Badges (Badge_ID, User_ID, Earned_Date) values (9, 54321, '2022-11-19');
-- insert into User_Badges (Badge_ID, User_ID, Earned_Date) values (60, 98765, '2022-12-31');
-- insert into User_Badges (Badge_ID, User_ID, Earned_Date) values (79, 98765, '2022-01-15');
-- insert into User_Badges (Badge_ID, User_ID, Earned_Date) values (49, 24680, '2022-02-28');
-- insert into User_Badges (Badge_ID, User_ID, Earned_Date) values (45, 54321, '2022-03-10');
-- insert into User_Badges (Badge_ID, User_ID, Earned_Date) values (47, 54321, '2022-04-22');
-- insert into User_Badges (Badge_ID, User_ID, Earned_Date) values (85, 24680, '2022-05-05');
-- insert into User_Badges (Badge_ID, User_ID, Earned_Date) values (88, 67890, '2022-06-18');
-- insert into User_Badges (Badge_ID, User_ID, Earned_Date) values (36, 67890, '2022-07-30');
-- insert into User_Badges (Badge_ID, User_ID, Earned_Date) values (31, 54321, '2022-08-12');
-- insert into User_Badges (Badge_ID, User_ID, Earned_Date) values (75, 98765, '2022-09-24');
-- insert into User_Badges (Badge_ID, User_ID, Earned_Date) values (99, 12345, '2022-10-07');
-- insert into User_Badges (Badge_ID, User_ID, Earned_Date) values (84, 24680, '2022-11-19');
-- insert into User_Badges (Badge_ID, User_ID, Earned_Date) values (25, 54321, '2022-12-31');
-- insert into User_Badges (Badge_ID, User_ID, Earned_Date) values (79, 24680, '2022-01-15');
-- insert into User_Badges (Badge_ID, User_ID, Earned_Date) values (47, 98765, '2022-02-28');
-- insert into User_Badges (Badge_ID, User_ID, Earned_Date) values (9, 12345, '2022-03-10');
-- insert into User_Badges (Badge_ID, User_ID, Earned_Date) values (26, 67890, '2022-04-22');
-- insert into User_Badges (Badge_ID, User_ID, Earned_Date) values (43, 98765, '2022-05-05');
-- insert into User_Badges (Badge_ID, User_ID, Earned_Date) values (18, 54321, '2022-06-18');
-- insert into User_Badges (Badge_ID, User_ID, Earned_Date) values (49, 24680, '2022-07-30');
-- insert into User_Badges (Badge_ID, User_ID, Earned_Date) values (2, 24680, '2022-08-12');
-- insert into User_Badges (Badge_ID, User_ID, Earned_Date) values (69, 98765, '2022-09-24');
-- insert into User_Badges (Badge_ID, User_ID, Earned_Date) values (19, 24680, '2022-10-07');
-- insert into User_Badges (Badge_ID, User_ID, Earned_Date) values (77, 54321, '2022-11-19');
-- insert into User_Badges (Badge_ID, User_ID, Earned_Date) values (73, 54321, '2022-12-31');
-- insert into User_Badges (Badge_ID, User_ID, Earned_Date) values (38, 24680, '2022-01-15');
-- insert into User_Badges (Badge_ID, User_ID, Earned_Date) values (17, 12345, '2022-02-28');
-- insert into User_Badges (Badge_ID, User_ID, Earned_Date) values (38, 98765, '2022-03-10');
-- insert into User_Badges (Badge_ID, User_ID, Earned_Date) values (63, 24680, '2022-04-22');
-- insert into User_Badges (Badge_ID, User_ID, Earned_Date) values (73, 24680, '2022-05-05');
-- insert into User_Badges (Badge_ID, User_ID, Earned_Date) values (17, 24680, '2022-06-18');
-- insert into User_Badges (Badge_ID, User_ID, Earned_Date) values (6, 54321, '2022-07-30');
-- insert into User_Badges (Badge_ID, User_ID, Earned_Date) values (12, 98765, '2022-08-12');
-- insert into User_Badges (Badge_ID, User_ID, Earned_Date) values (28, 67890, '2022-09-24');
-- insert into User_Badges (Badge_ID, User_ID, Earned_Date) values (7, 54321, '2022-10-07');
-- insert into User_Badges (Badge_ID, User_ID, Earned_Date) values (75, 67890, '2022-11-19');
-- insert into User_Badges (Badge_ID, User_ID, Earned_Date) values (39, 24680, '2022-12-31');
-- insert into User_Badges (Badge_ID, User_ID, Earned_Date) values (89, 67890, '2022-01-15');
-- insert into User_Badges (Badge_ID, User_ID, Earned_Date) values (1, 67890, '2022-02-28');
-- insert into User_Badges (Badge_ID, User_ID, Earned_Date) values (64, 98765, '2022-03-10');
-- insert into User_Badges (Badge_ID, User_ID, Earned_Date) values (71, 24680, '2022-04-22');
-- insert into User_Badges (Badge_ID, User_ID, Earned_Date) values (31, 12345, '2022-05-05');
-- insert into User_Badges (Badge_ID, User_ID, Earned_Date) values (60, 24680, '2022-06-18');
-- insert into User_Badges (Badge_ID, User_ID, Earned_Date) values (55, 98765, '2022-07-30');
-- insert into User_Badges (Badge_ID, User_ID, Earned_Date) values (59, 98765, '2022-08-12');
-- insert into User_Badges (Badge_ID, User_ID, Earned_Date) values (66, 24680, '2022-09-24');
-- insert into User_Badges (Badge_ID, User_ID, Earned_Date) values (95, 54321, '2022-10-07');
-- insert into User_Badges (Badge_ID, User_ID, Earned_Date) values (92, 54321, '2022-11-19');
-- insert into User_Badges (Badge_ID, User_ID, Earned_Date) values (27, 67890, '2022-12-31');
-- insert into User_Badges (Badge_ID, User_ID, Earned_Date) values (30, 54321, '2022-01-15');
-- insert into User_Badges (Badge_ID, User_ID, Earned_Date) values (22, 12345, '2022-02-28');
-- insert into User_Badges (Badge_ID, User_ID, Earned_Date) values (18, 24680, '2022-03-10');
-- insert into User_Badges (Badge_ID, User_ID, Earned_Date) values (89, 12345, '2022-04-22');
-- insert into User_Badges (Badge_ID, User_ID, Earned_Date) values (79, 54321, '2022-05-05');
-- insert into User_Badges (Badge_ID, User_ID, Earned_Date) values (48, 12345, '2022-06-18');
-- insert into User_Badges (Badge_ID, User_ID, Earned_Date) values (94, 24680, '2022-07-30');
-- insert into User_Badges (Badge_ID, User_ID, Earned_Date) values (63, 98765, '2022-08-12');
-- insert into User_Badges (Badge_ID, User_ID, Earned_Date) values (51, 12345, '2022-09-24');
-- insert into User_Badges (Badge_ID, User_ID, Earned_Date) values (79, 24680, '2022-10-07');
-- insert into User_Badges (Badge_ID, User_ID, Earned_Date) values (59, 54321, '2022-11-19');
-- insert into User_Badges (Badge_ID, User_ID, Earned_Date) values (80, 67890, '2022-12-31');
-- insert into User_Badges (Badge_ID, User_ID, Earned_Date) values (10, 98765, '2022-01-15');
-- insert into User_Badges (Badge_ID, User_ID, Earned_Date) values (43, 24680, '2022-02-28');
-- insert into User_Badges (Badge_ID, User_ID, Earned_Date) values (45, 98765, '2022-03-10');
-- insert into User_Badges (Badge_ID, User_ID, Earned_Date) values (58, 98765, '2022-04-22');
-- insert into User_Badges (Badge_ID, User_ID, Earned_Date) values (25, 54321, '2022-05-05');
-- insert into User_Badges (Badge_ID, User_ID, Earned_Date) values (95, 12345, '2022-06-18');
-- insert into User_Badges (Badge_ID, User_ID, Earned_Date) values (39, 67890, '2022-07-30');
-- insert into User_Badges (Badge_ID, User_ID, Earned_Date) values (10, 54321, '2022-08-12');
-- insert into User_Badges (Badge_ID, User_ID, Earned_Date) values (85, 24680, '2022-09-24');
-- insert into User_Badges (Badge_ID, User_ID, Earned_Date) values (4, 98765, '2022-10-07');
-- insert into User_Badges (Badge_ID, User_ID, Earned_Date) values (100, 54321, '2022-11-19');
-- insert into User_Badges (Badge_ID, User_ID, Earned_Date) values (24, 98765, '2022-12-31');
-- insert into User_Badges (Badge_ID, User_ID, Earned_Date) values (97, 98765, '2022-01-15');
-- insert into User_Badges (Badge_ID, User_ID, Earned_Date) values (31, 12345, '2022-02-28');
-- insert into User_Badges (Badge_ID, User_ID, Earned_Date) values (43, 12345, '2022-03-10');
-- insert into User_Badges (Badge_ID, User_ID, Earned_Date) values (91, 98765, '2022-04-22');
-- insert into User_Badges (Badge_ID, User_ID, Earned_Date) values (72, 67890, '2022-05-05');
-- insert into User_Badges (Badge_ID, User_ID, Earned_Date) values (48, 67890, '2022-06-18');
-- insert into User_Badges (Badge_ID, User_ID, Earned_Date) values (1, 67890, '2022-07-30');
-- insert into User_Badges (Badge_ID, User_ID, Earned_Date) values (2, 12345, '2022-08-12');
-- insert into User_Badges (Badge_ID, User_ID, Earned_Date) values (80, 54321, '2022-09-24');
-- insert into User_Badges (Badge_ID, User_ID, Earned_Date) values (93, 24680, '2022-10-07');
-- insert into User_Badges (Badge_ID, User_ID, Earned_Date) values (6, 98765, '2022-11-19');
-- insert into User_Badges (Badge_ID, User_ID, Earned_Date) values (47, 24680, '2022-12-31');
-- insert into User_Badges (Badge_ID, User_ID, Earned_Date) values (36, 67890, '2022-01-15');
-- insert into User_Badges (Badge_ID, User_ID, Earned_Date) values (96, 98765, '2022-02-28');
-- insert into User_Badges (Badge_ID, User_ID, Earned_Date) values (68, 54321, '2022-03-10');
-- insert into User_Badges (Badge_ID, User_ID, Earned_Date) values (89, 12345, '2022-04-22');
-- insert into User_Badges (Badge_ID, User_ID, Earned_Date) values (14, 67890, '2022-05-05');
-- insert into User_Badges (Badge_ID, User_ID, Earned_Date) values (28, 24680, '2022-06-18');
-- insert into User_Badges (Badge_ID, User_ID, Earned_Date) values (100, 54321, '2022-07-30');
-- insert into User_Badges (Badge_ID, User_ID, Earned_Date) values (36, 98765, '2022-08-12');
-- insert into User_Badges (Badge_ID, User_ID, Earned_Date) values (85, 54321, '2022-09-24');
-- insert into User_Badges (Badge_ID, User_ID, Earned_Date) values (94, 98765, '2022-10-07');
-- insert into User_Badges (Badge_ID, User_ID, Earned_Date) values (50, 98765, '2022-11-19');
-- insert into User_Badges (Badge_ID, User_ID, Earned_Date) values (37, 12345, '2022-12-31');
-- insert into User_Badges (Badge_ID, User_ID, Earned_Date) values (34, 98765, '2022-01-15');
-- insert into User_Badges (Badge_ID, User_ID, Earned_Date) values (23, 24680, '2022-02-28');
-- insert into User_Badges (Badge_ID, User_ID, Earned_Date) values (33, 54321, '2022-03-10');
-- insert into User_Badges (Badge_ID, User_ID, Earned_Date) values (66, 24680, '2022-04-22');
-- insert into User_Badges (Badge_ID, User_ID, Earned_Date) values (38, 98765, '2022-05-05');
-- insert into User_Badges (Badge_ID, User_ID, Earned_Date) values (89, 24680, '2022-06-18');
-- insert into User_Badges (Badge_ID, User_ID, Earned_Date) values (20, 98765, '2022-07-30');
-- insert into User_Badges (Badge_ID, User_ID, Earned_Date) values (19, 12345, '2022-08-12');
-- insert into User_Badges (Badge_ID, User_ID, Earned_Date) values (67, 54321, '2022-09-24');
-- insert into User_Badges (Badge_ID, User_ID, Earned_Date) values (8, 12345, '2022-10-07');
-- insert into User_Badges (Badge_ID, User_ID, Earned_Date) values (77, 67890, '2022-11-19');
-- insert into User_Badges (Badge_ID, User_ID, Earned_Date) values (75, 54321, '2022-12-31');
-- insert into User_Badges (Badge_ID, User_ID, Earned_Date) values (86, 12345, '2022-01-15');
-- insert into User_Badges (Badge_ID, User_ID, Earned_Date) values (91, 67890, '2022-02-28');
-- insert into User_Badges (Badge_ID, User_ID, Earned_Date) values (19, 12345, '2022-03-10');
-- insert into User_Badges (Badge_ID, User_ID, Earned_Date) values (39, 54321, '2022-04-22');
-- insert into User_Badges (Badge_ID, User_ID, Earned_Date) values (56, 24680, '2022-05-05');
-- insert into User_Badges (Badge_ID, User_ID, Earned_Date) values (98, 67890, '2022-06-18');
-- insert into User_Badges (Badge_ID, User_ID, Earned_Date) values (81, 67890, '2022-07-30');
-- insert into User_Badges (Badge_ID, User_ID, Earned_Date) values (69, 24680, '2022-08-12');
-- insert into User_Badges (Badge_ID, User_ID, Earned_Date) values (48, 54321, '2022-09-24');
-- insert into User_Badges (Badge_ID, User_ID, Earned_Date) values (90, 24680, '2022-10-07');
-- insert into User_Badges (Badge_ID, User_ID, Earned_Date) values (66, 12345, '2022-11-19');
-- insert into User_Badges (Badge_ID, User_ID, Earned_Date) values (71, 67890, '2022-12-31');
-- insert into User_Badges (Badge_ID, User_ID, Earned_Date) values (90, 54321, '2022-01-15');
-- insert into User_Badges (Badge_ID, User_ID, Earned_Date) values (75, 12345, '2022-02-28');
-- insert into User_Badges (Badge_ID, User_ID, Earned_Date) values (80, 98765, '2022-03-10');
-- insert into User_Badges (Badge_ID, User_ID, Earned_Date) values (68, 67890, '2022-04-22');
-- insert into User_Badges (Badge_ID, User_ID, Earned_Date) values (34, 24680, '2022-05-05');
-- insert into User_Badges (Badge_ID, User_ID, Earned_Date) values (27, 24680, '2022-06-18');
-- insert into User_Badges (Badge_ID, User_ID, Earned_Date) values (45, 54321, '2022-07-30');
-- insert into User_Badges (Badge_ID, User_ID, Earned_Date) values (15, 54321, '2022-08-12');
-- insert into User_Badges (Badge_ID, User_ID, Earned_Date) values (40, 24680, '2022-09-24');
-- insert into User_Badges (Badge_ID, User_ID, Earned_Date) values (93, 24680, '2022-10-07');
-- insert into User_Badges (Badge_ID, User_ID, Earned_Date) values (69, 67890, '2022-11-19');
-- insert into User_Badges (Badge_ID, User_ID, Earned_Date) values (76, 24680, '2022-12-31');
-- insert into User_Badges (Badge_ID, User_ID, Earned_Date) values (55, 98765, '2022-01-15');
-- insert into User_Badges (Badge_ID, User_ID, Earned_Date) values (35, 24680, '2022-02-28');
-- insert into User_Badges (Badge_ID, User_ID, Earned_Date) values (60, 24680, '2022-03-10');
-- insert into User_Badges (Badge_ID, User_ID, Earned_Date) values (37, 98765, '2022-04-22');
-- insert into User_Badges (Badge_ID, User_ID, Earned_Date) values (8, 12345, '2022-05-05');
-- insert into User_Badges (Badge_ID, User_ID, Earned_Date) values (3, 98765, '2022-06-18');
-- insert into User_Badges (Badge_ID, User_ID, Earned_Date) values (30, 54321, '2022-07-30');
-- insert into User_Badges (Badge_ID, User_ID, Earned_Date) values (59, 67890, '2022-08-12');
-- insert into User_Badges (Badge_ID, User_ID, Earned_Date) values (29, 67890, '2022-09-24');
-- insert into User_Badges (Badge_ID, User_ID, Earned_Date) values (55, 98765, '2022-10-07');
-- insert into User_Badges (Badge_ID, User_ID, Earned_Date) values (29, 98765, '2022-11-19');
-- insert into User_Badges (Badge_ID, User_ID, Earned_Date) values (19, 67890, '2022-12-31');
-- insert into User_Badges (Badge_ID, User_ID, Earned_Date) values (64, 12345, '2022-01-15');
-- insert into User_Badges (Badge_ID, User_ID, Earned_Date) values (83, 67890, '2022-02-28');
-- insert into User_Badges (Badge_ID, User_ID, Earned_Date) values (33, 12345, '2022-03-10');
-- insert into User_Badges (Badge_ID, User_ID, Earned_Date) values (51, 24680, '2022-04-22');
-- insert into User_Badges (Badge_ID, User_ID, Earned_Date) values (97, 98765, '2022-05-05');
-- insert into User_Badges (Badge_ID, User_ID, Earned_Date) values (19, 12345, '2022-06-18');
-- insert into User_Badges (Badge_ID, User_ID, Earned_Date) values (79, 98765, '2022-07-30');
-- insert into User_Badges (Badge_ID, User_ID, Earned_Date) values (78, 24680, '2022-08-12');
-- insert into User_Badges (Badge_ID, User_ID, Earned_Date) values (35, 98765, '2022-09-24');
-- insert into User_Badges (Badge_ID, User_ID, Earned_Date) values (17, 12345, '2022-10-07');
-- insert into User_Badges (Badge_ID, User_ID, Earned_Date) values (82, 24680, '2022-11-19');
-- insert into User_Badges (Badge_ID, User_ID, Earned_Date) values (27, 98765, '2022-12-31');
-- insert into User_Badges (Badge_ID, User_ID, Earned_Date) values (50, 67890, '2022-01-15');
-- insert into User_Badges (Badge_ID, User_ID, Earned_Date) values (68, 12345, '2022-02-28');
-- insert into User_Badges (Badge_ID, User_ID, Earned_Date) values (40, 54321, '2022-03-10');
-- insert into User_Badges (Badge_ID, User_ID, Earned_Date) values (82, 98765, '2022-04-22');
-- insert into User_Badges (Badge_ID, User_ID, Earned_Date) values (46, 24680, '2022-05-05');
-- insert into User_Badges (Badge_ID, User_ID, Earned_Date) values (6, 24680, '2022-06-18');
-- insert into User_Badges (Badge_ID, User_ID, Earned_Date) values (20, 54321, '2022-07-30');
-- insert into User_Badges (Badge_ID, User_ID, Earned_Date) values (16, 12345, '2022-08-12');
-- insert into User_Badges (Badge_ID, User_ID, Earned_Date) values (15, 54321, '2022-09-24');
-- insert into User_Badges (Badge_ID, User_ID, Earned_Date) values (38, 67890, '2022-10-07');
-- insert into User_Badges (Badge_ID, User_ID, Earned_Date) values (72, 98765, '2022-11-19');
-- insert into User_Badges (Badge_ID, User_ID, Earned_Date) values (38, 54321, '2022-12-31');
-- insert into User_Badges (Badge_ID, User_ID, Earned_Date) values (31, 67890, '2022-01-15');
-- insert into User_Badges (Badge_ID, User_ID, Earned_Date) values (95, 24680, '2022-02-28');
-- insert into User_Badges (Badge_ID, User_ID, Earned_Date) values (45, 67890, '2022-03-10');
-- insert into User_Badges (Badge_ID, User_ID, Earned_Date) values (85, 54321, '2022-04-22');
-- insert into User_Badges (Badge_ID, User_ID, Earned_Date) values (91, 24680, '2022-05-05');
-- insert into User_Badges (Badge_ID, User_ID, Earned_Date) values (12, 54321, '2022-06-18');
-- insert into User_Badges (Badge_ID, User_ID, Earned_Date) values (79, 54321, '2022-07-30');
-- insert into User_Badges (Badge_ID, User_ID, Earned_Date) values (69, 98765, '2022-08-12');
-- insert into User_Badges (Badge_ID, User_ID, Earned_Date) values (96, 54321, '2022-09-24');
-- insert into User_Badges (Badge_ID, User_ID, Earned_Date) values (8, 12345, '2022-10-07');
-- insert into User_Badges (Badge_ID, User_ID, Earned_Date) values (61, 67890, '2022-11-19');
-- insert into User_Badges (Badge_ID, User_ID, Earned_Date) values (7, 24680, '2022-12-31');
-- insert into User_Badges (Badge_ID, User_ID, Earned_Date) values (2, 24680, '2022-01-15');
-- insert into User_Badges (Badge_ID, User_ID, Earned_Date) values (9, 98765, '2022-02-28');
-- insert into User_Badges (Badge_ID, User_ID, Earned_Date) values (28, 67890, '2022-03-10');
-- insert into User_Badges (Badge_ID, User_ID, Earned_Date) values (42, 98765, '2022-04-22');
-- insert into User_Badges (Badge_ID, User_ID, Earned_Date) values (87, 12345, '2022-05-05');
-- insert into User_Badges (Badge_ID, User_ID, Earned_Date) values (20, 67890, '2022-06-18');
-- insert into User_Badges (Badge_ID, User_ID, Earned_Date) values (29, 24680, '2022-07-30');
-- insert into User_Badges (Badge_ID, User_ID, Earned_Date) values (87, 54321, '2022-08-12');

-- insert into User_Challenges (Challenge_ID, User_ID, Progress, Completion) values (140, 44444, 0, 'Incomplete');
-- insert into User_Challenges (Challenge_ID, User_ID, Progress, Completion) values (331, 67890, 50, 'In Progress');
-- insert into User_Challenges (Challenge_ID, User_ID, Progress, Completion) values (633, 11111, 100, 'Completed');
-- insert into User_Challenges (Challenge_ID, User_ID, Progress, Completion) values (213, 54321, 0, 'Incomplete');
-- insert into User_Challenges (Challenge_ID, User_ID, Progress, Completion) values (731, 54321, 50, 'In Progress');
-- insert into User_Challenges (Challenge_ID, User_ID, Progress, Completion) values (408, 44444, 100, 'Completed');
-- insert into User_Challenges (Challenge_ID, User_ID, Progress, Completion) values (356, 22222, 0, 'Incomplete');
-- insert into User_Challenges (Challenge_ID, User_ID, Progress, Completion) values (766, 54321, 50, 'In Progress');
-- insert into User_Challenges (Challenge_ID, User_ID, Progress, Completion) values (95, 98765, 100, 'Completed');
-- insert into User_Challenges (Challenge_ID, User_ID, Progress, Completion) values (153, 12345, 0, 'Incomplete');
-- insert into User_Challenges (Challenge_ID, User_ID, Progress, Completion) values (885, 24680, 50, 'In Progress');
-- insert into User_Challenges (Challenge_ID, User_ID, Progress, Completion) values (68, 33333, 100, 'Completed');
-- insert into User_Challenges (Challenge_ID, User_ID, Progress, Completion) values (103, 98765, 0, 'Incomplete');
-- insert into User_Challenges (Challenge_ID, User_ID, Progress, Completion) values (840, 12345, 50, 'In Progress');
-- insert into User_Challenges (Challenge_ID, User_ID, Progress, Completion) values (862, 12345, 100, 'Completed');
-- insert into User_Challenges (Challenge_ID, User_ID, Progress, Completion) values (856, 54321, 0, 'Incomplete');
-- insert into User_Challenges (Challenge_ID, User_ID, Progress, Completion) values (6, 11111, 50, 'In Progress');
-- insert into User_Challenges (Challenge_ID, User_ID, Progress, Completion) values (395, 12345, 100, 'Completed');
-- insert into User_Challenges (Challenge_ID, User_ID, Progress, Completion) values (271, 33333, 0, 'Incomplete');
-- insert into User_Challenges (Challenge_ID, User_ID, Progress, Completion) values (444, 22222, 50, 'In Progress');
-- insert into User_Challenges (Challenge_ID, User_ID, Progress, Completion) values (294, 24680, 100, 'Completed');
-- insert into User_Challenges (Challenge_ID, User_ID, Progress, Completion) values (279, 54321, 0, 'Incomplete');
-- insert into User_Challenges (Challenge_ID, User_ID, Progress, Completion) values (780, 44444, 50, 'In Progress');
-- insert into User_Challenges (Challenge_ID, User_ID, Progress, Completion) values (949, 22222, 100, 'Completed');
-- insert into User_Challenges (Challenge_ID, User_ID, Progress, Completion) values (205, 22222, 0, 'Incomplete');
-- insert into User_Challenges (Challenge_ID, User_ID, Progress, Completion) values (572, 24680, 50, 'In Progress');
-- insert into User_Challenges (Challenge_ID, User_ID, Progress, Completion) values (199, 98765, 100, 'Completed');
-- insert into User_Challenges (Challenge_ID, User_ID, Progress, Completion) values (160, 98765, 0, 'Incomplete');
-- insert into User_Challenges (Challenge_ID, User_ID, Progress, Completion) values (193, 24680, 50, 'In Progress');
-- insert into User_Challenges (Challenge_ID, User_ID, Progress, Completion) values (297, 22222, 100, 'Completed');
-- insert into User_Challenges (Challenge_ID, User_ID, Progress, Completion) values (425, 24680, 0, 'Incomplete');
-- insert into User_Challenges (Challenge_ID, User_ID, Progress, Completion) values (303, 44444, 50, 'In Progress');
-- insert into User_Challenges (Challenge_ID, User_ID, Progress, Completion) values (203, 44444, 100, 'Completed');
-- insert into User_Challenges (Challenge_ID, User_ID, Progress, Completion) values (578, 22222, 0, 'Incomplete');
-- insert into User_Challenges (Challenge_ID, User_ID, Progress, Completion) values (158, 11111, 50, 'In Progress');
-- insert into User_Challenges (Challenge_ID, User_ID, Progress, Completion) values (537, 22222, 100, 'Completed');
-- insert into User_Challenges (Challenge_ID, User_ID, Progress, Completion) values (94, 22222, 0, 'Incomplete');
-- insert into User_Challenges (Challenge_ID, User_ID, Progress, Completion) values (753, 44444, 50, 'In Progress');
-- insert into User_Challenges (Challenge_ID, User_ID, Progress, Completion) values (505, 22222, 100, 'Completed');
-- insert into User_Challenges (Challenge_ID, User_ID, Progress, Completion) values (795, 67890, 0, 'Incomplete');
-- insert into User_Challenges (Challenge_ID, User_ID, Progress, Completion) values (218, 54321, 50, 'In Progress');
-- insert into User_Challenges (Challenge_ID, User_ID, Progress, Completion) values (728, 22222, 100, 'Completed');
-- insert into User_Challenges (Challenge_ID, User_ID, Progress, Completion) values (490, 13579, 0, 'Incomplete');
-- insert into User_Challenges (Challenge_ID, User_ID, Progress, Completion) values (912, 44444, 50, 'In Progress');
-- insert into User_Challenges (Challenge_ID, User_ID, Progress, Completion) values (895, 54321, 100, 'Completed');
-- insert into User_Challenges (Challenge_ID, User_ID, Progress, Completion) values (444, 13579, 0, 'Incomplete');
-- insert into User_Challenges (Challenge_ID, User_ID, Progress, Completion) values (729, 54321, 50, 'In Progress');
-- insert into User_Challenges (Challenge_ID, User_ID, Progress, Completion) values (230, 44444, 100, 'Completed');
-- insert into User_Challenges (Challenge_ID, User_ID, Progress, Completion) values (328, 98765, 0, 'Incomplete');
-- insert into User_Challenges (Challenge_ID, User_ID, Progress, Completion) values (509, 54321, 50, 'In Progress');
-- insert into User_Challenges (Challenge_ID, User_ID, Progress, Completion) values (489, 44444, 100, 'Completed');
-- insert into User_Challenges (Challenge_ID, User_ID, Progress, Completion) values (414, 22222, 0, 'Incomplete');
-- insert into User_Challenges (Challenge_ID, User_ID, Progress, Completion) values (983, 24680, 50, 'In Progress');
-- insert into User_Challenges (Challenge_ID, User_ID, Progress, Completion) values (813, 13579, 100, 'Completed');
-- insert into User_Challenges (Challenge_ID, User_ID, Progress, Completion) values (419, 98765, 0, 'Incomplete');
-- insert into User_Challenges (Challenge_ID, User_ID, Progress, Completion) values (903, 22222, 50, 'In Progress');
-- insert into User_Challenges (Challenge_ID, User_ID, Progress, Completion) values (955, 24680, 100, 'Completed');
-- insert into User_Challenges (Challenge_ID, User_ID, Progress, Completion) values (688, 33333, 0, 'Incomplete');
-- insert into User_Challenges (Challenge_ID, User_ID, Progress, Completion) values (853, 44444, 50, 'In Progress');
-- insert into User_Challenges (Challenge_ID, User_ID, Progress, Completion) values (37, 98765, 100, 'Completed');
-- insert into User_Challenges (Challenge_ID, User_ID, Progress, Completion) values (141, 12345, 0, 'Incomplete');
-- insert into User_Challenges (Challenge_ID, User_ID, Progress, Completion) values (487, 98765, 50, 'In Progress');
-- insert into User_Challenges (Challenge_ID, User_ID, Progress, Completion) values (714, 44444, 100, 'Completed');
-- insert into User_Challenges (Challenge_ID, User_ID, Progress, Completion) values (850, 24680, 0, 'Incomplete');
-- insert into User_Challenges (Challenge_ID, User_ID, Progress, Completion) values (2, 22222, 50, 'In Progress');
-- insert into User_Challenges (Challenge_ID, User_ID, Progress, Completion) values (644, 12345, 100, 'Completed');
-- insert into User_Challenges (Challenge_ID, User_ID, Progress, Completion) values (461, 12345, 0, 'Incomplete');
-- insert into User_Challenges (Challenge_ID, User_ID, Progress, Completion) values (712, 44444, 50, 'In Progress');
-- insert into User_Challenges (Challenge_ID, User_ID, Progress, Completion) values (586, 13579, 100, 'Completed');
-- insert into User_Challenges (Challenge_ID, User_ID, Progress, Completion) values (871, 44444, 0, 'Incomplete');
-- insert into User_Challenges (Challenge_ID, User_ID, Progress, Completion) values (292, 33333, 50, 'In Progress');
-- insert into User_Challenges (Challenge_ID, User_ID, Progress, Completion) values (817, 54321, 100, 'Completed');
-- insert into User_Challenges (Challenge_ID, User_ID, Progress, Completion) values (109, 44444, 0, 'Incomplete');
-- insert into User_Challenges (Challenge_ID, User_ID, Progress, Completion) values (43, 13579, 50, 'In Progress');
-- insert into User_Challenges (Challenge_ID, User_ID, Progress, Completion) values (143, 67890, 100, 'Completed');
-- insert into User_Challenges (Challenge_ID, User_ID, Progress, Completion) values (154, 13579, 0, 'Incomplete');
-- insert into User_Challenges (Challenge_ID, User_ID, Progress, Completion) values (292, 54321, 50, 'In Progress');
-- insert into User_Challenges (Challenge_ID, User_ID, Progress, Completion) values (682, 24680, 100, 'Completed');
-- insert into User_Challenges (Challenge_ID, User_ID, Progress, Completion) values (839, 44444, 0, 'Incomplete');
-- insert into User_Challenges (Challenge_ID, User_ID, Progress, Completion) values (776, 12345, 50, 'In Progress');
-- insert into User_Challenges (Challenge_ID, User_ID, Progress, Completion) values (580, 44444, 100, 'Completed');
-- insert into User_Challenges (Challenge_ID, User_ID, Progress, Completion) values (771, 22222, 0, 'Incomplete');
-- insert into User_Challenges (Challenge_ID, User_ID, Progress, Completion) values (94, 22222, 50, 'In Progress');
-- insert into User_Challenges (Challenge_ID, User_ID, Progress, Completion) values (583, 98765, 100, 'Completed');
-- insert into User_Challenges (Challenge_ID, User_ID, Progress, Completion) values (411, 13579, 0, 'Incomplete');
-- insert into User_Challenges (Challenge_ID, User_ID, Progress, Completion) values (578, 98765, 50, 'In Progress');
-- insert into User_Challenges (Challenge_ID, User_ID, Progress, Completion) values (601, 33333, 100, 'Completed');
-- insert into User_Challenges (Challenge_ID, User_ID, Progress, Completion) values (791, 54321, 0, 'Incomplete');
-- insert into User_Challenges (Challenge_ID, User_ID, Progress, Completion) values (556, 98765, 50, 'In Progress');
-- insert into User_Challenges (Challenge_ID, User_ID, Progress, Completion) values (456, 11111, 100, 'Completed');
-- insert into User_Challenges (Challenge_ID, User_ID, Progress, Completion) values (337, 13579, 0, 'Incomplete');
-- insert into User_Challenges (Challenge_ID, User_ID, Progress, Completion) values (437, 44444, 50, 'In Progress');
-- insert into User_Challenges (Challenge_ID, User_ID, Progress, Completion) values (125, 22222, 100, 'Completed');
-- insert into User_Challenges (Challenge_ID, User_ID, Progress, Completion) values (290, 33333, 0, 'Incomplete');
-- insert into User_Challenges (Challenge_ID, User_ID, Progress, Completion) values (847, 67890, 50, 'In Progress');
-- insert into User_Challenges (Challenge_ID, User_ID, Progress, Completion) values (534, 13579, 100, 'Completed');
-- insert into User_Challenges (Challenge_ID, User_ID, Progress, Completion) values (790, 12345, 0, 'Incomplete');
-- insert into User_Challenges (Challenge_ID, User_ID, Progress, Completion) values (511, 24680, 50, 'In Progress');
-- insert into User_Challenges (Challenge_ID, User_ID, Progress, Completion) values (93, 33333, 100, 'Completed');
-- insert into User_Challenges (Challenge_ID, User_ID, Progress, Completion) values (739, 24680, 0, 'Incomplete');
-- insert into User_Challenges (Challenge_ID, User_ID, Progress, Completion) values (20, 13579, 50, 'In Progress');
-- insert into User_Challenges (Challenge_ID, User_ID, Progress, Completion) values (472, 98765, 100, 'Completed');
-- insert into User_Challenges (Challenge_ID, User_ID, Progress, Completion) values (915, 54321, 0, 'Incomplete');
-- insert into User_Challenges (Challenge_ID, User_ID, Progress, Completion) values (924, 12345, 50, 'In Progress');
-- insert into User_Challenges (Challenge_ID, User_ID, Progress, Completion) values (114, 11111, 100, 'Completed');
-- insert into User_Challenges (Challenge_ID, User_ID, Progress, Completion) values (431, 24680, 0, 'Incomplete');
-- insert into User_Challenges (Challenge_ID, User_ID, Progress, Completion) values (482, 22222, 50, 'In Progress');
-- insert into User_Challenges (Challenge_ID, User_ID, Progress, Completion) values (860, 11111, 100, 'Completed');
-- insert into User_Challenges (Challenge_ID, User_ID, Progress, Completion) values (835, 13579, 0, 'Incomplete');
-- insert into User_Challenges (Challenge_ID, User_ID, Progress, Completion) values (325, 13579, 50, 'In Progress');
-- insert into User_Challenges (Challenge_ID, User_ID, Progress, Completion) values (440, 11111, 100, 'Completed');
-- insert into User_Challenges (Challenge_ID, User_ID, Progress, Completion) values (100, 67890, 0, 'Incomplete');
-- insert into User_Challenges (Challenge_ID, User_ID, Progress, Completion) values (704, 12345, 50, 'In Progress');
-- insert into User_Challenges (Challenge_ID, User_ID, Progress, Completion) values (897, 33333, 100, 'Completed');
-- insert into User_Challenges (Challenge_ID, User_ID, Progress, Completion) values (298, 12345, 0, 'Incomplete');
-- insert into User_Challenges (Challenge_ID, User_ID, Progress, Completion) values (264, 13579, 50, 'In Progress');
-- insert into User_Challenges (Challenge_ID, User_ID, Progress, Completion) values (595, 67890, 100, 'Completed');
-- insert into User_Challenges (Challenge_ID, User_ID, Progress, Completion) values (859, 13579, 0, 'Incomplete');
-- insert into User_Challenges (Challenge_ID, User_ID, Progress, Completion) values (341, 11111, 50, 'In Progress');
-- insert into User_Challenges (Challenge_ID, User_ID, Progress, Completion) values (641, 54321, 100, 'Completed');
-- insert into User_Challenges (Challenge_ID, User_ID, Progress, Completion) values (199, 13579, 0, 'Incomplete');
-- insert into User_Challenges (Challenge_ID, User_ID, Progress, Completion) values (815, 33333, 50, 'In Progress');
-- insert into User_Challenges (Challenge_ID, User_ID, Progress, Completion) values (661, 33333, 100, 'Completed');
-- insert into User_Challenges (Challenge_ID, User_ID, Progress, Completion) values (396, 11111, 0, 'Incomplete');
-- insert into User_Challenges (Challenge_ID, User_ID, Progress, Completion) values (364, 22222, 50, 'In Progress');
-- insert into User_Challenges (Challenge_ID, User_ID, Progress, Completion) values (8, 12345, 100, 'Completed');
-- insert into User_Challenges (Challenge_ID, User_ID, Progress, Completion) values (576, 12345, 0, 'Incomplete');
-- insert into User_Challenges (Challenge_ID, User_ID, Progress, Completion) values (405, 22222, 50, 'In Progress');
-- insert into User_Challenges (Challenge_ID, User_ID, Progress, Completion) values (257, 22222, 100, 'Completed');
-- insert into User_Challenges (Challenge_ID, User_ID, Progress, Completion) values (69, 67890, 0, 'Incomplete');
-- insert into User_Challenges (Challenge_ID, User_ID, Progress, Completion) values (12, 33333, 50, 'In Progress');
-- insert into User_Challenges (Challenge_ID, User_ID, Progress, Completion) values (717, 44444, 100, 'Completed');
-- insert into User_Challenges (Challenge_ID, User_ID, Progress, Completion) values (698, 67890, 0, 'Incomplete');
-- insert into User_Challenges (Challenge_ID, User_ID, Progress, Completion) values (204, 44444, 50, 'In Progress');
-- insert into User_Challenges (Challenge_ID, User_ID, Progress, Completion) values (911, 33333, 100, 'Completed');
-- insert into User_Challenges (Challenge_ID, User_ID, Progress, Completion) values (720, 22222, 0, 'Incomplete');
-- insert into User_Challenges (Challenge_ID, User_ID, Progress, Completion) values (719, 67890, 50, 'In Progress');
-- insert into User_Challenges (Challenge_ID, User_ID, Progress, Completion) values (199, 44444, 100, 'Completed');
-- insert into User_Challenges (Challenge_ID, User_ID, Progress, Completion) values (358, 44444, 0, 'Incomplete');
-- insert into User_Challenges (Challenge_ID, User_ID, Progress, Completion) values (40, 11111, 50, 'In Progress');
-- insert into User_Challenges (Challenge_ID, User_ID, Progress, Completion) values (815, 44444, 100, 'Completed');
-- insert into User_Challenges (Challenge_ID, User_ID, Progress, Completion) values (586, 11111, 0, 'Incomplete');
-- insert into User_Challenges (Challenge_ID, User_ID, Progress, Completion) values (480, 98765, 50, 'In Progress');
-- insert into User_Challenges (Challenge_ID, User_ID, Progress, Completion) values (549, 12345, 100, 'Completed');
-- insert into User_Challenges (Challenge_ID, User_ID, Progress, Completion) values (776, 98765, 0, 'Incomplete');
-- insert into User_Challenges (Challenge_ID, User_ID, Progress, Completion) values (702, 13579, 50, 'In Progress');
-- insert into User_Challenges (Challenge_ID, User_ID, Progress, Completion) values (940, 11111, 100, 'Completed');
-- insert into User_Challenges (Challenge_ID, User_ID, Progress, Completion) values (146, 12345, 0, 'Incomplete');
-- insert into User_Challenges (Challenge_ID, User_ID, Progress, Completion) values (233, 33333, 50, 'In Progress');
-- insert into User_Challenges (Challenge_ID, User_ID, Progress, Completion) values (894, 12345, 100, 'Completed');
-- insert into User_Challenges (Challenge_ID, User_ID, Progress, Completion) values (481, 12345, 0, 'Incomplete');
-- insert into User_Challenges (Challenge_ID, User_ID, Progress, Completion) values (331, 44444, 50, 'In Progress');
-- insert into User_Challenges (Challenge_ID, User_ID, Progress, Completion) values (371, 98765, 100, 'Completed');
-- insert into User_Challenges (Challenge_ID, User_ID, Progress, Completion) values (866, 22222, 0, 'Incomplete');
-- insert into User_Challenges (Challenge_ID, User_ID, Progress, Completion) values (515, 13579, 50, 'In Progress');
-- insert into User_Challenges (Challenge_ID, User_ID, Progress, Completion) values (500, 67890, 100, 'Completed');
-- insert into User_Challenges (Challenge_ID, User_ID, Progress, Completion) values (92, 54321, 0, 'Incomplete');
-- insert into User_Challenges (Challenge_ID, User_ID, Progress, Completion) values (519, 12345, 50, 'In Progress');
-- insert into User_Challenges (Challenge_ID, User_ID, Progress, Completion) values (179, 24680, 100, 'Completed');
-- insert into User_Challenges (Challenge_ID, User_ID, Progress, Completion) values (557, 24680, 0, 'Incomplete');
-- insert into User_Challenges (Challenge_ID, User_ID, Progress, Completion) values (214, 11111, 50, 'In Progress');
-- insert into User_Challenges (Challenge_ID, User_ID, Progress, Completion) values (170, 33333, 100, 'Completed');
-- insert into User_Challenges (Challenge_ID, User_ID, Progress, Completion) values (27, 44444, 0, 'Incomplete');
-- insert into User_Challenges (Challenge_ID, User_ID, Progress, Completion) values (299, 13579, 50, 'In Progress');
-- insert into User_Challenges (Challenge_ID, User_ID, Progress, Completion) values (681, 12345, 100, 'Completed');
-- insert into User_Challenges (Challenge_ID, User_ID, Progress, Completion) values (785, 24680, 0, 'Incomplete');
-- insert into User_Challenges (Challenge_ID, User_ID, Progress, Completion) values (690, 44444, 50, 'In Progress');
-- insert into User_Challenges (Challenge_ID, User_ID, Progress, Completion) values (30, 24680, 100, 'Completed');
-- insert into User_Challenges (Challenge_ID, User_ID, Progress, Completion) values (996, 33333, 0, 'Incomplete');
-- insert into User_Challenges (Challenge_ID, User_ID, Progress, Completion) values (920, 13579, 50, 'In Progress');
-- insert into User_Challenges (Challenge_ID, User_ID, Progress, Completion) values (862, 13579, 100, 'Completed');
-- insert into User_Challenges (Challenge_ID, User_ID, Progress, Completion) values (322, 12345, 0, 'Incomplete');
-- insert into User_Challenges (Challenge_ID, User_ID, Progress, Completion) values (928, 11111, 50, 'In Progress');
-- insert into User_Challenges (Challenge_ID, User_ID, Progress, Completion) values (777, 13579, 100, 'Completed');
-- insert into User_Challenges (Challenge_ID, User_ID, Progress, Completion) values (674, 44444, 0, 'Incomplete');
-- insert into User_Challenges (Challenge_ID, User_ID, Progress, Completion) values (14, 24680, 50, 'In Progress');
-- insert into User_Challenges (Challenge_ID, User_ID, Progress, Completion) values (353, 54321, 100, 'Completed');
-- insert into User_Challenges (Challenge_ID, User_ID, Progress, Completion) values (128, 54321, 0, 'Incomplete');
-- insert into User_Challenges (Challenge_ID, User_ID, Progress, Completion) values (356, 33333, 50, 'In Progress');
-- insert into User_Challenges (Challenge_ID, User_ID, Progress, Completion) values (790, 98765, 100, 'Completed');
-- insert into User_Challenges (Challenge_ID, User_ID, Progress, Completion) values (138, 67890, 0, 'Incomplete');
-- insert into User_Challenges (Challenge_ID, User_ID, Progress, Completion) values (923, 33333, 50, 'In Progress');
-- insert into User_Challenges (Challenge_ID, User_ID, Progress, Completion) values (262, 33333, 100, 'Completed');
-- insert into User_Challenges (Challenge_ID, User_ID, Progress, Completion) values (782, 33333, 0, 'Incomplete');
-- insert into User_Challenges (Challenge_ID, User_ID, Progress, Completion) values (879, 44444, 50, 'In Progress');
-- insert into User_Challenges (Challenge_ID, User_ID, Progress, Completion) values (556, 54321, 100, 'Completed');
-- insert into User_Challenges (Challenge_ID, User_ID, Progress, Completion) values (498, 67890, 0, 'Incomplete');
-- insert into User_Challenges (Challenge_ID, User_ID, Progress, Completion) values (125, 98765, 50, 'In Progress');
-- insert into User_Challenges (Challenge_ID, User_ID, Progress, Completion) values (862, 33333, 100, 'Completed');
-- insert into User_Challenges (Challenge_ID, User_ID, Progress, Completion) values (309, 54321, 0, 'Incomplete');
-- insert into User_Challenges (Challenge_ID, User_ID, Progress, Completion) values (764, 11111, 50, 'In Progress');
-- insert into User_Challenges (Challenge_ID, User_ID, Progress, Completion) values (124, 67890, 100, 'Completed');
-- insert into User_Challenges (Challenge_ID, User_ID, Progress, Completion) values (782, 22222, 0, 'Incomplete');
-- insert into User_Challenges (Challenge_ID, User_ID, Progress, Completion) values (182, 11111, 50, 'In Progress');
-- insert into User_Challenges (Challenge_ID, User_ID, Progress, Completion) values (405, 22222, 100, 'Completed');
-- insert into User_Challenges (Challenge_ID, User_ID, Progress, Completion) values (325, 13579, 0, 'Incomplete');
-- insert into User_Challenges (Challenge_ID, User_ID, Progress, Completion) values (741, 54321, 50, 'In Progress');
-- insert into User_Challenges (Challenge_ID, User_ID, Progress, Completion) values (281, 67890, 100, 'Completed');
-- insert into User_Challenges (Challenge_ID, User_ID, Progress, Completion) values (7, 54321, 0, 'Incomplete');
-- insert into User_Challenges (Challenge_ID, User_ID, Progress, Completion) values (203, 33333, 50, 'In Progress');

-- insert into User_Education (Resource_ID, User_ID) values (6146, 12345);
-- insert into User_Education (Resource_ID, User_ID) values (1556, 24680);
-- insert into User_Education (Resource_ID, User_ID) values (2863, 99000);
-- insert into User_Education (Resource_ID, User_ID) values (5505, 99000);
-- insert into User_Education (Resource_ID, User_ID) values (4128, 67890);
-- insert into User_Education (Resource_ID, User_ID) values (6852, 54321);
-- insert into User_Education (Resource_ID, User_ID) values (9868, 24680);
-- insert into User_Education (Resource_ID, User_ID) values (5915, 24680);
-- insert into User_Education (Resource_ID, User_ID) values (7545, 12345);
-- insert into User_Education (Resource_ID, User_ID) values (8407, 54321);
-- insert into User_Education (Resource_ID, User_ID) values (2940, 67890);
-- insert into User_Education (Resource_ID, User_ID) values (2070, 77889);
-- insert into User_Education (Resource_ID, User_ID) values (3931, 24680);
-- insert into User_Education (Resource_ID, User_ID) values (2057, 12345);
-- insert into User_Education (Resource_ID, User_ID) values (8707, 13579);
-- insert into User_Education (Resource_ID, User_ID) values (1140, 11223);
-- insert into User_Education (Resource_ID, User_ID) values (371, 44556);
-- insert into User_Education (Resource_ID, User_ID) values (3306, 54321);
-- insert into User_Education (Resource_ID, User_ID) values (5078, 24680);
-- insert into User_Education (Resource_ID, User_ID) values (3240, 13579);
-- insert into User_Education (Resource_ID, User_ID) values (1568, 13579);
-- insert into User_Education (Resource_ID, User_ID) values (7817, 99000);
-- insert into User_Education (Resource_ID, User_ID) values (5216, 77889);
-- insert into User_Education (Resource_ID, User_ID) values (8640, 11223);
-- insert into User_Education (Resource_ID, User_ID) values (8104, 13579);
-- insert into User_Education (Resource_ID, User_ID) values (2776, 77889);
-- insert into User_Education (Resource_ID, User_ID) values (3786, 24680);
-- insert into User_Education (Resource_ID, User_ID) values (3577, 13579);
-- insert into User_Education (Resource_ID, User_ID) values (8166, 24680);
-- insert into User_Education (Resource_ID, User_ID) values (7224, 11223);
-- insert into User_Education (Resource_ID, User_ID) values (2018, 44556);
-- insert into User_Education (Resource_ID, User_ID) values (8682, 99000);
-- insert into User_Education (Resource_ID, User_ID) values (9517, 98765);
-- insert into User_Education (Resource_ID, User_ID) values (8922, 12345);
-- insert into User_Education (Resource_ID, User_ID) values (2627, 24680);
-- insert into User_Education (Resource_ID, User_ID) values (9077, 24680);
-- insert into User_Education (Resource_ID, User_ID) values (2156, 13579);
-- insert into User_Education (Resource_ID, User_ID) values (6538, 99000);
-- insert into User_Education (Resource_ID, User_ID) values (469, 54321);
-- insert into User_Education (Resource_ID, User_ID) values (765, 67890);
-- insert into User_Education (Resource_ID, User_ID) values (9002, 24680);
-- insert into User_Education (Resource_ID, User_ID) values (5966, 12345);
-- insert into User_Education (Resource_ID, User_ID) values (5768, 99000);
-- insert into User_Education (Resource_ID, User_ID) values (9972, 99000);
-- insert into User_Education (Resource_ID, User_ID) values (9338, 13579);
-- insert into User_Education (Resource_ID, User_ID) values (644, 24680);
-- insert into User_Education (Resource_ID, User_ID) values (3133, 77889);
-- insert into User_Education (Resource_ID, User_ID) values (5495, 11223);
-- insert into User_Education (Resource_ID, User_ID) values (8410, 13579);
-- insert into User_Education (Resource_ID, User_ID) values (8446, 98765);
-- insert into User_Education (Resource_ID, User_ID) values (1096, 13579);
-- insert into User_Education (Resource_ID, User_ID) values (7254, 77889);
-- insert into User_Education (Resource_ID, User_ID) values (9025, 11223);
-- insert into User_Education (Resource_ID, User_ID) values (2416, 77889);
-- insert into User_Education (Resource_ID, User_ID) values (4725, 24680);
-- insert into User_Education (Resource_ID, User_ID) values (7382, 44556);
-- insert into User_Education (Resource_ID, User_ID) values (8033, 98765);
-- insert into User_Education (Resource_ID, User_ID) values (6337, 12345);
-- insert into User_Education (Resource_ID, User_ID) values (4357, 13579);
-- insert into User_Education (Resource_ID, User_ID) values (5093, 54321);
-- insert into User_Education (Resource_ID, User_ID) values (3994, 54321);
-- insert into User_Education (Resource_ID, User_ID) values (2651, 24680);
-- insert into User_Education (Resource_ID, User_ID) values (3803, 67890);
-- insert into User_Education (Resource_ID, User_ID) values (7035, 12345);
-- insert into User_Education (Resource_ID, User_ID) values (6775, 11223);
-- insert into User_Education (Resource_ID, User_ID) values (5083, 54321);
-- insert into User_Education (Resource_ID, User_ID) values (7813, 13579);
-- insert into User_Education (Resource_ID, User_ID) values (6132, 98765);
-- insert into User_Education (Resource_ID, User_ID) values (5593, 44556);
-- insert into User_Education (Resource_ID, User_ID) values (404, 11223);
-- insert into User_Education (Resource_ID, User_ID) values (1179, 11223);
-- insert into User_Education (Resource_ID, User_ID) values (9109, 54321);
-- insert into User_Education (Resource_ID, User_ID) values (8924, 54321);
-- insert into User_Education (Resource_ID, User_ID) values (3488, 11223);
-- insert into User_Education (Resource_ID, User_ID) values (2852, 77889);
-- insert into User_Education (Resource_ID, User_ID) values (3719, 54321);
-- insert into User_Education (Resource_ID, User_ID) values (305, 77889);
-- insert into User_Education (Resource_ID, User_ID) values (8306, 99000);
-- insert into User_Education (Resource_ID, User_ID) values (9872, 12345);
-- insert into User_Education (Resource_ID, User_ID) values (7539, 67890);
-- insert into User_Education (Resource_ID, User_ID) values (9201, 11223);
-- insert into User_Education (Resource_ID, User_ID) values (93, 77889);
-- insert into User_Education (Resource_ID, User_ID) values (4472, 54321);
-- insert into User_Education (Resource_ID, User_ID) values (1281, 99000);
-- insert into User_Education (Resource_ID, User_ID) values (438, 67890);
-- insert into User_Education (Resource_ID, User_ID) values (4246, 67890);
-- insert into User_Education (Resource_ID, User_ID) values (8968, 11223);
-- insert into User_Education (Resource_ID, User_ID) values (6032, 99000);
-- insert into User_Education (Resource_ID, User_ID) values (4423, 13579);
-- insert into User_Education (Resource_ID, User_ID) values (3387, 11223);
-- insert into User_Education (Resource_ID, User_ID) values (581, 12345);
-- insert into User_Education (Resource_ID, User_ID) values (9032, 77889);
-- insert into User_Education (Resource_ID, User_ID) values (7889, 99000);
-- insert into User_Education (Resource_ID, User_ID) values (4048, 44556);
-- insert into User_Education (Resource_ID, User_ID) values (3210, 98765);
-- insert into User_Education (Resource_ID, User_ID) values (3016, 98765);
-- insert into User_Education (Resource_ID, User_ID) values (9483, 77889);
-- insert into User_Education (Resource_ID, User_ID) values (3935, 98765);
-- insert into User_Education (Resource_ID, User_ID) values (6077, 77889);
-- insert into User_Education (Resource_ID, User_ID) values (2926, 12345);
-- insert into User_Education (Resource_ID, User_ID) values (4018, 44556);
-- insert into User_Education (Resource_ID, User_ID) values (2713, 98765);
-- insert into User_Education (Resource_ID, User_ID) values (3204, 13579);
-- insert into User_Education (Resource_ID, User_ID) values (236, 11223);
-- insert into User_Education (Resource_ID, User_ID) values (5714, 24680);
-- insert into User_Education (Resource_ID, User_ID) values (690, 44556);
-- insert into User_Education (Resource_ID, User_ID) values (8539, 44556);
-- insert into User_Education (Resource_ID, User_ID) values (3173, 54321);
-- insert into User_Education (Resource_ID, User_ID) values (8515, 12345);
-- insert into User_Education (Resource_ID, User_ID) values (9388, 77889);
-- insert into User_Education (Resource_ID, User_ID) values (1423, 99000);
-- insert into User_Education (Resource_ID, User_ID) values (7308, 12345);
-- insert into User_Education (Resource_ID, User_ID) values (9026, 98765);
-- insert into User_Education (Resource_ID, User_ID) values (5273, 44556);
-- insert into User_Education (Resource_ID, User_ID) values (9705, 99000);
-- insert into User_Education (Resource_ID, User_ID) values (228, 67890);
-- insert into User_Education (Resource_ID, User_ID) values (3191, 54321);
-- insert into User_Education (Resource_ID, User_ID) values (4679, 11223);
-- insert into User_Education (Resource_ID, User_ID) values (2099, 11223);
-- insert into User_Education (Resource_ID, User_ID) values (5759, 98765);
-- insert into User_Education (Resource_ID, User_ID) values (7447, 54321);
-- insert into User_Education (Resource_ID, User_ID) values (2708, 98765);
-- insert into User_Education (Resource_ID, User_ID) values (4335, 13579);
-- insert into User_Education (Resource_ID, User_ID) values (8620, 24680);
-- insert into User_Education (Resource_ID, User_ID) values (2664, 98765);
-- insert into User_Education (Resource_ID, User_ID) values (7201, 12345);
-- insert into User_Education (Resource_ID, User_ID) values (1815, 13579);
-- insert into User_Education (Resource_ID, User_ID) values (4703, 99000);
-- insert into User_Education (Resource_ID, User_ID) values (9564, 98765);
-- insert into User_Education (Resource_ID, User_ID) values (8455, 12345);
-- insert into User_Education (Resource_ID, User_ID) values (3537, 44556);
-- insert into User_Education (Resource_ID, User_ID) values (6291, 54321);
-- insert into User_Education (Resource_ID, User_ID) values (3294, 54321);
-- insert into User_Education (Resource_ID, User_ID) values (1602, 44556);
-- insert into User_Education (Resource_ID, User_ID) values (7833, 13579);
-- insert into User_Education (Resource_ID, User_ID) values (7412, 44556);
-- insert into User_Education (Resource_ID, User_ID) values (8524, 44556);
-- insert into User_Education (Resource_ID, User_ID) values (8694, 54321);
-- insert into User_Education (Resource_ID, User_ID) values (9171, 44556);
-- insert into User_Education (Resource_ID, User_ID) values (8097, 67890);
-- insert into User_Education (Resource_ID, User_ID) values (3551, 99000);
-- insert into User_Education (Resource_ID, User_ID) values (91, 24680);
-- insert into User_Education (Resource_ID, User_ID) values (6185, 12345);
-- insert into User_Education (Resource_ID, User_ID) values (4864, 54321);
-- insert into User_Education (Resource_ID, User_ID) values (4619, 24680);
-- insert into User_Education (Resource_ID, User_ID) values (1928, 11223);
-- insert into User_Education (Resource_ID, User_ID) values (9622, 67890);
-- insert into User_Education (Resource_ID, User_ID) values (2353, 44556);
-- insert into User_Education (Resource_ID, User_ID) values (9725, 13579);
-- insert into User_Education (Resource_ID, User_ID) values (285, 24680);
-- insert into User_Education (Resource_ID, User_ID) values (3533, 44556);
-- insert into User_Education (Resource_ID, User_ID) values (4284, 13579);
-- insert into User_Education (Resource_ID, User_ID) values (9817, 67890);
-- insert into User_Education (Resource_ID, User_ID) values (8535, 54321);
-- insert into User_Education (Resource_ID, User_ID) values (8166, 12345);
-- insert into User_Education (Resource_ID, User_ID) values (5444, 12345);
-- insert into User_Education (Resource_ID, User_ID) values (3659, 13579);
-- insert into User_Education (Resource_ID, User_ID) values (8339, 54321);
-- insert into User_Education (Resource_ID, User_ID) values (5522, 44556);
-- insert into User_Education (Resource_ID, User_ID) values (9330, 11223);
-- insert into User_Education (Resource_ID, User_ID) values (3771, 13579);
-- insert into User_Education (Resource_ID, User_ID) values (6438, 98765);
-- insert into User_Education (Resource_ID, User_ID) values (5532, 54321);
-- insert into User_Education (Resource_ID, User_ID) values (459, 11223);
-- insert into User_Education (Resource_ID, User_ID) values (9771, 67890);
-- insert into User_Education (Resource_ID, User_ID) values (9867, 13579);
-- insert into User_Education (Resource_ID, User_ID) values (3140, 24680);
-- insert into User_Education (Resource_ID, User_ID) values (1807, 24680);
-- insert into User_Education (Resource_ID, User_ID) values (6378, 13579);
-- insert into User_Education (Resource_ID, User_ID) values (5624, 98765);
-- insert into User_Education (Resource_ID, User_ID) values (4687, 67890);
-- insert into User_Education (Resource_ID, User_ID) values (2248, 12345);
-- insert into User_Education (Resource_ID, User_ID) values (14, 99000);
-- insert into User_Education (Resource_ID, User_ID) values (519, 44556);
-- insert into User_Education (Resource_ID, User_ID) values (6492, 24680);
-- insert into User_Education (Resource_ID, User_ID) values (5407, 67890);
-- insert into User_Education (Resource_ID, User_ID) values (6916, 24680);
-- insert into User_Education (Resource_ID, User_ID) values (6819, 54321);
-- insert into User_Education (Resource_ID, User_ID) values (2120, 24680);
-- insert into User_Education (Resource_ID, User_ID) values (7343, 54321);
-- insert into User_Education (Resource_ID, User_ID) values (9823, 24680);
-- insert into User_Education (Resource_ID, User_ID) values (8051, 12345);
-- insert into User_Education (Resource_ID, User_ID) values (4065, 54321);
-- insert into User_Education (Resource_ID, User_ID) values (6478, 98765);
-- insert into User_Education (Resource_ID, User_ID) values (5116, 99000);
-- insert into User_Education (Resource_ID, User_ID) values (7960, 11223);
-- insert into User_Education (Resource_ID, User_ID) values (9039, 13579);
-- insert into User_Education (Resource_ID, User_ID) values (1327, 13579);
-- insert into User_Education (Resource_ID, User_ID) values (6370, 24680);
-- insert into User_Education (Resource_ID, User_ID) values (6402, 11223);
-- insert into User_Education (Resource_ID, User_ID) values (7787, 11223);
-- insert into User_Education (Resource_ID, User_ID) values (198, 54321);
-- insert into User_Education (Resource_ID, User_ID) values (4972, 54321);
-- insert into User_Education (Resource_ID, User_ID) values (818, 54321);
-- insert into User_Education (Resource_ID, User_ID) values (3533, 54321);
-- insert into User_Education (Resource_ID, User_ID) values (966, 12345);
-- insert into User_Education (Resource_ID, User_ID) values (8787, 44556);
-- insert into User_Education (Resource_ID, User_ID) values (934, 54321);
-- insert into User_Education (Resource_ID, User_ID) values (9930, 11223);
-- insert into User_Education (Resource_ID, User_ID) values (4047, 13579);

-- insert into User_Support (Support_ID, User_ID) values (6916, 61470);
-- insert into User_Support (Support_ID, User_ID) values (4454, 39453);
-- insert into User_Support (Support_ID, User_ID) values (669, 16612);
-- insert into User_Support (Support_ID, User_ID) values (5018, 91938);
-- insert into User_Support (Support_ID, User_ID) values (1063, 10186);
-- insert into User_Support (Support_ID, User_ID) values (1366, 46441);
-- insert into User_Support (Support_ID, User_ID) values (4888, 40844);
-- insert into User_Support (Support_ID, User_ID) values (7208, 48997);
-- insert into User_Support (Support_ID, User_ID) values (9989, 66471);
-- insert into User_Support (Support_ID, User_ID) values (1495, 72661);
-- insert into User_Support (Support_ID, User_ID) values (819, 15642);
-- insert into User_Support (Support_ID, User_ID) values (802, 11388);
-- insert into User_Support (Support_ID, User_ID) values (5357, 71137);
-- insert into User_Support (Support_ID, User_ID) values (2749, 43802);
-- insert into User_Support (Support_ID, User_ID) values (2002, 25141);
-- insert into User_Support (Support_ID, User_ID) values (678, 81201);
-- insert into User_Support (Support_ID, User_ID) values (33, 1026);
-- insert into User_Support (Support_ID, User_ID) values (2552, 87707);
-- insert into User_Support (Support_ID, User_ID) values (2611, 7970);
-- insert into User_Support (Support_ID, User_ID) values (8504, 44476);
-- insert into User_Support (Support_ID, User_ID) values (1571, 80509);
-- insert into User_Support (Support_ID, User_ID) values (7879, 61257);
-- insert into User_Support (Support_ID, User_ID) values (2725, 91222);
-- insert into User_Support (Support_ID, User_ID) values (4232, 34950);
-- insert into User_Support (Support_ID, User_ID) values (7002, 55059);
-- insert into User_Support (Support_ID, User_ID) values (2837, 14570);
-- insert into User_Support (Support_ID, User_ID) values (2218, 13294);
-- insert into User_Support (Support_ID, User_ID) values (3084, 45375);
-- insert into User_Support (Support_ID, User_ID) values (4237, 83125);
-- insert into User_Support (Support_ID, User_ID) values (1044, 95915);
-- insert into User_Support (Support_ID, User_ID) values (8872, 54033);
-- insert into User_Support (Support_ID, User_ID) values (9071, 93845);
-- insert into User_Support (Support_ID, User_ID) values (6064, 41621);
-- insert into User_Support (Support_ID, User_ID) values (8346, 33249);
-- insert into User_Support (Support_ID, User_ID) values (9966, 1003);
-- insert into User_Support (Support_ID, User_ID) values (6926, 70885);
-- insert into User_Support (Support_ID, User_ID) values (6172, 16809);
-- insert into User_Support (Support_ID, User_ID) values (196, 60025);
-- insert into User_Support (Support_ID, User_ID) values (3682, 39258);
-- insert into User_Support (Support_ID, User_ID) values (8904, 48225);
-- insert into User_Support (Support_ID, User_ID) values (2806, 26488);
-- insert into User_Support (Support_ID, User_ID) values (3425, 95434);
-- insert into User_Support (Support_ID, User_ID) values (310, 32156);
-- insert into User_Support (Support_ID, User_ID) values (8262, 2916);
-- insert into User_Support (Support_ID, User_ID) values (5163, 21528);
-- insert into User_Support (Support_ID, User_ID) values (6042, 52498);
-- insert into User_Support (Support_ID, User_ID) values (8281, 96089);
-- insert into User_Support (Support_ID, User_ID) values (4881, 272);
-- insert into User_Support (Support_ID, User_ID) values (8345, 30232);
-- insert into User_Support (Support_ID, User_ID) values (184, 79816);
-- insert into User_Support (Support_ID, User_ID) values (2519, 52958);
-- insert into User_Support (Support_ID, User_ID) values (7649, 9313);
-- insert into User_Support (Support_ID, User_ID) values (2555, 8581);
-- insert into User_Support (Support_ID, User_ID) values (9407, 95299);
-- insert into User_Support (Support_ID, User_ID) values (5986, 4174);
-- insert into User_Support (Support_ID, User_ID) values (3536, 74319);
-- insert into User_Support (Support_ID, User_ID) values (5673, 60311);
-- insert into User_Support (Support_ID, User_ID) values (7306, 32738);
-- insert into User_Support (Support_ID, User_ID) values (8807, 46876);
-- insert into User_Support (Support_ID, User_ID) values (9897, 91542);
-- insert into User_Support (Support_ID, User_ID) values (9845, 53798);
-- insert into User_Support (Support_ID, User_ID) values (9059, 15665);
-- insert into User_Support (Support_ID, User_ID) values (3489, 68931);
-- insert into User_Support (Support_ID, User_ID) values (7238, 73176);
-- insert into User_Support (Support_ID, User_ID) values (5020, 11654);
-- insert into User_Support (Support_ID, User_ID) values (2951, 65067);
-- insert into User_Support (Support_ID, User_ID) values (2210, 1297);
-- insert into User_Support (Support_ID, User_ID) values (9248, 38492);
-- insert into User_Support (Support_ID, User_ID) values (9087, 91325);
-- insert into User_Support (Support_ID, User_ID) values (1553, 80359);
-- insert into User_Support (Support_ID, User_ID) values (748, 80321);
-- insert into User_Support (Support_ID, User_ID) values (3722, 69506);
-- insert into User_Support (Support_ID, User_ID) values (9815, 73882);
-- insert into User_Support (Support_ID, User_ID) values (5322, 23035);
-- insert into User_Support (Support_ID, User_ID) values (8549, 31262);
-- insert into User_Support (Support_ID, User_ID) values (9808, 61219);
-- insert into User_Support (Support_ID, User_ID) values (8489, 27798);
-- insert into User_Support (Support_ID, User_ID) values (872, 653);
-- insert into User_Support (Support_ID, User_ID) values (6448, 43576);
-- insert into User_Support (Support_ID, User_ID) values (5669, 24720);
-- insert into User_Support (Support_ID, User_ID) values (9922, 65128);
-- insert into User_Support (Support_ID, User_ID) values (179, 82839);
-- insert into User_Support (Support_ID, User_ID) values (6295, 53952);
-- insert into User_Support (Support_ID, User_ID) values (8217, 449);
-- insert into User_Support (Support_ID, User_ID) values (8661, 12992);
-- insert into User_Support (Support_ID, User_ID) values (6424, 24947);
-- insert into User_Support (Support_ID, User_ID) values (8643, 20032);
-- insert into User_Support (Support_ID, User_ID) values (9642, 67413);
-- insert into User_Support (Support_ID, User_ID) values (1225, 3893);
-- insert into User_Support (Support_ID, User_ID) values (8348, 29385);
-- insert into User_Support (Support_ID, User_ID) values (9097, 52814);
-- insert into User_Support (Support_ID, User_ID) values (4648, 41954);
-- insert into User_Support (Support_ID, User_ID) values (1365, 29904);
-- insert into User_Support (Support_ID, User_ID) values (7324, 82179);
-- insert into User_Support (Support_ID, User_ID) values (5100, 31607);
-- insert into User_Support (Support_ID, User_ID) values (7107, 6223);
-- insert into User_Support (Support_ID, User_ID) values (9070, 55232);
-- insert into User_Support (Support_ID, User_ID) values (9160, 23644);
-- insert into User_Support (Support_ID, User_ID) values (9824, 14771);
-- insert into User_Support (Support_ID, User_ID) values (9876, 2355);
-- insert into User_Support (Support_ID, User_ID) values (5735, 69527);
-- insert into User_Support (Support_ID, User_ID) values (3224, 51998);
-- insert into User_Support (Support_ID, User_ID) values (5865, 53975);
-- insert into User_Support (Support_ID, User_ID) values (5480, 85345);
-- insert into User_Support (Support_ID, User_ID) values (3070, 70821);
-- insert into User_Support (Support_ID, User_ID) values (8645, 13335);
-- insert into User_Support (Support_ID, User_ID) values (3978, 60161);
-- insert into User_Support (Support_ID, User_ID) values (5803, 19848);
-- insert into User_Support (Support_ID, User_ID) values (5567, 92034);
-- insert into User_Support (Support_ID, User_ID) values (2698, 75505);
-- insert into User_Support (Support_ID, User_ID) values (1045, 36143);
-- insert into User_Support (Support_ID, User_ID) values (3657, 73569);
-- insert into User_Support (Support_ID, User_ID) values (5465, 13521);
-- insert into User_Support (Support_ID, User_ID) values (3616, 83641);
-- insert into User_Support (Support_ID, User_ID) values (5727, 96548);
-- insert into User_Support (Support_ID, User_ID) values (4983, 84797);
-- insert into User_Support (Support_ID, User_ID) values (9437, 64060);
-- insert into User_Support (Support_ID, User_ID) values (2365, 1949);
-- insert into User_Support (Support_ID, User_ID) values (1187, 54517);
-- insert into User_Support (Support_ID, User_ID) values (4231, 40213);
-- insert into User_Support (Support_ID, User_ID) values (558, 68721);
-- insert into User_Support (Support_ID, User_ID) values (180, 12980);
-- insert into User_Support (Support_ID, User_ID) values (6858, 19370);
-- insert into User_Support (Support_ID, User_ID) values (1259, 55613);
-- insert into User_Support (Support_ID, User_ID) values (1099, 88646);
-- insert into User_Support (Support_ID, User_ID) values (9152, 64100);
-- insert into User_Support (Support_ID, User_ID) values (138, 70813);
-- insert into User_Support (Support_ID, User_ID) values (9946, 85740);
-- insert into User_Support (Support_ID, User_ID) values (1363, 75971);
-- insert into User_Support (Support_ID, User_ID) values (3468, 85840);
-- insert into User_Support (Support_ID, User_ID) values (6859, 23766);
-- insert into User_Support (Support_ID, User_ID) values (4701, 5367);
-- insert into User_Support (Support_ID, User_ID) values (1404, 61978);
-- insert into User_Support (Support_ID, User_ID) values (4296, 49319);
-- insert into User_Support (Support_ID, User_ID) values (646, 72704);
-- insert into User_Support (Support_ID, User_ID) values (1178, 43499);
-- insert into User_Support (Support_ID, User_ID) values (1537, 93313);
-- insert into User_Support (Support_ID, User_ID) values (9293, 45813);
-- insert into User_Support (Support_ID, User_ID) values (686, 6989);
-- insert into User_Support (Support_ID, User_ID) values (4404, 75706);
-- insert into User_Support (Support_ID, User_ID) values (4122, 58165);
-- insert into User_Support (Support_ID, User_ID) values (9132, 63367);
-- insert into User_Support (Support_ID, User_ID) values (5752, 93423);
-- insert into User_Support (Support_ID, User_ID) values (6568, 42250);
-- insert into User_Support (Support_ID, User_ID) values (3515, 64666);
-- insert into User_Support (Support_ID, User_ID) values (4980, 13085);
-- insert into User_Support (Support_ID, User_ID) values (3911, 42981);
-- insert into User_Support (Support_ID, User_ID) values (7633, 52167);
-- insert into User_Support (Support_ID, User_ID) values (3835, 74268);
-- insert into User_Support (Support_ID, User_ID) values (1043, 43584);
-- insert into User_Support (Support_ID, User_ID) values (1780, 46163);
-- insert into User_Support (Support_ID, User_ID) values (5808, 75718);
-- insert into User_Support (Support_ID, User_ID) values (47, 28402);
-- insert into User_Support (Support_ID, User_ID) values (2384, 37420);
-- insert into User_Support (Support_ID, User_ID) values (2728, 11470);
-- insert into User_Support (Support_ID, User_ID) values (7788, 90535);
-- insert into User_Support (Support_ID, User_ID) values (7150, 38048);
-- insert into User_Support (Support_ID, User_ID) values (2254, 43547);
-- insert into User_Support (Support_ID, User_ID) values (6139, 11318);
-- insert into User_Support (Support_ID, User_ID) values (7817, 8847);
-- insert into User_Support (Support_ID, User_ID) values (694, 69393);
-- insert into User_Support (Support_ID, User_ID) values (3418, 11105);
-- insert into User_Support (Support_ID, User_ID) values (1103, 35998);
-- insert into User_Support (Support_ID, User_ID) values (2216, 27405);
-- insert into User_Support (Support_ID, User_ID) values (4053, 44698);
-- insert into User_Support (Support_ID, User_ID) values (7457, 1170);
-- insert into User_Support (Support_ID, User_ID) values (6773, 54688);
-- insert into User_Support (Support_ID, User_ID) values (2820, 92450);
-- insert into User_Support (Support_ID, User_ID) values (1934, 89256);
-- insert into User_Support (Support_ID, User_ID) values (5009, 62643);
-- insert into User_Support (Support_ID, User_ID) values (6710, 17131);
-- insert into User_Support (Support_ID, User_ID) values (1813, 86870);
-- insert into User_Support (Support_ID, User_ID) values (1120, 74666);
-- insert into User_Support (Support_ID, User_ID) values (9425, 59717);
-- insert into User_Support (Support_ID, User_ID) values (5926, 3420);
-- insert into User_Support (Support_ID, User_ID) values (5402, 76189);
-- insert into User_Support (Support_ID, User_ID) values (7635, 7882);
-- insert into User_Support (Support_ID, User_ID) values (5535, 59179);
-- insert into User_Support (Support_ID, User_ID) values (1637, 58674);
-- insert into User_Support (Support_ID, User_ID) values (2453, 10332);
-- insert into User_Support (Support_ID, User_ID) values (2024, 16517);
-- insert into User_Support (Support_ID, User_ID) values (4880, 99503);
-- insert into User_Support (Support_ID, User_ID) values (9385, 74362);
-- insert into User_Support (Support_ID, User_ID) values (3522, 44105);
-- insert into User_Support (Support_ID, User_ID) values (5089, 19101);
-- insert into User_Support (Support_ID, User_ID) values (1360, 3756);
-- insert into User_Support (Support_ID, User_ID) values (6249, 64278);
-- insert into User_Support (Support_ID, User_ID) values (5712, 61621);
-- insert into User_Support (Support_ID, User_ID) values (6803, 58802);
-- insert into User_Support (Support_ID, User_ID) values (7663, 39065);
-- insert into User_Support (Support_ID, User_ID) values (1475, 92461);
-- insert into User_Support (Support_ID, User_ID) values (5262, 93850);
-- insert into User_Support (Support_ID, User_ID) values (5446, 56613);
-- insert into User_Support (Support_ID, User_ID) values (2531, 1463);
-- insert into User_Support (Support_ID, User_ID) values (1128, 20525);
-- insert into User_Support (Support_ID, User_ID) values (8255, 41923);
-- insert into User_Support (Support_ID, User_ID) values (718, 46363);
-- insert into User_Support (Support_ID, User_ID) values (5454, 63456);
-- insert into User_Support (Support_ID, User_ID) values (145, 30397);
-- insert into User_Support (Support_ID, User_ID) values (8971, 96248);

-- insert into Post_Comments (Post_ID, Comment_ID) values (45095124793, 5443359295);
-- insert into Post_Comments (Post_ID, Comment_ID) values (51822582299, 7780869719);
-- insert into Post_Comments (Post_ID, Comment_ID) values (27331374101, 248610291);
-- insert into Post_Comments (Post_ID, Comment_ID) values (72882460447, 87503419);
-- insert into Post_Comments (Post_ID, Comment_ID) values (33006575776, 6596902059);
-- insert into Post_Comments (Post_ID, Comment_ID) values (924285971, 6443471624);
-- insert into Post_Comments (Post_ID, Comment_ID) values (64519778178, 7460704083);
-- insert into Post_Comments (Post_ID, Comment_ID) values (76189884658, 9598286923);
-- insert into Post_Comments (Post_ID, Comment_ID) values (59578971959, 2766063111);
-- insert into Post_Comments (Post_ID, Comment_ID) values (59497150777, 8998463696);
-- insert into Post_Comments (Post_ID, Comment_ID) values (4486017718, 1612068888);
-- insert into Post_Comments (Post_ID, Comment_ID) values (40352704749, 2155403122);
-- insert into Post_Comments (Post_ID, Comment_ID) values (16845885711, 1179775704);
-- insert into Post_Comments (Post_ID, Comment_ID) values (2018717034, 2371675998);
-- insert into Post_Comments (Post_ID, Comment_ID) values (90503866651, 6793670588);
-- insert into Post_Comments (Post_ID, Comment_ID) values (23585299066, 6551255373);
-- insert into Post_Comments (Post_ID, Comment_ID) values (74351699811, 1181560756);
-- insert into Post_Comments (Post_ID, Comment_ID) values (87920699908, 3996484243);
-- insert into Post_Comments (Post_ID, Comment_ID) values (34613464031, 3785735109);
-- insert into Post_Comments (Post_ID, Comment_ID) values (31341206146, 9484275937);
-- insert into Post_Comments (Post_ID, Comment_ID) values (86230187579, 8928543233);
-- insert into Post_Comments (Post_ID, Comment_ID) values (30651311853, 5625979656);
-- insert into Post_Comments (Post_ID, Comment_ID) values (70951452644, 9575643725);
-- insert into Post_Comments (Post_ID, Comment_ID) values (86886160006, 7645240957);
-- insert into Post_Comments (Post_ID, Comment_ID) values (40000389058, 1575987875);
-- insert into Post_Comments (Post_ID, Comment_ID) values (86264615185, 1867890559);
-- insert into Post_Comments (Post_ID, Comment_ID) values (72217531635, 9937234604);
-- insert into Post_Comments (Post_ID, Comment_ID) values (53329784527, 5493527855);
-- insert into Post_Comments (Post_ID, Comment_ID) values (56971248332, 4024772534);
-- insert into Post_Comments (Post_ID, Comment_ID) values (72037912704, 9870930983);
-- insert into Post_Comments (Post_ID, Comment_ID) values (82263162215, 6709471242);
-- insert into Post_Comments (Post_ID, Comment_ID) values (44889213751, 7242739439);
-- insert into Post_Comments (Post_ID, Comment_ID) values (93108718914, 151335702);
-- insert into Post_Comments (Post_ID, Comment_ID) values (55006252565, 651383428);
-- insert into Post_Comments (Post_ID, Comment_ID) values (37447492400, 1336684319);
-- insert into Post_Comments (Post_ID, Comment_ID) values (15487911118, 1090608098);
-- insert into Post_Comments (Post_ID, Comment_ID) values (60768417993, 8321364447);
-- insert into Post_Comments (Post_ID, Comment_ID) values (67679306282, 1202226215);
-- insert into Post_Comments (Post_ID, Comment_ID) values (36773604764, 6055664577);
-- insert into Post_Comments (Post_ID, Comment_ID) values (84005157430, 9038300351);
-- insert into Post_Comments (Post_ID, Comment_ID) values (26777934319, 144969291);
-- insert into Post_Comments (Post_ID, Comment_ID) values (75057151823, 6021626707);
-- insert into Post_Comments (Post_ID, Comment_ID) values (10231082845, 7778875084);
-- insert into Post_Comments (Post_ID, Comment_ID) values (64542333920, 2108786406);
-- insert into Post_Comments (Post_ID, Comment_ID) values (5380821108, 8894638273);
-- insert into Post_Comments (Post_ID, Comment_ID) values (73816055953, 7103931493);
-- insert into Post_Comments (Post_ID, Comment_ID) values (38107546934, 3129097689);
-- insert into Post_Comments (Post_ID, Comment_ID) values (16651285002, 5878689819);
-- insert into Post_Comments (Post_ID, Comment_ID) values (22185366206, 7911623470);
-- insert into Post_Comments (Post_ID, Comment_ID) values (71586667665, 5165006995);
-- insert into Post_Comments (Post_ID, Comment_ID) values (48558292056, 8250008243);
-- insert into Post_Comments (Post_ID, Comment_ID) values (45295583455, 9026020227);
-- insert into Post_Comments (Post_ID, Comment_ID) values (23601628585, 6341812271);
-- insert into Post_Comments (Post_ID, Comment_ID) values (39992108105, 6485568360);
-- insert into Post_Comments (Post_ID, Comment_ID) values (67388478352, 4793984998);
-- insert into Post_Comments (Post_ID, Comment_ID) values (9815795146, 1271892942);
-- insert into Post_Comments (Post_ID, Comment_ID) values (63161983939, 7307852940);
-- insert into Post_Comments (Post_ID, Comment_ID) values (19844477821, 246499145);
-- insert into Post_Comments (Post_ID, Comment_ID) values (11055278748, 8005650369);
-- insert into Post_Comments (Post_ID, Comment_ID) values (74580304948, 4503131651);
-- insert into Post_Comments (Post_ID, Comment_ID) values (72987992085, 819824229);
-- insert into Post_Comments (Post_ID, Comment_ID) values (62503326464, 2805268805);
-- insert into Post_Comments (Post_ID, Comment_ID) values (56789415877, 1141618451);
-- insert into Post_Comments (Post_ID, Comment_ID) values (99219445185, 4256630070);
-- insert into Post_Comments (Post_ID, Comment_ID) values (96465193071, 2625001362);
-- insert into Post_Comments (Post_ID, Comment_ID) values (45447358335, 8427731417);
-- insert into Post_Comments (Post_ID, Comment_ID) values (97880316540, 7467555329);
-- insert into Post_Comments (Post_ID, Comment_ID) values (71537039456, 8547278454);
-- insert into Post_Comments (Post_ID, Comment_ID) values (12567804993, 8295232614);
-- insert into Post_Comments (Post_ID, Comment_ID) values (10638334409, 8871341614);
-- insert into Post_Comments (Post_ID, Comment_ID) values (40393055603, 3455022464);
-- insert into Post_Comments (Post_ID, Comment_ID) values (36883921298, 9505725488);
-- insert into Post_Comments (Post_ID, Comment_ID) values (41545718639, 5246057576);
-- insert into Post_Comments (Post_ID, Comment_ID) values (59088155362, 5332830498);
-- insert into Post_Comments (Post_ID, Comment_ID) values (16909097599, 9706995065);
-- insert into Post_Comments (Post_ID, Comment_ID) values (35029896320, 1456627808);
-- insert into Post_Comments (Post_ID, Comment_ID) values (15277498596, 7818448004);
-- insert into Post_Comments (Post_ID, Comment_ID) values (14705156938, 3025353106);
-- insert into Post_Comments (Post_ID, Comment_ID) values (5084428315, 2961063919);
-- insert into Post_Comments (Post_ID, Comment_ID) values (93967706409, 7960825680);
-- insert into Post_Comments (Post_ID, Comment_ID) values (59259101825, 4272774887);
-- insert into Post_Comments (Post_ID, Comment_ID) values (39270988047, 2590870827);
-- insert into Post_Comments (Post_ID, Comment_ID) values (74588283128, 9868170559);
-- insert into Post_Comments (Post_ID, Comment_ID) values (96656461132, 3614126374);
-- insert into Post_Comments (Post_ID, Comment_ID) values (1455347359, 1442749831);
-- insert into Post_Comments (Post_ID, Comment_ID) values (58794027484, 2867041526);
-- insert into Post_Comments (Post_ID, Comment_ID) values (12798558731, 1509881805);
-- insert into Post_Comments (Post_ID, Comment_ID) values (59333298406, 4099845199);
-- insert into Post_Comments (Post_ID, Comment_ID) values (71470629690, 6701693163);
-- insert into Post_Comments (Post_ID, Comment_ID) values (89873665639, 8615498798);
-- insert into Post_Comments (Post_ID, Comment_ID) values (51889632847, 7441334263);
-- insert into Post_Comments (Post_ID, Comment_ID) values (75474700187, 6162227867);
-- insert into Post_Comments (Post_ID, Comment_ID) values (87874528903, 8204193991);
-- insert into Post_Comments (Post_ID, Comment_ID) values (45878621577, 9396523869);
-- insert into Post_Comments (Post_ID, Comment_ID) values (76309600072, 8227252415);
-- insert into Post_Comments (Post_ID, Comment_ID) values (66209285828, 5368481780);
-- insert into Post_Comments (Post_ID, Comment_ID) values (83801942864, 7110544582);
-- insert into Post_Comments (Post_ID, Comment_ID) values (64659249317, 4885728335);
-- insert into Post_Comments (Post_ID, Comment_ID) values (74367813922, 8149047965);
-- insert into Post_Comments (Post_ID, Comment_ID) values (42508092498, 5786720041);
-- insert into Post_Comments (Post_ID, Comment_ID) values (2444179864, 6448495296);
-- insert into Post_Comments (Post_ID, Comment_ID) values (29967363537, 1673524137);
-- insert into Post_Comments (Post_ID, Comment_ID) values (35597338606, 6106360618);
-- insert into Post_Comments (Post_ID, Comment_ID) values (55651255292, 2178102291);
-- insert into Post_Comments (Post_ID, Comment_ID) values (62016089862, 8510435920);
-- insert into Post_Comments (Post_ID, Comment_ID) values (46440535245, 5343947079);
-- insert into Post_Comments (Post_ID, Comment_ID) values (5407455141, 1628780339);
-- insert into Post_Comments (Post_ID, Comment_ID) values (91568921369, 7479948089);
-- insert into Post_Comments (Post_ID, Comment_ID) values (39951528418, 5727063663);
-- insert into Post_Comments (Post_ID, Comment_ID) values (65808898060, 8804899395);
-- insert into Post_Comments (Post_ID, Comment_ID) values (95358387084, 7274475236);
-- insert into Post_Comments (Post_ID, Comment_ID) values (32689277228, 8895199157);
-- insert into Post_Comments (Post_ID, Comment_ID) values (9315939215, 3408988812);
-- insert into Post_Comments (Post_ID, Comment_ID) values (66646221238, 4762972408);
-- insert into Post_Comments (Post_ID, Comment_ID) values (20768819606, 2105703857);
-- insert into Post_Comments (Post_ID, Comment_ID) values (93698450547, 4227959050);
-- insert into Post_Comments (Post_ID, Comment_ID) values (3472316163, 979601593);
-- insert into Post_Comments (Post_ID, Comment_ID) values (30651118032, 210631104);
-- insert into Post_Comments (Post_ID, Comment_ID) values (83092289734, 5668630134);
-- insert into Post_Comments (Post_ID, Comment_ID) values (32157504566, 5403899017);
-- insert into Post_Comments (Post_ID, Comment_ID) values (15980228629, 1779403926);
-- insert into Post_Comments (Post_ID, Comment_ID) values (1720599443, 4013270712);
-- insert into Post_Comments (Post_ID, Comment_ID) values (87463788797, 7266211306);
-- insert into Post_Comments (Post_ID, Comment_ID) values (40745361005, 6180317518);
-- insert into Post_Comments (Post_ID, Comment_ID) values (67820454968, 1226652390);
-- insert into Post_Comments (Post_ID, Comment_ID) values (65664538175, 6757252748);
-- insert into Post_Comments (Post_ID, Comment_ID) values (4801387297, 3131099919);
-- insert into Post_Comments (Post_ID, Comment_ID) values (17741728253, 6144372167);
-- insert into Post_Comments (Post_ID, Comment_ID) values (12738983948, 4415175925);
-- insert into Post_Comments (Post_ID, Comment_ID) values (1577015736, 8682867627);
-- insert into Post_Comments (Post_ID, Comment_ID) values (87830992921, 238744381);
-- insert into Post_Comments (Post_ID, Comment_ID) values (80290931089, 9197761804);
-- insert into Post_Comments (Post_ID, Comment_ID) values (94147208324, 4712498180);
-- insert into Post_Comments (Post_ID, Comment_ID) values (35222909554, 9783178350);
-- insert into Post_Comments (Post_ID, Comment_ID) values (33758422237, 9001365216);
-- insert into Post_Comments (Post_ID, Comment_ID) values (65107808415, 2960196907);
-- insert into Post_Comments (Post_ID, Comment_ID) values (81817460754, 843206848);
-- insert into Post_Comments (Post_ID, Comment_ID) values (89009546611, 9785728715);
-- insert into Post_Comments (Post_ID, Comment_ID) values (27421642937, 9838843390);
-- insert into Post_Comments (Post_ID, Comment_ID) values (77752830285, 6228663325);
-- insert into Post_Comments (Post_ID, Comment_ID) values (78346562289, 8822035379);
-- insert into Post_Comments (Post_ID, Comment_ID) values (87769224882, 4697464810);
-- insert into Post_Comments (Post_ID, Comment_ID) values (968822864, 2020575686);
-- insert into Post_Comments (Post_ID, Comment_ID) values (83134048447, 9294437438);
-- insert into Post_Comments (Post_ID, Comment_ID) values (30617074043, 6759996889);
-- insert into Post_Comments (Post_ID, Comment_ID) values (91548230544, 936441222);
-- insert into Post_Comments (Post_ID, Comment_ID) values (5426220639, 1766001499);
-- insert into Post_Comments (Post_ID, Comment_ID) values (86301884274, 1080417203);
-- insert into Post_Comments (Post_ID, Comment_ID) values (90363363799, 9152470583);
-- insert into Post_Comments (Post_ID, Comment_ID) values (26557864581, 9150176630);
-- insert into Post_Comments (Post_ID, Comment_ID) values (8844206590, 1526270608);
-- insert into Post_Comments (Post_ID, Comment_ID) values (53892440750, 9797002084);
-- insert into Post_Comments (Post_ID, Comment_ID) values (14832101423, 8009594766);
-- insert into Post_Comments (Post_ID, Comment_ID) values (94780587172, 3419146711);
-- insert into Post_Comments (Post_ID, Comment_ID) values (8738886098, 9196200084);
-- insert into Post_Comments (Post_ID, Comment_ID) values (27177836349, 9065997991);
-- insert into Post_Comments (Post_ID, Comment_ID) values (4417577934, 9378728904);
-- insert into Post_Comments (Post_ID, Comment_ID) values (18728649857, 3116214242);
-- insert into Post_Comments (Post_ID, Comment_ID) values (8457434062, 1132270747);
-- insert into Post_Comments (Post_ID, Comment_ID) values (99309165541, 8456140898);
-- insert into Post_Comments (Post_ID, Comment_ID) values (17304306548, 4506897917);
-- insert into Post_Comments (Post_ID, Comment_ID) values (64570026762, 7061766919);
-- insert into Post_Comments (Post_ID, Comment_ID) values (11289919274, 7843497779);
-- insert into Post_Comments (Post_ID, Comment_ID) values (55295445511, 3346441894);
-- insert into Post_Comments (Post_ID, Comment_ID) values (552400490, 6228558517);
-- insert into Post_Comments (Post_ID, Comment_ID) values (84906672520, 3142870222);
-- insert into Post_Comments (Post_ID, Comment_ID) values (83102515651, 5138267008);
-- insert into Post_Comments (Post_ID, Comment_ID) values (28299759012, 5920718333);
-- insert into Post_Comments (Post_ID, Comment_ID) values (88328492228, 7217432108);
-- insert into Post_Comments (Post_ID, Comment_ID) values (69865427046, 5276500439);
-- insert into Post_Comments (Post_ID, Comment_ID) values (22798753814, 5356600167);
-- insert into Post_Comments (Post_ID, Comment_ID) values (11625910094, 8357729994);
-- insert into Post_Comments (Post_ID, Comment_ID) values (85826341934, 6428479631);
-- insert into Post_Comments (Post_ID, Comment_ID) values (22221641079, 2733516567);
-- insert into Post_Comments (Post_ID, Comment_ID) values (22944806328, 5529628904);
-- insert into Post_Comments (Post_ID, Comment_ID) values (2659760523, 7335338486);
-- insert into Post_Comments (Post_ID, Comment_ID) values (35955161623, 9238986462);
-- insert into Post_Comments (Post_ID, Comment_ID) values (76699982835, 2260823842);
-- insert into Post_Comments (Post_ID, Comment_ID) values (22004632078, 574202919);
-- insert into Post_Comments (Post_ID, Comment_ID) values (37450754710, 3214275429);
-- insert into Post_Comments (Post_ID, Comment_ID) values (11500397192, 3989884685);
-- insert into Post_Comments (Post_ID, Comment_ID) values (45231850667, 2252734763);
-- insert into Post_Comments (Post_ID, Comment_ID) values (66582299586, 291358306);
-- insert into Post_Comments (Post_ID, Comment_ID) values (9430153660, 2161342602);
-- insert into Post_Comments (Post_ID, Comment_ID) values (32627570855, 5249830838);
-- insert into Post_Comments (Post_ID, Comment_ID) values (596558251, 2822875590);
-- insert into Post_Comments (Post_ID, Comment_ID) values (84901739288, 3095476266);
-- insert into Post_Comments (Post_ID, Comment_ID) values (72487355642, 4508352349);
-- insert into Post_Comments (Post_ID, Comment_ID) values (28938835419, 7833416558);
-- insert into Post_Comments (Post_ID, Comment_ID) values (86431147450, 4654735517);
-- insert into Post_Comments (Post_ID, Comment_ID) values (96202518356, 6749650472);
-- insert into Post_Comments (Post_ID, Comment_ID) values (66964881999, 8669581982);
-- insert into Post_Comments (Post_ID, Comment_ID) values (72578578821, 8997616102);
-- insert into Post_Comments (Post_ID, Comment_ID) values (31228853350, 1732899462);
-- insert into Post_Comments (Post_ID, Comment_ID) values (46723734590, 1923708345);
-- insert into Post_Comments (Post_ID, Comment_ID) values (96321185588, 494349313);
-- insert into Post_Comments (Post_ID, Comment_ID) values (9059037308, 8933565355);
-- insert into Post_Comments (Post_ID, Comment_ID) values (61507825905, 7032155696);
-- insert into Post_Comments (Post_ID, Comment_ID) values (51187814046, 4912698796);
-- insert into Post_Comments (Post_ID, Comment_ID) values (25083230552, 3093783962);

-- insert into Support_Posts (Post_ID, Support_ID) values (59026203787, 52248);
-- insert into Support_Posts (Post_ID, Support_ID) values (11707069860, 51850);
-- insert into Support_Posts (Post_ID, Support_ID) values (11182383523, 225);
-- insert into Support_Posts (Post_ID, Support_ID) values (24454811414, 24668);
-- insert into Support_Posts (Post_ID, Support_ID) values (56248268265, 2184);
-- insert into Support_Posts (Post_ID, Support_ID) values (66644900286, 30829);
-- insert into Support_Posts (Post_ID, Support_ID) values (31131903785, 24985);
-- insert into Support_Posts (Post_ID, Support_ID) values (12596870592, 21211);
-- insert into Support_Posts (Post_ID, Support_ID) values (77408376381, 86237);
-- insert into Support_Posts (Post_ID, Support_ID) values (1588235227, 64325);
-- insert into Support_Posts (Post_ID, Support_ID) values (96378285929, 94294);
-- insert into Support_Posts (Post_ID, Support_ID) values (54386437659, 66656);
-- insert into Support_Posts (Post_ID, Support_ID) values (87582797412, 95758);
-- insert into Support_Posts (Post_ID, Support_ID) values (97030225066, 56319);
-- insert into Support_Posts (Post_ID, Support_ID) values (35493348161, 84892);
-- insert into Support_Posts (Post_ID, Support_ID) values (31576854009, 45409);
-- insert into Support_Posts (Post_ID, Support_ID) values (94118052612, 4377);
-- insert into Support_Posts (Post_ID, Support_ID) values (15114928091, 24792);
-- insert into Support_Posts (Post_ID, Support_ID) values (57768269395, 56151);
-- insert into Support_Posts (Post_ID, Support_ID) values (32888210984, 94655);
-- insert into Support_Posts (Post_ID, Support_ID) values (68647027461, 65014);
-- insert into Support_Posts (Post_ID, Support_ID) values (2932583327, 45852);
-- insert into Support_Posts (Post_ID, Support_ID) values (5266697502, 23708);
-- insert into Support_Posts (Post_ID, Support_ID) values (77725282261, 90953);
-- insert into Support_Posts (Post_ID, Support_ID) values (85077917577, 32282);
-- insert into Support_Posts (Post_ID, Support_ID) values (4720175899, 62327);
-- insert into Support_Posts (Post_ID, Support_ID) values (5643652444, 26661);
-- insert into Support_Posts (Post_ID, Support_ID) values (84973543631, 91204);
-- insert into Support_Posts (Post_ID, Support_ID) values (18117875402, 75785);
-- insert into Support_Posts (Post_ID, Support_ID) values (69524674422, 47349);
-- insert into Support_Posts (Post_ID, Support_ID) values (66993561834, 62694);
-- insert into Support_Posts (Post_ID, Support_ID) values (8680567531, 16847);
-- insert into Support_Posts (Post_ID, Support_ID) values (46517937380, 15476);
-- insert into Support_Posts (Post_ID, Support_ID) values (66537118685, 29375);
-- insert into Support_Posts (Post_ID, Support_ID) values (80188017645, 45430);
-- insert into Support_Posts (Post_ID, Support_ID) values (80751432790, 95474);
-- insert into Support_Posts (Post_ID, Support_ID) values (89333534030, 11442);
-- insert into Support_Posts (Post_ID, Support_ID) values (32003933552, 35476);
-- insert into Support_Posts (Post_ID, Support_ID) values (74968563918, 77694);
-- insert into Support_Posts (Post_ID, Support_ID) values (42445657247, 55144);
-- insert into Support_Posts (Post_ID, Support_ID) values (80190625904, 86145);
-- insert into Support_Posts (Post_ID, Support_ID) values (76096985590, 47181);
-- insert into Support_Posts (Post_ID, Support_ID) values (5505079270, 7745);
-- insert into Support_Posts (Post_ID, Support_ID) values (96416257690, 34309);
-- insert into Support_Posts (Post_ID, Support_ID) values (48812889218, 65917);
-- insert into Support_Posts (Post_ID, Support_ID) values (8130740975, 91703);
-- insert into Support_Posts (Post_ID, Support_ID) values (84058636145, 57083);
-- insert into Support_Posts (Post_ID, Support_ID) values (92736892942, 36282);
-- insert into Support_Posts (Post_ID, Support_ID) values (41066400020, 18884);
-- insert into Support_Posts (Post_ID, Support_ID) values (36772406720, 74841);
-- insert into Support_Posts (Post_ID, Support_ID) values (15988702942, 61483);
-- insert into Support_Posts (Post_ID, Support_ID) values (73567335188, 49056);
-- insert into Support_Posts (Post_ID, Support_ID) values (87563373437, 4791);
-- insert into Support_Posts (Post_ID, Support_ID) values (31556303111, 98195);
-- insert into Support_Posts (Post_ID, Support_ID) values (14839467839, 61116);
-- insert into Support_Posts (Post_ID, Support_ID) values (19280227122, 42563);
-- insert into Support_Posts (Post_ID, Support_ID) values (71916525653, 42310);
-- insert into Support_Posts (Post_ID, Support_ID) values (20956706383, 90480);
-- insert into Support_Posts (Post_ID, Support_ID) values (24737890630, 81258);
-- insert into Support_Posts (Post_ID, Support_ID) values (90910233203, 88282);
-- insert into Support_Posts (Post_ID, Support_ID) values (62072149005, 25927);
-- insert into Support_Posts (Post_ID, Support_ID) values (4514522777, 40639);
-- insert into Support_Posts (Post_ID, Support_ID) values (34244641286, 16110);
-- insert into Support_Posts (Post_ID, Support_ID) values (39401866058, 51183);
-- insert into Support_Posts (Post_ID, Support_ID) values (78721652943, 97331);
-- insert into Support_Posts (Post_ID, Support_ID) values (30041994242, 57349);
-- insert into Support_Posts (Post_ID, Support_ID) values (97534126603, 53906);
-- insert into Support_Posts (Post_ID, Support_ID) values (29502037432, 2069);
-- insert into Support_Posts (Post_ID, Support_ID) values (59221227524, 70057);
-- insert into Support_Posts (Post_ID, Support_ID) values (81990348815, 24505);
-- insert into Support_Posts (Post_ID, Support_ID) values (74386912699, 75776);
-- insert into Support_Posts (Post_ID, Support_ID) values (13025092562, 42415);
-- insert into Support_Posts (Post_ID, Support_ID) values (6956887881, 59289);
-- insert into Support_Posts (Post_ID, Support_ID) values (68341900568, 55557);
-- insert into Support_Posts (Post_ID, Support_ID) values (39617786585, 39012);
-- insert into Support_Posts (Post_ID, Support_ID) values (82422466772, 59339);
-- insert into Support_Posts (Post_ID, Support_ID) values (81884984151, 63152);
-- insert into Support_Posts (Post_ID, Support_ID) values (68910404465, 22302);
-- insert into Support_Posts (Post_ID, Support_ID) values (71945034041, 60238);
-- insert into Support_Posts (Post_ID, Support_ID) values (89431537027, 56015);
-- insert into Support_Posts (Post_ID, Support_ID) values (27073908239, 90520);
-- insert into Support_Posts (Post_ID, Support_ID) values (13427792565, 45527);
-- insert into Support_Posts (Post_ID, Support_ID) values (83429177119, 99798);
-- insert into Support_Posts (Post_ID, Support_ID) values (85514181943, 97879);
-- insert into Support_Posts (Post_ID, Support_ID) values (94359125680, 71022);
-- insert into Support_Posts (Post_ID, Support_ID) values (7056088060, 51273);
-- insert into Support_Posts (Post_ID, Support_ID) values (92226209837, 61293);
-- insert into Support_Posts (Post_ID, Support_ID) values (81391369447, 1323);
-- insert into Support_Posts (Post_ID, Support_ID) values (19149098457, 96821);
-- insert into Support_Posts (Post_ID, Support_ID) values (33811372482, 85637);
-- insert into Support_Posts (Post_ID, Support_ID) values (18586729470, 95957);
-- insert into Support_Posts (Post_ID, Support_ID) values (94526119069, 67727);
-- insert into Support_Posts (Post_ID, Support_ID) values (12332148388, 95953);
-- insert into Support_Posts (Post_ID, Support_ID) values (5434640554, 22260);
-- insert into Support_Posts (Post_ID, Support_ID) values (5503148030, 56577);
-- insert into Support_Posts (Post_ID, Support_ID) values (15395079868, 92595);
-- insert into Support_Posts (Post_ID, Support_ID) values (627554489, 63744);
-- insert into Support_Posts (Post_ID, Support_ID) values (93267785061, 71359);
-- insert into Support_Posts (Post_ID, Support_ID) values (32478825827, 32895);
-- insert into Support_Posts (Post_ID, Support_ID) values (29283203529, 49737);
-- insert into Support_Posts (Post_ID, Support_ID) values (78097528603, 24103);
-- insert into Support_Posts (Post_ID, Support_ID) values (27257795031, 10705);
-- insert into Support_Posts (Post_ID, Support_ID) values (94894707500, 42314);
-- insert into Support_Posts (Post_ID, Support_ID) values (44745283144, 48369);
-- insert into Support_Posts (Post_ID, Support_ID) values (86032571487, 29448);
-- insert into Support_Posts (Post_ID, Support_ID) values (18527975558, 94423);
-- insert into Support_Posts (Post_ID, Support_ID) values (23123555808, 37993);
-- insert into Support_Posts (Post_ID, Support_ID) values (96386680281, 57379);
-- insert into Support_Posts (Post_ID, Support_ID) values (15505734324, 1933);
-- insert into Support_Posts (Post_ID, Support_ID) values (81402095586, 14384);
-- insert into Support_Posts (Post_ID, Support_ID) values (76281540368, 9875);
-- insert into Support_Posts (Post_ID, Support_ID) values (80868236882, 84046);
-- insert into Support_Posts (Post_ID, Support_ID) values (59782745547, 77819);
-- insert into Support_Posts (Post_ID, Support_ID) values (34572201681, 55238);
-- insert into Support_Posts (Post_ID, Support_ID) values (49977183098, 41748);
-- insert into Support_Posts (Post_ID, Support_ID) values (91133055159, 67469);
-- insert into Support_Posts (Post_ID, Support_ID) values (76356779824, 1931);
-- insert into Support_Posts (Post_ID, Support_ID) values (67811669443, 74068);
-- insert into Support_Posts (Post_ID, Support_ID) values (27418091425, 78534);
-- insert into Support_Posts (Post_ID, Support_ID) values (74857726688, 29852);
-- insert into Support_Posts (Post_ID, Support_ID) values (18291863468, 51073);
-- insert into Support_Posts (Post_ID, Support_ID) values (86166342782, 76968);
-- insert into Support_Posts (Post_ID, Support_ID) values (20261887700, 54610);
-- insert into Support_Posts (Post_ID, Support_ID) values (84427097813, 95799);
-- insert into Support_Posts (Post_ID, Support_ID) values (17068037830, 74477);
-- insert into Support_Posts (Post_ID, Support_ID) values (57235574340, 64011);
-- insert into Support_Posts (Post_ID, Support_ID) values (65364900488, 99253);
-- insert into Support_Posts (Post_ID, Support_ID) values (8318308112, 48257);
-- insert into Support_Posts (Post_ID, Support_ID) values (11275437916, 26815);
-- insert into Support_Posts (Post_ID, Support_ID) values (23527390421, 60973);
-- insert into Support_Posts (Post_ID, Support_ID) values (16359942690, 29306);
-- insert into Support_Posts (Post_ID, Support_ID) values (16564349085, 11178);
-- insert into Support_Posts (Post_ID, Support_ID) values (2674256633, 5714);
-- insert into Support_Posts (Post_ID, Support_ID) values (14522529531, 65836);
-- insert into Support_Posts (Post_ID, Support_ID) values (8648708621, 41981);
-- insert into Support_Posts (Post_ID, Support_ID) values (87178942869, 23500);
-- insert into Support_Posts (Post_ID, Support_ID) values (82274641963, 39162);
-- insert into Support_Posts (Post_ID, Support_ID) values (39203599252, 99221);
-- insert into Support_Posts (Post_ID, Support_ID) values (47352098406, 18811);
-- insert into Support_Posts (Post_ID, Support_ID) values (77244212734, 32791);
-- insert into Support_Posts (Post_ID, Support_ID) values (79064435627, 18556);
-- insert into Support_Posts (Post_ID, Support_ID) values (7582212616, 55743);
-- insert into Support_Posts (Post_ID, Support_ID) values (7652445031, 66585);
-- insert into Support_Posts (Post_ID, Support_ID) values (32459227613, 75877);
-- insert into Support_Posts (Post_ID, Support_ID) values (73815382294, 97032);
-- insert into Support_Posts (Post_ID, Support_ID) values (96561331732, 19364);
-- insert into Support_Posts (Post_ID, Support_ID) values (75001836285, 95839);
-- insert into Support_Posts (Post_ID, Support_ID) values (25693125813, 31457);
-- insert into Support_Posts (Post_ID, Support_ID) values (43537929552, 90967);
-- insert into Support_Posts (Post_ID, Support_ID) values (64206732612, 42667);
-- insert into Support_Posts (Post_ID, Support_ID) values (34695417096, 69621);
-- insert into Support_Posts (Post_ID, Support_ID) values (69711202756, 28742);
-- insert into Support_Posts (Post_ID, Support_ID) values (43923086182, 57908);
-- insert into Support_Posts (Post_ID, Support_ID) values (53437969492, 22254);
-- insert into Support_Posts (Post_ID, Support_ID) values (44031653080, 95267);
-- insert into Support_Posts (Post_ID, Support_ID) values (42529812862, 8746);
-- insert into Support_Posts (Post_ID, Support_ID) values (18369495467, 646);
-- insert into Support_Posts (Post_ID, Support_ID) values (99332808211, 26137);
-- insert into Support_Posts (Post_ID, Support_ID) values (18140275468, 63200);
-- insert into Support_Posts (Post_ID, Support_ID) values (77449563731, 40919);
-- insert into Support_Posts (Post_ID, Support_ID) values (98020175559, 88031);
-- insert into Support_Posts (Post_ID, Support_ID) values (96675263128, 95350);
-- insert into Support_Posts (Post_ID, Support_ID) values (18781775622, 9449);
-- insert into Support_Posts (Post_ID, Support_ID) values (14932125651, 89749);
-- insert into Support_Posts (Post_ID, Support_ID) values (6980829890, 45530);
-- insert into Support_Posts (Post_ID, Support_ID) values (60297878116, 88485);
-- insert into Support_Posts (Post_ID, Support_ID) values (38268073181, 87795);
-- insert into Support_Posts (Post_ID, Support_ID) values (1159781163, 89181);
-- insert into Support_Posts (Post_ID, Support_ID) values (64280996155, 34877);
-- insert into Support_Posts (Post_ID, Support_ID) values (37912921452, 88909);
-- insert into Support_Posts (Post_ID, Support_ID) values (61539589358, 8037);
-- insert into Support_Posts (Post_ID, Support_ID) values (95428672795, 12614);
-- insert into Support_Posts (Post_ID, Support_ID) values (49137764702, 98478);
-- insert into Support_Posts (Post_ID, Support_ID) values (1369627066, 63895);
-- insert into Support_Posts (Post_ID, Support_ID) values (38645064567, 58904);
-- insert into Support_Posts (Post_ID, Support_ID) values (69820633350, 90967);
-- insert into Support_Posts (Post_ID, Support_ID) values (851277844, 37216);
-- insert into Support_Posts (Post_ID, Support_ID) values (34676726705, 20063);
-- insert into Support_Posts (Post_ID, Support_ID) values (83938182132, 36443);
-- insert into Support_Posts (Post_ID, Support_ID) values (28302932062, 60289);
-- insert into Support_Posts (Post_ID, Support_ID) values (35043507937, 79429);
-- insert into Support_Posts (Post_ID, Support_ID) values (3874202706, 85165);
-- insert into Support_Posts (Post_ID, Support_ID) values (78387655654, 22986);
-- insert into Support_Posts (Post_ID, Support_ID) values (43965447500, 57667);
-- insert into Support_Posts (Post_ID, Support_ID) values (10696143751, 71910);
-- insert into Support_Posts (Post_ID, Support_ID) values (66013032381, 12092);
-- insert into Support_Posts (Post_ID, Support_ID) values (27430021120, 47907);
-- insert into Support_Posts (Post_ID, Support_ID) values (45581557447, 3152);
-- insert into Support_Posts (Post_ID, Support_ID) values (30552096780, 64300);
-- insert into Support_Posts (Post_ID, Support_ID) values (10123541284, 23796);
-- insert into Support_Posts (Post_ID, Support_ID) values (26587334329, 35825);
-- insert into Support_Posts (Post_ID, Support_ID) values (61304115534, 30156);
-- insert into Support_Posts (Post_ID, Support_ID) values (85732624406, 75541);
-- insert into Support_Posts (Post_ID, Support_ID) values (53141557819, 51428);
-- insert into Support_Posts (Post_ID, Support_ID) values (93427715003, 74617);
-- insert into Support_Posts (Post_ID, Support_ID) values (59604058015, 72627);
-- insert into Support_Posts (Post_ID, Support_ID) values (72206062307, 32013);
-- insert into Support_Posts (Post_ID, Support_ID) values (38036171828, 76922);
-- insert into Support_Posts (Post_ID, Support_ID) values (61648973253, 81811);
-- insert into Support_Posts (Post_ID, Support_ID) values (48377435678, 4756);

-- insert into Badges_Challenges (Badges, Challenges) values (17, 15);
-- insert into Badges_Challenges (Badges, Challenges) values (224, 27);
-- insert into Badges_Challenges (Badges, Challenges) values (183, 660);
-- insert into Badges_Challenges (Badges, Challenges) values (81, 908);
-- insert into Badges_Challenges (Badges, Challenges) values (73, 767);
-- insert into Badges_Challenges (Badges, Challenges) values (202, 853);
-- insert into Badges_Challenges (Badges, Challenges) values (75, 415);
-- insert into Badges_Challenges (Badges, Challenges) values (86, 262);
-- insert into Badges_Challenges (Badges, Challenges) values (63, 287);
-- insert into Badges_Challenges (Badges, Challenges) values (52, 765);
-- insert into Badges_Challenges (Badges, Challenges) values (169, 544);
-- insert into Badges_Challenges (Badges, Challenges) values (172, 891);
-- insert into Badges_Challenges (Badges, Challenges) values (164, 200);
-- insert into Badges_Challenges (Badges, Challenges) values (100, 75);
-- insert into Badges_Challenges (Badges, Challenges) values (157, 225);
-- insert into Badges_Challenges (Badges, Challenges) values (21, 581);
-- insert into Badges_Challenges (Badges, Challenges) values (110, 972);
-- insert into Badges_Challenges (Badges, Challenges) values (48, 51);
-- insert into Badges_Challenges (Badges, Challenges) values (8, 663);
-- insert into Badges_Challenges (Badges, Challenges) values (144, 470);
-- insert into Badges_Challenges (Badges, Challenges) values (88, 240);
-- insert into Badges_Challenges (Badges, Challenges) values (64, 16);
-- insert into Badges_Challenges (Badges, Challenges) values (121, 41);
-- insert into Badges_Challenges (Badges, Challenges) values (220, 785);
-- insert into Badges_Challenges (Badges, Challenges) values (47, 830);
-- insert into Badges_Challenges (Badges, Challenges) values (125, 594);
-- insert into Badges_Challenges (Badges, Challenges) values (137, 570);
-- insert into Badges_Challenges (Badges, Challenges) values (63, 254);
-- insert into Badges_Challenges (Badges, Challenges) values (243, 227);
-- insert into Badges_Challenges (Badges, Challenges) values (219, 860);
-- insert into Badges_Challenges (Badges, Challenges) values (244, 539);
-- insert into Badges_Challenges (Badges, Challenges) values (208, 654);
-- insert into Badges_Challenges (Badges, Challenges) values (110, 527);
-- insert into Badges_Challenges (Badges, Challenges) values (225, 430);
-- insert into Badges_Challenges (Badges, Challenges) values (203, 571);
-- insert into Badges_Challenges (Badges, Challenges) values (32, 175);
-- insert into Badges_Challenges (Badges, Challenges) values (55, 45);
-- insert into Badges_Challenges (Badges, Challenges) values (78, 290);
-- insert into Badges_Challenges (Badges, Challenges) values (123, 654);
-- insert into Badges_Challenges (Badges, Challenges) values (210, 999);
-- insert into Badges_Challenges (Badges, Challenges) values (22, 301);
-- insert into Badges_Challenges (Badges, Challenges) values (204, 94);
-- insert into Badges_Challenges (Badges, Challenges) values (80, 983);
-- insert into Badges_Challenges (Badges, Challenges) values (196, 690);
-- insert into Badges_Challenges (Badges, Challenges) values (125, 183);
-- insert into Badges_Challenges (Badges, Challenges) values (22, 355);
-- insert into Badges_Challenges (Badges, Challenges) values (202, 457);
-- insert into Badges_Challenges (Badges, Challenges) values (58, 843);
-- insert into Badges_Challenges (Badges, Challenges) values (34, 808);
-- insert into Badges_Challenges (Badges, Challenges) values (140, 59);
-- insert into Badges_Challenges (Badges, Challenges) values (223, 187);
-- insert into Badges_Challenges (Badges, Challenges) values (156, 56);
-- insert into Badges_Challenges (Badges, Challenges) values (191, 649);
-- insert into Badges_Challenges (Badges, Challenges) values (126, 607);
-- insert into Badges_Challenges (Badges, Challenges) values (72, 100);
-- insert into Badges_Challenges (Badges, Challenges) values (244, 303);
-- insert into Badges_Challenges (Badges, Challenges) values (57, 943);
-- insert into Badges_Challenges (Badges, Challenges) values (29, 682);
-- insert into Badges_Challenges (Badges, Challenges) values (176, 206);
-- insert into Badges_Challenges (Badges, Challenges) values (87, 740);
-- insert into Badges_Challenges (Badges, Challenges) values (6, 864);
-- insert into Badges_Challenges (Badges, Challenges) values (99, 948);
-- insert into Badges_Challenges (Badges, Challenges) values (139, 261);
-- insert into Badges_Challenges (Badges, Challenges) values (22, 303);
-- insert into Badges_Challenges (Badges, Challenges) values (148, 177);
-- insert into Badges_Challenges (Badges, Challenges) values (76, 194);
-- insert into Badges_Challenges (Badges, Challenges) values (54, 391);
-- insert into Badges_Challenges (Badges, Challenges) values (166, 66);
-- insert into Badges_Challenges (Badges, Challenges) values (64, 369);
-- insert into Badges_Challenges (Badges, Challenges) values (89, 963);
-- insert into Badges_Challenges (Badges, Challenges) values (29, 65);
-- insert into Badges_Challenges (Badges, Challenges) values (188, 537);
-- insert into Badges_Challenges (Badges, Challenges) values (127, 781);
-- insert into Badges_Challenges (Badges, Challenges) values (121, 368);
-- insert into Badges_Challenges (Badges, Challenges) values (99, 452);
-- insert into Badges_Challenges (Badges, Challenges) values (34, 74);
-- insert into Badges_Challenges (Badges, Challenges) values (105, 324);
-- insert into Badges_Challenges (Badges, Challenges) values (104, 281);
-- insert into Badges_Challenges (Badges, Challenges) values (236, 496);
-- insert into Badges_Challenges (Badges, Challenges) values (65, 865);
-- insert into Badges_Challenges (Badges, Challenges) values (20, 435);
-- insert into Badges_Challenges (Badges, Challenges) values (146, 998);
-- insert into Badges_Challenges (Badges, Challenges) values (46, 824);
-- insert into Badges_Challenges (Badges, Challenges) values (72, 999);
-- insert into Badges_Challenges (Badges, Challenges) values (92, 440);
-- insert into Badges_Challenges (Badges, Challenges) values (180, 358);
-- insert into Badges_Challenges (Badges, Challenges) values (160, 237);
-- insert into Badges_Challenges (Badges, Challenges) values (218, 423);
-- insert into Badges_Challenges (Badges, Challenges) values (169, 252);
-- insert into Badges_Challenges (Badges, Challenges) values (84, 616);
-- insert into Badges_Challenges (Badges, Challenges) values (194, 751);
-- insert into Badges_Challenges (Badges, Challenges) values (212, 274);
-- insert into Badges_Challenges (Badges, Challenges) values (137, 146);
-- insert into Badges_Challenges (Badges, Challenges) values (104, 827);
-- insert into Badges_Challenges (Badges, Challenges) values (128, 690);
-- insert into Badges_Challenges (Badges, Challenges) values (245, 920);
-- insert into Badges_Challenges (Badges, Challenges) values (109, 800);
-- insert into Badges_Challenges (Badges, Challenges) values (149, 160);
-- insert into Badges_Challenges (Badges, Challenges) values (20, 938);
-- insert into Badges_Challenges (Badges, Challenges) values (20, 737);
-- insert into Badges_Challenges (Badges, Challenges) values (33, 485);
-- insert into Badges_Challenges (Badges, Challenges) values (53, 344);
-- insert into Badges_Challenges (Badges, Challenges) values (161, 6);
-- insert into Badges_Challenges (Badges, Challenges) values (219, 101);
-- insert into Badges_Challenges (Badges, Challenges) values (58, 319);
-- insert into Badges_Challenges (Badges, Challenges) values (164, 329);
-- insert into Badges_Challenges (Badges, Challenges) values (109, 607);
-- insert into Badges_Challenges (Badges, Challenges) values (248, 813);
-- insert into Badges_Challenges (Badges, Challenges) values (203, 148);
-- insert into Badges_Challenges (Badges, Challenges) values (196, 298);
-- insert into Badges_Challenges (Badges, Challenges) values (200, 612);
-- insert into Badges_Challenges (Badges, Challenges) values (148, 729);
-- insert into Badges_Challenges (Badges, Challenges) values (115, 713);
-- insert into Badges_Challenges (Badges, Challenges) values (46, 353);
-- insert into Badges_Challenges (Badges, Challenges) values (145, 933);
-- insert into Badges_Challenges (Badges, Challenges) values (238, 838);
-- insert into Badges_Challenges (Badges, Challenges) values (189, 765);
-- insert into Badges_Challenges (Badges, Challenges) values (94, 67);
-- insert into Badges_Challenges (Badges, Challenges) values (204, 460);
-- insert into Badges_Challenges (Badges, Challenges) values (243, 849);
-- insert into Badges_Challenges (Badges, Challenges) values (200, 728);
-- insert into Badges_Challenges (Badges, Challenges) values (223, 142);
-- insert into Badges_Challenges (Badges, Challenges) values (122, 156);
-- insert into Badges_Challenges (Badges, Challenges) values (80, 770);
-- insert into Badges_Challenges (Badges, Challenges) values (33, 764);
-- insert into Badges_Challenges (Badges, Challenges) values (134, 868);
-- insert into Badges_Challenges (Badges, Challenges) values (88, 59);
-- insert into Badges_Challenges (Badges, Challenges) values (23, 253);
-- insert into Badges_Challenges (Badges, Challenges) values (189, 204);
-- insert into Badges_Challenges (Badges, Challenges) values (139, 822);
-- insert into Badges_Challenges (Badges, Challenges) values (186, 714);
-- insert into Badges_Challenges (Badges, Challenges) values (197, 327);
-- insert into Badges_Challenges (Badges, Challenges) values (35, 381);
-- insert into Badges_Challenges (Badges, Challenges) values (233, 202);
-- insert into Badges_Challenges (Badges, Challenges) values (71, 970);
-- insert into Badges_Challenges (Badges, Challenges) values (217, 743);
-- insert into Badges_Challenges (Badges, Challenges) values (227, 391);
-- insert into Badges_Challenges (Badges, Challenges) values (128, 936);
-- insert into Badges_Challenges (Badges, Challenges) values (67, 849);
-- insert into Badges_Challenges (Badges, Challenges) values (208, 779);
-- insert into Badges_Challenges (Badges, Challenges) values (150, 488);
-- insert into Badges_Challenges (Badges, Challenges) values (173, 601);
-- insert into Badges_Challenges (Badges, Challenges) values (108, 263);
-- insert into Badges_Challenges (Badges, Challenges) values (248, 503);
-- insert into Badges_Challenges (Badges, Challenges) values (181, 364);
-- insert into Badges_Challenges (Badges, Challenges) values (113, 149);
-- insert into Badges_Challenges (Badges, Challenges) values (92, 721);
-- insert into Badges_Challenges (Badges, Challenges) values (213, 804);
-- insert into Badges_Challenges (Badges, Challenges) values (163, 194);
-- insert into Badges_Challenges (Badges, Challenges) values (171, 520);
-- insert into Badges_Challenges (Badges, Challenges) values (22, 263);
-- insert into Badges_Challenges (Badges, Challenges) values (127, 93);
-- insert into Badges_Challenges (Badges, Challenges) values (67, 258);
-- insert into Badges_Challenges (Badges, Challenges) values (200, 184);
-- insert into Badges_Challenges (Badges, Challenges) values (185, 332);
-- insert into Badges_Challenges (Badges, Challenges) values (103, 918);
-- insert into Badges_Challenges (Badges, Challenges) values (204, 662);
-- insert into Badges_Challenges (Badges, Challenges) values (155, 717);
-- insert into Badges_Challenges (Badges, Challenges) values (39, 793);
-- insert into Badges_Challenges (Badges, Challenges) values (197, 880);
-- insert into Badges_Challenges (Badges, Challenges) values (71, 134);
-- insert into Badges_Challenges (Badges, Challenges) values (163, 881);
-- insert into Badges_Challenges (Badges, Challenges) values (146, 931);
-- insert into Badges_Challenges (Badges, Challenges) values (66, 135);
-- insert into Badges_Challenges (Badges, Challenges) values (75, 201);
-- insert into Badges_Challenges (Badges, Challenges) values (186, 447);
-- insert into Badges_Challenges (Badges, Challenges) values (6, 767);
-- insert into Badges_Challenges (Badges, Challenges) values (36, 193);
-- insert into Badges_Challenges (Badges, Challenges) values (72, 273);
-- insert into Badges_Challenges (Badges, Challenges) values (94, 862);
-- insert into Badges_Challenges (Badges, Challenges) values (56, 345);
-- insert into Badges_Challenges (Badges, Challenges) values (228, 107);
-- insert into Badges_Challenges (Badges, Challenges) values (60, 459);
-- insert into Badges_Challenges (Badges, Challenges) values (237, 423);
-- insert into Badges_Challenges (Badges, Challenges) values (157, 651);
-- insert into Badges_Challenges (Badges, Challenges) values (10, 586);
-- insert into Badges_Challenges (Badges, Challenges) values (174, 650);
-- insert into Badges_Challenges (Badges, Challenges) values (7, 963);
-- insert into Badges_Challenges (Badges, Challenges) values (14, 87);
-- insert into Badges_Challenges (Badges, Challenges) values (145, 245);
-- insert into Badges_Challenges (Badges, Challenges) values (150, 416);
-- insert into Badges_Challenges (Badges, Challenges) values (198, 327);
-- insert into Badges_Challenges (Badges, Challenges) values (199, 405);
-- insert into Badges_Challenges (Badges, Challenges) values (30, 440);
-- insert into Badges_Challenges (Badges, Challenges) values (207, 989);
-- insert into Badges_Challenges (Badges, Challenges) values (230, 448);
-- insert into Badges_Challenges (Badges, Challenges) values (244, 218);
-- insert into Badges_Challenges (Badges, Challenges) values (24, 585);
-- insert into Badges_Challenges (Badges, Challenges) values (165, 110);
-- insert into Badges_Challenges (Badges, Challenges) values (173, 946);
-- insert into Badges_Challenges (Badges, Challenges) values (237, 698);
-- insert into Badges_Challenges (Badges, Challenges) values (189, 601);
-- insert into Badges_Challenges (Badges, Challenges) values (78, 786);
-- insert into Badges_Challenges (Badges, Challenges) values (166, 690);
-- insert into Badges_Challenges (Badges, Challenges) values (142, 216);
-- insert into Badges_Challenges (Badges, Challenges) values (131, 59);
-- insert into Badges_Challenges (Badges, Challenges) values (204, 783);
-- insert into Badges_Challenges (Badges, Challenges) values (62, 353);
-- insert into Badges_Challenges (Badges, Challenges) values (77, 340);
-- insert into Badges_Challenges (Badges, Challenges) values (165, 331);

-- insert into Completed_Challenge (User_ID, Challenge_ID) values (81563512, 498);
-- insert into Completed_Challenge (User_ID, Challenge_ID) values (60886027, 316);
-- insert into Completed_Challenge (User_ID, Challenge_ID) values (71913558, 855);
-- insert into Completed_Challenge (User_ID, Challenge_ID) values (41355253, 667);
-- insert into Completed_Challenge (User_ID, Challenge_ID) values (11062739, 148);
-- insert into Completed_Challenge (User_ID, Challenge_ID) values (76288696, 966);
-- insert into Completed_Challenge (User_ID, Challenge_ID) values (69790957, 447);
-- insert into Completed_Challenge (User_ID, Challenge_ID) values (16062699, 65);
-- insert into Completed_Challenge (User_ID, Challenge_ID) values (8610110, 833);
-- insert into Completed_Challenge (User_ID, Challenge_ID) values (15577767, 304);
-- insert into Completed_Challenge (User_ID, Challenge_ID) values (56514682, 670);
-- insert into Completed_Challenge (User_ID, Challenge_ID) values (67917818, 125);
-- insert into Completed_Challenge (User_ID, Challenge_ID) values (98106790, 595);
-- insert into Completed_Challenge (User_ID, Challenge_ID) values (58105570, 59);
-- insert into Completed_Challenge (User_ID, Challenge_ID) values (4242847, 67);
-- insert into Completed_Challenge (User_ID, Challenge_ID) values (36025292, 455);
-- insert into Completed_Challenge (User_ID, Challenge_ID) values (25863793, 271);
-- insert into Completed_Challenge (User_ID, Challenge_ID) values (5174030, 590);
-- insert into Completed_Challenge (User_ID, Challenge_ID) values (13949549, 520);
-- insert into Completed_Challenge (User_ID, Challenge_ID) values (9848540, 974);
-- insert into Completed_Challenge (User_ID, Challenge_ID) values (18672041, 207);
-- insert into Completed_Challenge (User_ID, Challenge_ID) values (55146652, 134);
-- insert into Completed_Challenge (User_ID, Challenge_ID) values (67265694, 765);
-- insert into Completed_Challenge (User_ID, Challenge_ID) values (91414961, 762);
-- insert into Completed_Challenge (User_ID, Challenge_ID) values (71587852, 381);
-- insert into Completed_Challenge (User_ID, Challenge_ID) values (68176888, 813);
-- insert into Completed_Challenge (User_ID, Challenge_ID) values (85011638, 764);
-- insert into Completed_Challenge (User_ID, Challenge_ID) values (36529515, 57);
-- insert into Completed_Challenge (User_ID, Challenge_ID) values (26130615, 948);
-- insert into Completed_Challenge (User_ID, Challenge_ID) values (65763787, 314);
-- insert into Completed_Challenge (User_ID, Challenge_ID) values (15272035, 719);
-- insert into Completed_Challenge (User_ID, Challenge_ID) values (9361535, 443);
-- insert into Completed_Challenge (User_ID, Challenge_ID) values (92061268, 705);
-- insert into Completed_Challenge (User_ID, Challenge_ID) values (22821695, 551);
-- insert into Completed_Challenge (User_ID, Challenge_ID) values (11057461, 529);
-- insert into Completed_Challenge (User_ID, Challenge_ID) values (47964097, 142);
-- insert into Completed_Challenge (User_ID, Challenge_ID) values (9089922, 607);
-- insert into Completed_Challenge (User_ID, Challenge_ID) values (52474430, 662);
-- insert into Completed_Challenge (User_ID, Challenge_ID) values (90964031, 126);
-- insert into Completed_Challenge (User_ID, Challenge_ID) values (9005091, 921);
-- insert into Completed_Challenge (User_ID, Challenge_ID) values (92289820, 766);
-- insert into Completed_Challenge (User_ID, Challenge_ID) values (98635046, 425);
-- insert into Completed_Challenge (User_ID, Challenge_ID) values (66364825, 556);
-- insert into Completed_Challenge (User_ID, Challenge_ID) values (94239489, 874);
-- insert into Completed_Challenge (User_ID, Challenge_ID) values (92731083, 396);
-- insert into Completed_Challenge (User_ID, Challenge_ID) values (59933061, 585);
-- insert into Completed_Challenge (User_ID, Challenge_ID) values (1962745, 774);
-- insert into Completed_Challenge (User_ID, Challenge_ID) values (9709072, 742);
-- insert into Completed_Challenge (User_ID, Challenge_ID) values (44568212, 198);
-- insert into Completed_Challenge (User_ID, Challenge_ID) values (17269101, 989);
-- insert into Completed_Challenge (User_ID, Challenge_ID) values (9641492, 219);
-- insert into Completed_Challenge (User_ID, Challenge_ID) values (65726, 52);
-- insert into Completed_Challenge (User_ID, Challenge_ID) values (11934635, 207);
-- insert into Completed_Challenge (User_ID, Challenge_ID) values (59060108, 499);
-- insert into Completed_Challenge (User_ID, Challenge_ID) values (83239819, 426);
-- insert into Completed_Challenge (User_ID, Challenge_ID) values (33866214, 15);
-- insert into Completed_Challenge (User_ID, Challenge_ID) values (55419448, 699);
-- insert into Completed_Challenge (User_ID, Challenge_ID) values (55077650, 151);
-- insert into Completed_Challenge (User_ID, Challenge_ID) values (95153589, 811);
-- insert into Completed_Challenge (User_ID, Challenge_ID) values (66745176, 556);
-- insert into Completed_Challenge (User_ID, Challenge_ID) values (64300049, 481);
-- insert into Completed_Challenge (User_ID, Challenge_ID) values (94005019, 691);
-- insert into Completed_Challenge (User_ID, Challenge_ID) values (94055196, 897);
-- insert into Completed_Challenge (User_ID, Challenge_ID) values (32989622, 822);
-- insert into Completed_Challenge (User_ID, Challenge_ID) values (724829, 949);
-- insert into Completed_Challenge (User_ID, Challenge_ID) values (50264629, 674);
-- insert into Completed_Challenge (User_ID, Challenge_ID) values (46516790, 619);
-- insert into Completed_Challenge (User_ID, Challenge_ID) values (14837359, 391);
-- insert into Completed_Challenge (User_ID, Challenge_ID) values (61700456, 69);
-- insert into Completed_Challenge (User_ID, Challenge_ID) values (95560503, 336);
-- insert into Completed_Challenge (User_ID, Challenge_ID) values (94195946, 762);
-- insert into Completed_Challenge (User_ID, Challenge_ID) values (80420104, 421);
-- insert into Completed_Challenge (User_ID, Challenge_ID) values (47099564, 716);
-- insert into Completed_Challenge (User_ID, Challenge_ID) values (60618701, 633);
-- insert into Completed_Challenge (User_ID, Challenge_ID) values (48084807, 836);
-- insert into Completed_Challenge (User_ID, Challenge_ID) values (34445487, 926);
-- insert into Completed_Challenge (User_ID, Challenge_ID) values (19024111, 417);
-- insert into Completed_Challenge (User_ID, Challenge_ID) values (53646638, 573);
-- insert into Completed_Challenge (User_ID, Challenge_ID) values (22150119, 563);
-- insert into Completed_Challenge (User_ID, Challenge_ID) values (12961248, 71);
-- insert into Completed_Challenge (User_ID, Challenge_ID) values (73997948, 452);
-- insert into Completed_Challenge (User_ID, Challenge_ID) values (9408862, 594);
-- insert into Completed_Challenge (User_ID, Challenge_ID) values (30281649, 464);
-- insert into Completed_Challenge (User_ID, Challenge_ID) values (45812000, 250);
-- insert into Completed_Challenge (User_ID, Challenge_ID) values (97237286, 698);
-- insert into Completed_Challenge (User_ID, Challenge_ID) values (45609874, 984);
-- insert into Completed_Challenge (User_ID, Challenge_ID) values (37760759, 497);
-- insert into Completed_Challenge (User_ID, Challenge_ID) values (8768899, 801);
-- insert into Completed_Challenge (User_ID, Challenge_ID) values (21708384, 880);
-- insert into Completed_Challenge (User_ID, Challenge_ID) values (83902640, 25);
-- insert into Completed_Challenge (User_ID, Challenge_ID) values (14803975, 424);
-- insert into Completed_Challenge (User_ID, Challenge_ID) values (59121214, 888);
-- insert into Completed_Challenge (User_ID, Challenge_ID) values (42773563, 725);
-- insert into Completed_Challenge (User_ID, Challenge_ID) values (21131199, 319);
-- insert into Completed_Challenge (User_ID, Challenge_ID) values (35007931, 493);
-- insert into Completed_Challenge (User_ID, Challenge_ID) values (72569976, 497);
-- insert into Completed_Challenge (User_ID, Challenge_ID) values (38731385, 453);
-- insert into Completed_Challenge (User_ID, Challenge_ID) values (2126490, 208);
-- insert into Completed_Challenge (User_ID, Challenge_ID) values (50698527, 421);
-- insert into Completed_Challenge (User_ID, Challenge_ID) values (13145323, 567);
-- insert into Completed_Challenge (User_ID, Challenge_ID) values (78024116, 39);
-- insert into Completed_Challenge (User_ID, Challenge_ID) values (91046180, 583);
-- insert into Completed_Challenge (User_ID, Challenge_ID) values (19355860, 912);
-- insert into Completed_Challenge (User_ID, Challenge_ID) values (3532527, 924);
-- insert into Completed_Challenge (User_ID, Challenge_ID) values (28337029, 514);
-- insert into Completed_Challenge (User_ID, Challenge_ID) values (39477782, 127);
-- insert into Completed_Challenge (User_ID, Challenge_ID) values (98191242, 544);
-- insert into Completed_Challenge (User_ID, Challenge_ID) values (85891105, 810);
-- insert into Completed_Challenge (User_ID, Challenge_ID) values (79471051, 137);
-- insert into Completed_Challenge (User_ID, Challenge_ID) values (15216927, 894);
-- insert into Completed_Challenge (User_ID, Challenge_ID) values (10203553, 506);
-- insert into Completed_Challenge (User_ID, Challenge_ID) values (31162839, 74);
-- insert into Completed_Challenge (User_ID, Challenge_ID) values (21441775, 379);
-- insert into Completed_Challenge (User_ID, Challenge_ID) values (63744414, 509);
-- insert into Completed_Challenge (User_ID, Challenge_ID) values (1210642, 610);
-- insert into Completed_Challenge (User_ID, Challenge_ID) values (83739200, 682);
-- insert into Completed_Challenge (User_ID, Challenge_ID) values (28237686, 132);
-- insert into Completed_Challenge (User_ID, Challenge_ID) values (69937789, 760);
-- insert into Completed_Challenge (User_ID, Challenge_ID) values (11192793, 349);
-- insert into Completed_Challenge (User_ID, Challenge_ID) values (12852397, 822);
-- insert into Completed_Challenge (User_ID, Challenge_ID) values (64424996, 19);
-- insert into Completed_Challenge (User_ID, Challenge_ID) values (57845041, 919);
-- insert into Completed_Challenge (User_ID, Challenge_ID) values (57832185, 466);
-- insert into Completed_Challenge (User_ID, Challenge_ID) values (62025643, 57);
-- insert into Completed_Challenge (User_ID, Challenge_ID) values (14067080, 120);
-- insert into Completed_Challenge (User_ID, Challenge_ID) values (23105881, 34);
-- insert into Completed_Challenge (User_ID, Challenge_ID) values (2500215, 690);
-- insert into Completed_Challenge (User_ID, Challenge_ID) values (87519263, 408);
-- insert into Completed_Challenge (User_ID, Challenge_ID) values (78679676, 598);
-- insert into Completed_Challenge (User_ID, Challenge_ID) values (2526416, 808);
-- insert into Completed_Challenge (User_ID, Challenge_ID) values (47265856, 174);
-- insert into Completed_Challenge (User_ID, Challenge_ID) values (12993103, 952);
-- insert into Completed_Challenge (User_ID, Challenge_ID) values (17487676, 291);
-- insert into Completed_Challenge (User_ID, Challenge_ID) values (48199967, 768);
-- insert into Completed_Challenge (User_ID, Challenge_ID) values (73794911, 185);
-- insert into Completed_Challenge (User_ID, Challenge_ID) values (4540004, 342);
-- insert into Completed_Challenge (User_ID, Challenge_ID) values (43028894, 135);
-- insert into Completed_Challenge (User_ID, Challenge_ID) values (37300985, 722);
-- insert into Completed_Challenge (User_ID, Challenge_ID) values (80626938, 663);
-- insert into Completed_Challenge (User_ID, Challenge_ID) values (71191478, 558);
-- insert into Completed_Challenge (User_ID, Challenge_ID) values (64886710, 201);
-- insert into Completed_Challenge (User_ID, Challenge_ID) values (12043009, 626);
-- insert into Completed_Challenge (User_ID, Challenge_ID) values (85794184, 562);
-- insert into Completed_Challenge (User_ID, Challenge_ID) values (57363128, 873);
-- insert into Completed_Challenge (User_ID, Challenge_ID) values (72168198, 684);
-- insert into Completed_Challenge (User_ID, Challenge_ID) values (48444542, 338);
-- insert into Completed_Challenge (User_ID, Challenge_ID) values (16745341, 762);
-- insert into Completed_Challenge (User_ID, Challenge_ID) values (43290521, 49);
-- insert into Completed_Challenge (User_ID, Challenge_ID) values (24497785, 871);
-- insert into Completed_Challenge (User_ID, Challenge_ID) values (37991581, 484);
-- insert into Completed_Challenge (User_ID, Challenge_ID) values (48415116, 949);
-- insert into Completed_Challenge (User_ID, Challenge_ID) values (98492211, 113);
-- insert into Completed_Challenge (User_ID, Challenge_ID) values (97004004, 557);
-- insert into Completed_Challenge (User_ID, Challenge_ID) values (86252131, 528);
-- insert into Completed_Challenge (User_ID, Challenge_ID) values (61744606, 412);
-- insert into Completed_Challenge (User_ID, Challenge_ID) values (13599745, 808);
-- insert into Completed_Challenge (User_ID, Challenge_ID) values (27138611, 521);
-- insert into Completed_Challenge (User_ID, Challenge_ID) values (2148846, 652);
-- insert into Completed_Challenge (User_ID, Challenge_ID) values (94386548, 970);
-- insert into Completed_Challenge (User_ID, Challenge_ID) values (64724866, 476);
-- insert into Completed_Challenge (User_ID, Challenge_ID) values (51134879, 340);
-- insert into Completed_Challenge (User_ID, Challenge_ID) values (31865000, 98);
-- insert into Completed_Challenge (User_ID, Challenge_ID) values (63303404, 400);
-- insert into Completed_Challenge (User_ID, Challenge_ID) values (15048601, 39);
-- insert into Completed_Challenge (User_ID, Challenge_ID) values (22019513, 178);
-- insert into Completed_Challenge (User_ID, Challenge_ID) values (16658280, 856);
-- insert into Completed_Challenge (User_ID, Challenge_ID) values (20283164, 939);
-- insert into Completed_Challenge (User_ID, Challenge_ID) values (64890679, 809);
-- insert into Completed_Challenge (User_ID, Challenge_ID) values (40953015, 566);
-- insert into Completed_Challenge (User_ID, Challenge_ID) values (15420528, 841);
-- insert into Completed_Challenge (User_ID, Challenge_ID) values (55653943, 139);
-- insert into Completed_Challenge (User_ID, Challenge_ID) values (45845973, 980);
-- insert into Completed_Challenge (User_ID, Challenge_ID) values (73385022, 531);
-- insert into Completed_Challenge (User_ID, Challenge_ID) values (83019372, 916);
-- insert into Completed_Challenge (User_ID, Challenge_ID) values (56983294, 515);
-- insert into Completed_Challenge (User_ID, Challenge_ID) values (38064934, 562);
-- insert into Completed_Challenge (User_ID, Challenge_ID) values (23808165, 787);
-- insert into Completed_Challenge (User_ID, Challenge_ID) values (77548241, 156);
-- insert into Completed_Challenge (User_ID, Challenge_ID) values (11272117, 421);
-- insert into Completed_Challenge (User_ID, Challenge_ID) values (97396178, 833);
-- insert into Completed_Challenge (User_ID, Challenge_ID) values (86775944, 324);
-- insert into Completed_Challenge (User_ID, Challenge_ID) values (3979030, 891);
-- insert into Completed_Challenge (User_ID, Challenge_ID) values (28138043, 206);
-- insert into Completed_Challenge (User_ID, Challenge_ID) values (81913201, 581);
-- insert into Completed_Challenge (User_ID, Challenge_ID) values (35467589, 863);
-- insert into Completed_Challenge (User_ID, Challenge_ID) values (86897741, 454);
-- insert into Completed_Challenge (User_ID, Challenge_ID) values (5938110, 204);
-- insert into Completed_Challenge (User_ID, Challenge_ID) values (5779887, 947);
-- insert into Completed_Challenge (User_ID, Challenge_ID) values (62090827, 144);
-- insert into Completed_Challenge (User_ID, Challenge_ID) values (74667386, 639);
-- insert into Completed_Challenge (User_ID, Challenge_ID) values (31195030, 345);
-- insert into Completed_Challenge (User_ID, Challenge_ID) values (83616211, 484);
-- insert into Completed_Challenge (User_ID, Challenge_ID) values (13828934, 236);
-- insert into Completed_Challenge (User_ID, Challenge_ID) values (21376794, 226);
-- insert into Completed_Challenge (User_ID, Challenge_ID) values (45429074, 37);
-- insert into Completed_Challenge (User_ID, Challenge_ID) values (61757288, 887);
-- insert into Completed_Challenge (User_ID, Challenge_ID) values (54522347, 920);
-- insert into Completed_Challenge (User_ID, Challenge_ID) values (45311461, 586);
-- insert into Completed_Challenge (User_ID, Challenge_ID) values (16109910, 893);
-- insert into Completed_Challenge (User_ID, Challenge_ID) values (32114139, 770);

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE=`TRADITIONAL,ALLOW_INVALID_DATES`;

CREATE DATABASE IF NOT EXISTS nosmoke;
grant all privileges on nosmoke.* to 'webapp'@'%';
flush privileges;
 
use nosmoke;
-- DROP SCHEMA IF EXISTS `nosmoke` ;
-- CREATE SCHEMA IF NOT EXISTS `nosmoke` DEFAULT CHARACTER SET latin1 ;
-- USE `nosmoke` ;

-- -----------------------------------------------------
-- Table `nosmoke`.`users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `nosmoke`.`users` (
  `user_id` INT(11) NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(255) NULL DEFAULT NULL,
  `age` INT(11) NULL DEFAULT NULL,
  `economic_status` VARCHAR(60) NULL DEFAULT NULL,
  `health` VARCHAR(60) NULL DEFAULT NULL,
  `years_vaping` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `name` (`name` ASC),
  INDEX `years_vaping` (`years_vaping` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `nosmoke`.`badges`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `nosmoke`.`badges` (
  `badge_id` INT(11) NOT NULL AUTO_INCREMENT,
  `username` TEXT NULL DEFAULT NULL,
  `details` TEXT NULL DEFAULT NULL,
  PRIMARY KEY (`badge_id`),
  INDEX `name` (`city` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `nosmoke`.`challenges`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `nosmoke`.`challenges` (
  `challenge_id` INT(11) NOT NULL AUTO_INCREMENT,
  `levels` INT(11) NULL DEFAULT NULL,
  `user_id` INT(11) NOT NULL,
  `badges` VARCHAR(255) NULL DEFAULT NULL,
  `begin_date` DATE NULL DEFAULT NULL,
  `end_date` DATE NULL DEFAULT NULL,
  PRIMARY KEY (`challenge_id`),
  INDEX `levels` (`levels` ASC),
  INDEX `end_date` (`end_date` DESC),
  CONSTRAINT `fk_challenges`
    FOREIGN KEY (`user_id`)
    REFERENCES `nosmoke`.`users` (`user_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `nosmoke`.`education`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `nosmoke`.`education` (
  `resource_id` INT(11) NOT NULL AUTO_INCREMENT,
  `user_id` INT(11) NOT NULL,
  `articles` TEXT NULL DEFAULT NULL,
  `videos` TEXT NULL DEFAULT NULL,
  `figures` TEXT NULL DEFAULT NULL,
  PRIMARY KEY (`employee_id`),
  CONSTRAINT `fk_education`
    FOREIGN KEY (`user_id`)
    REFERENCES `nosmoke`.`users` (`user_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `nosmoke`.`savings`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `nosmoke`.`savings` (
  `savings_id` INT(11) NOT NULL AUTO_INCREMENT,
  `user_id` INT(11) NOT NULL,
  `amount` DECIMAL(10, 2) NULL DEFAULT NULL,
  `curr_date` DATE NULL DEFAULT NULL,
  PRIMARY KEY (`savings_id`),
  INDEX `curr_date` (`curr_date` DESC),
  CONSTRAINT `fk_savings`
    FOREIGN KEY (`user_id`)
    REFERENCES `nosmoke`.`users` (`user_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `nosmoke`.`social_support`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `nosmoke`.`social_support` (
  `support_id` INT(11) NOT NULL AUTO_INCREMENT,
  `user_id` INT(11) NOT NULL,
  `content` TEXT NULL DEFAULT NULL,
  `interactions` TEXT NULL DEFAULT NULL,
  `posts` TEXT NULL DEFAULT NULL,
  PRIMARY KEY (`support_id`),
  CONSTRAINT `fk_social_support`
    FOREIGN KEY (`user_id`)
    REFERENCES `nosmoke`.`users` (`user_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `nosmoke`.`posts`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `nosmoke`.`posts` (
  `post_id` INT(11) NOT NULL AUTO_INCREMENT,
  `support_id` INT(11) NOT NULL,
  `user_id` INT(11) NOT NULL,
  `interactions` TEXT NULL DEFAULT NULL,
  `content` TEXT NULL DEFAULT NULL,
  `curr_date` DATE NULL DEFAULT NULL,
  PRIMARY KEY (`post_id`),
  INDEX `curr_date` (`curr_date` DESC),
  CONSTRAINT `fk_posts_user`
    FOREIGN KEY (`user_id`)
    REFERENCES `nosmoke`.`users` (`user_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_posts_support`
    FOREIGN KEY (`support_id`)
    REFERENCES `nosmoke`.`social_support` (`support_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `nosmoke`.`comments`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `nosmoke`.`comments` (
  `comment_id` INT(11) NOT NULL AUTO_INCREMENT,
  `post_id` INT(11) NOT NULL,
  `user_id` INT(11) NOT NULL,
  `content` TEXT NULL DEFAULT NULL,
  `curr_date` DATE NULL DEFAULT NULL,
  PRIMARY KEY (`comment_id`),
  INDEX `curr_date` (`curr_date` DESC),
  CONSTRAINT `fk_comments_user`
    FOREIGN KEY (`user_id`)
    REFERENCES `nosmoke`.`users` (`user_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_comments_post`
    FOREIGN KEY (`post_id`)
    REFERENCES `nosmoke`.`posts` (`post_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `nosmoke`.`user_badges`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `nosmoke`.`user_badges` (
  `user_id` INT(11) NOT NULL,
  `badge_id` INT(11) NOT NULL,
  `earned_date` DATE NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`, `badge_id`),
  INDEX `curr_date` (`curr_date` DESC),
  CONSTRAINT `fk_user_badges_user`
    FOREIGN KEY (`user_id`)
    REFERENCES `nosmoke`.`users` (`user_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_user_badges_badge`
    FOREIGN KEY (`badge_id`)
    REFERENCES `nosmoke`.`badges` (`badge_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `nosmoke`.`user_challenges`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `nosmoke`.`user_challenges` (
  `user_id` INT(11) NOT NULL,
  `challenge_id` INT(11) NOT NULL,
  `progress` FLOAT NULL DEFAULT NULL,
  `completion` VARCHAR(50),
  PRIMARY KEY (`user_id`, `challenge_id`),
  CONSTRAINT `fk_user_challenges_user`
    FOREIGN KEY (`user_id`)
    REFERENCES `nosmoke`.`users` (`user_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_user_challenges_challenge`
    FOREIGN KEY (`challenge_id`)
    REFERENCES `nosmoke`.`challenges` (`challenge_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `nosmoke`.`user_education`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `nosmoke`.`user_education` (
  `user_id` INT(11) NOT NULL,
  `resource_id` INT(11) NOT NULL,
  PRIMARY KEY (`user_id`, `resource_id`),
  CONSTRAINT `fk_user_education_user`
    FOREIGN KEY (`user_id`)
    REFERENCES `nosmoke`.`users` (`user_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_user_education_resource`
    FOREIGN KEY (`resource_id`)
    REFERENCES `nosmoke`.`education` (`resource_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

-- -----------------------------------------------------
-- Table `nosmoke`.`user_support`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `nosmoke`.`user_support` (
  `user_id` INT(11) NOT NULL,
  `support_id` INT(11) NOT NULL,
  PRIMARY KEY (`user_id`, `support_id`),
  CONSTRAINT `fk_user_support_user`
    FOREIGN KEY (`user_id`)
    REFERENCES `nosmoke`.`users` (`user_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_user_support_support`
    FOREIGN KEY (`support_id`)
    REFERENCES `nosmoke`.`social_support` (`support_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

-- -----------------------------------------------------
-- Table `nosmoke`.`post_comments`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `nosmoke`.`post_comments` (
  `post_id` INT(11) NOT NULL,
  `comment_id` INT(11) NOT NULL,
  PRIMARY KEY (`user_id`, `comment_id`),
  CONSTRAINT `fk_post_comments_post`
    FOREIGN KEY (`post_id`)
    REFERENCES `nosmoke`.`posts` (`post_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_post_comments_comment`
    FOREIGN KEY (`comment_id`)
    REFERENCES `nosmoke`.`comments` (`comment_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

-- -----------------------------------------------------
-- Table `nosmoke`.`support_posts`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `nosmoke`.`support_posts` (
  `post_id` INT(11) NOT NULL,
  `support_id` INT(11) NOT NULL,
  PRIMARY KEY (`user_id`, `support_id`),
  CONSTRAINT `fk_support_posts_post`
    FOREIGN KEY (`post_id`)
    REFERENCES `nosmoke`.`posts` (`post_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_support_posts_support`
    FOREIGN KEY (`support_id`)
    REFERENCES `nosmoke`.`social_support` (`support_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

-- -----------------------------------------------------
-- Table `nosmoke`.`badges_challenges`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `nosmoke`.`badges_challenges` (
  `badge_id` INT(11) NOT NULL,
  `challenge_id` INT(11) NOT NULL,
  PRIMARY KEY (`badge_id`, `challenge_id`),
  CONSTRAINT `fk_badges_challenges_badges`
    FOREIGN KEY (`badge_id`)
    REFERENCES `nosmoke`.`badges` (`badge_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_badges_challenges_challenges`
    FOREIGN KEY (`challenge_id`)
    REFERENCES `nosmoke`.`challenges` (`challenge_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

-- -----------------------------------------------------
-- Table `nosmoke`.`completed_challenge`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `nosmoke`.`completed_challenge` (
  `user_id` INT(11) NOT NULL,
  `challenge_id` INT(11) NOT NULL,
  PRIMARY KEY (`user_id`, `challenge_id`),
  CONSTRAINT `fk_completed_challenge_user`
    FOREIGN KEY (`user_id`)
    REFERENCES `nosmoke`.`users` (`user_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_completed_challenge_challenge`
    FOREIGN KEY (`challenge_id`)
    REFERENCES `nosmoke`.`challenges` (`challenge_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

-- -----------------------------------------------------
-- Table `nosmoke`.`suppliers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `nosmoke`.`suppliers` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `company` VARCHAR(50) NULL DEFAULT NULL,
  `last_name` VARCHAR(50) NULL DEFAULT NULL,
  `first_name` VARCHAR(50) NULL DEFAULT NULL,
  `email_address` VARCHAR(50) NULL DEFAULT NULL,
  `job_title` VARCHAR(50) NULL DEFAULT NULL,
  `business_phone` VARCHAR(25) NULL DEFAULT NULL,
  `home_phone` VARCHAR(25) NULL DEFAULT NULL,
  `mobile_phone` VARCHAR(25) NULL DEFAULT NULL,
  `fax_number` VARCHAR(25) NULL DEFAULT NULL,
  `address` LONGTEXT NULL DEFAULT NULL,
  `city` VARCHAR(50) NULL DEFAULT NULL,
  `state_province` VARCHAR(50) NULL DEFAULT NULL,
  `zip_postal_code` VARCHAR(15) NULL DEFAULT NULL,
  `country_region` VARCHAR(50) NULL DEFAULT NULL,
  `web_page` LONGTEXT NULL DEFAULT NULL,
  `notes` LONGTEXT NULL DEFAULT NULL,
  `attachments` LONGBLOB NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `city` (`city` ASC),
  INDEX `company` (`company` ASC),
  INDEX `first_name` (`first_name` ASC),
  INDEX `last_name` (`last_name` ASC),
  INDEX `zip_postal_code` (`zip_postal_code` ASC),
  INDEX `state_province` (`state_province` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;