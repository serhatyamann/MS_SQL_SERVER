USE master
GO
IF db_id('BlogDB') IS NULL 
    CREATE DATABASE BlogDB
GO

USE BlogDB

CREATE TABLE tbUsers ( 
	ID int Identity(1,1) PRIMARY KEY,
	FullName nvarchar(50) NOT NULL,
	BirthDate datetime NOT NULL,
	EMail nvarchar(50) NOT NULL
); 

CREATE TABLE tbAuthors ( 
	ID int Identity(1,1) PRIMARY KEY,
	FullName nvarchar(50) NOT NULL,
	BirthDate datetime NOT NULL,
	EMail nvarchar(50) NOT NULL
); 

CREATE TABLE tbTitles (
	ID int Identity(1,1) PRIMARY KEY,
	Title nvarchar(50) NOT NULL
);

CREATE TABLE tbSubTitles (
	ID int Identity(1,1) PRIMARY KEY,
	TitleID int NOT NULL,
	SubTitle nvarchar(50) NOT NULL,
	FOREIGN KEY (TitleID) REFERENCES tbTitles (ID)
);

CREATE TABLE tbArticles (
	ID int Identity(1,1) PRIMARY KEY,
	TitleID int NOT NULL,
	SubTitleID int NOT NULL,
	AuthorID int NOT NULL,
	ArticleCaption nvarchar(250),
	ArticleContent nvarchar(MAX),
	FOREIGN KEY (TitleID) REFERENCES tbTitles (ID),
	FOREIGN KEY (SubTitleID) REFERENCES tbSubTitles (ID),
	FOREIGN KEY (AuthorID) REFERENCES tbAuthors (ID)
);

CREATE TABLE tbUserLikedTitles(
	ID int Identity(1,1) PRIMARY KEY,
	UserID int NOT NULL,
	TitleID int NOT NULL,
	SubTitleID int NOT NULL,
	FOREIGN KEY (UserID) REFERENCES tbUsers (ID),
	FOREIGN KEY (TitleID) REFERENCES tbTitles (ID),
	FOREIGN KEY (SubTitleID) REFERENCES tbSubTitles (ID),
);



