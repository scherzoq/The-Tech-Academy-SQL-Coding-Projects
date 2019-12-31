/* CREATE DATABASE AND TABLES */

CREATE DATABASE db_Library

CREATE TABLE tbl_Library_Branch(
	BranchID INT PRIMARY KEY NOT NULL IDENTITY(1, 1),
	BranchName VARCHAR(50) NOT NULL,
	Address VARCHAR(75) NOT NULL
);

CREATE TABLE tbl_Publisher(
	PublisherName VARCHAR(50) PRIMARY KEY NOT NULL,
	Address VARCHAR(75),
	Phone VARCHAR(20),
);

CREATE TABLE tbl_Books(
	BookID INT PRIMARY KEY NOT NULL IDENTITY(1, 1),
	Title VARCHAR(100) NOT NULL,
	PublisherName VARCHAR(50) NOT NULL FOREIGN KEY REFERENCES tbl_Publisher(PublisherName) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE tbl_Borrower(
	CardNo INT PRIMARY KEY NOT NULL IDENTITY (100000, 1),
	Name VARCHAR(50) NOT NULL,
	Address VARCHAR(75) NOT NULL,
	Phone VARCHAR(20) NOT NULL
);

CREATE TABLE tbl_Book_Authors(
	BookID INT NOT NULL FOREIGN KEY REFERENCES tbl_Books(BookID) ON UPDATE CASCADE ON DELETE CASCADE,
	AuthorName VARCHAR(50) NOT NULL
);

CREATE TABLE tbl_Book_Copies(
	BookID INT NOT NULL FOREIGN KEY REFERENCES tbl_Books(BookID) ON UPDATE CASCADE ON DELETE CASCADE,
	BranchID INT NOT NULL FOREIGN KEY REFERENCES tbl_Library_Branch(BranchID) ON UPDATE CASCADE ON DELETE CASCADE,
	Number_Of_Copies INT NOT NULL,
);

CREATE TABLE tbl_Book_Loans(
	BookID INT NOT NULL FOREIGN KEY REFERENCES tbl_Books(BookID) ON UPDATE CASCADE ON DELETE CASCADE,
	BranchID INT NOT NULL FOREIGN KEY REFERENCES tbl_Library_Branch(BranchID) ON UPDATE CASCADE ON DELETE CASCADE,
	CardNo INT NOT NULL FOREIGN KEY REFERENCES tbl_Borrower(CardNo) ON UPDATE CASCADE ON DELETE CASCADE,
	DateOut DATE NOT NULL,
	DateDue DATE NOT NULL
);


/* POPULATE TABLES WITH DATA */

INSERT INTO tbl_Library_Branch
	(BranchName, Address)
	VALUES
	('Sharpstown', '800 Poplar Avenue, Booktown, CT 06035'),
	('Central', '2100 Main Street, Booktown, CT 06035'),
	('Rocky Cove', '215 Seaside Lane, Booktown, CT 06042'),
	('Windy Ridge', '572 Mountain Road, Booktown, CT 06048')
;

INSERT INTO tbl_Publisher
	(PublisherName, Address, Phone)
	VALUES
	('Unpublished Publishers', NULL, NULL),
	('Simon & Schuster', '1230 Avenue of the Americas, New York, NY 10020', '212-698-7000'),
	('Knopf Doubleday', '1745 Broadway, New York, NY 10019', '212-940-7390'),
	('Oxford University Press', 'Great Clarendon St, Oxford OX2 6DP, United Kingdom', '800-445-9714'),
	('Yale University Press', '302 Temple St, New Haven, CT 06511', '203-432-0960'),
	('Dalkey Archive Press', '6271 E 535 North Road, McLean, IL 61754', NULL)
;

INSERT INTO tbl_Books
	(Title, PublisherName)
	VALUES
	('The Lost Tribe', 'Unpublished Publishers'),
	('The Dark Tower', 'Simon & Schuster'),
	('The Stand', 'Knopf Doubleday'),
	('For the Love of Classical Music', 'Knopf Doubleday'),
	('The Changing Light at Sandover', 'Knopf Doubleday'),
	('The Handmaid''s Tale', 'Knopf Doubleday'),
	('Midnight in Chernobyl', 'Simon & Schuster'),
	('The Library Book', 'Simon & Schuster'),
	('The Home Butcher', 'Simon & Schuster'),
	('David Copperfield', 'Oxford University Press'),
	('The Pickwick Papers', 'Oxford University Press'),
	('Emma', 'Oxford University Press'),
	('Pride and Prejudice', 'Oxford University Press'),
	('The Anatomy of Influence', 'Yale University Press'),
	('The Shadow of a Great Rock', 'Yale University Press'),
	('Twelfth Night', 'Yale University Press'),
	('Edward Hopper and the American Hotel', 'Yale University Press'),
	('Eros the Bittersweet', 'Dalkey Archive Press'),
	('Conjugating Hindi', 'Dalkey Archive Press'),
	('The Sibley Guide to Birds', 'Knopf Doubleday')
;

INSERT INTO tbl_Borrower
	(Name, Address, Phone)
	VALUES
	('Joseph Smith', '45 Elm Street, Booktown, CT 06035', '860-421-5832'),
	('Josephine Smith', '45 Elm Street, Booktown, CT 06035', '860-421-5832'),
	('Michael Bookman', '245 Mountain Road, Booktown, CT 06048', '860-984-4244'),
	('Sally Woods', '323 Ocean Drive, Booktown, CT 06042', '860-873-3371'),
	('Thomas McBride', '899 Old Post Road, Booktown, CT 06048', '860-114-5832'),
	('Vivian McBride', '899 Old Post Road, Booktown, CT 06048', '860-114-5832'),
	('Shirley Holmes', '342 Baker Street, Booktown, CT 06035', '860-592-4992'),
	('Emily Lovejoy', '57 Wuthering Heights, Booktown, CT 06048', '860-428-5919')
;

INSERT INTO tbl_Book_Authors
	(BookID, AuthorName)
	VALUES
	(1, 'Stanislaus Grumman'),
	(2, 'Stephen King'),
	(3, 'Stephen King'),
	(4, 'John Mauceri'),
	(5, 'James Merrill'),
	(6, 'Margaret Atwood'),
	(7, 'Adam Higginbotham'),
	(8, 'Susan Orlean'),
	(9, 'James O. Fraioli'),
	(10, 'Charles Dickens'),
	(11, 'Charles Dickens'),
	(12, 'Jane Austen'),
	(13, 'Jane Austen'),
	(14, 'Harold Bloom'),
	(15, 'Harold Bloom'),
	(16, 'William Shakespeare'),
	(17, 'Leo G. Mazow'),
	(18, 'Anne Carson'),
	(19, 'Ishmael Reed'),
	(20, 'David Allen Sibley')
;

INSERT INTO tbl_Book_Copies
	(BookID, BranchID, Number_Of_Copies)
	VALUES
	(1, 1, 3),
	(1, 2, 2),
	(1, 3, 2),
	(2, 2, 4),
	(2, 4, 2),
	(3, 2, 5),
	(3, 3, 3),
	(4, 1, 2),
	(5, 3, 2),
	(5, 4, 3),
	(6, 1, 2),
	(6, 2, 3),
	(6, 4, 2),
	(7, 3, 2),
	(8, 4, 2),
	(9, 1, 2),
	(9, 2, 2),
	(10, 1, 3),
	(10, 2, 2),
	(10, 3, 2),
	(10, 4, 2),
	(11, 1, 2),
	(11, 4, 2),
	(12, 2, 3),
	(12, 3, 5),
	(13, 3, 2),
	(13, 4, 3),
	(14, 1, 2),
	(14, 3, 2),
	(14, 4, 2),
	(15, 2, 3),
	(15, 4, 2),
	(16, 1, 4),
	(16, 2, 3),
	(16, 3, 2),
	(16, 4, 2),
	(17, 2, 2),
	(18, 1, 2),
	(18, 3, 2),
	(18, 4, 2),
	(19, 1, 2),
	(19, 2, 2),
	(20, 1, 2),
	(20, 2, 3),
	(20, 3, 2),
	(20, 4, 3)
;

INSERT INTO tbl_Book_Loans
	(BookID, BranchID, CardNo, DateOut, DateDue)
	VALUES
	(1, 1, 100000, '2019-12-16', '2020-01-06'),
	(4, 1, 100000, '2019-12-16', '2020-01-06'),
	(6, 1, 100000, '2019-12-16', '2020-01-06'),
	(9, 1, 100000, '2019-12-16', '2020-01-06'),
	(19, 1, 100000, '2019-12-16', '2020-01-06'),
	(20, 1, 100000, '2019-12-16', '2020-01-06'),
	(10, 1, 100001, '2019-12-19', '2020-01-09'),
	(11, 1, 100001, '2019-12-19', '2020-01-09'),
	(14, 1, 100001, '2019-12-19', '2020-01-09'),
	(16, 1, 100001, '2019-12-19', '2020-01-09'),
	(18, 1, 100001, '2019-12-19', '2020-01-09'),
	(2, 2, 100006, '2019-12-18', '2020-01-08'),
	(3, 2, 100006, '2019-12-26', '2020-01-16'),
	(6, 2, 100006, '2019-12-18', '2020-01-08'),
	(9, 2, 100006, '2019-12-18', '2020-01-08'),
	(10, 2, 100006, '2019-12-26', '2020-01-16'),
	(12, 2, 100006, '2019-12-18', '2020-01-08'),
	(15, 2, 100006, '2019-12-18', '2020-01-08'),
	(16, 2, 100006, '2019-12-18', '2020-01-08'),
	(17, 2, 100006, '2019-12-26', '2020-01-16'),
	(19, 2, 100006, '2019-12-18', '2020-01-08'),
	(20, 2, 100006, '2019-12-18', '2020-01-08'),
	(1, 3, 100003, '2019-12-26', '2020-01-16'),
	(3, 3, 100003, '2019-12-26', '2020-01-16'),
	(5, 3, 100003, '2019-12-26', '2020-01-16'),
	(7, 3, 100003, '2019-12-26', '2020-01-16'),
	(10, 3, 100003, '2019-12-26', '2020-01-16'),
	(12, 3, 100003, '2019-12-26', '2020-01-16'),
	(13, 3, 100003, '2019-12-26', '2020-01-16'),
	(14, 3, 100003, '2019-12-26', '2020-01-16'),
	(16, 3, 100003, '2019-12-26', '2020-01-16'),
	(20, 3, 100003, '2019-12-26', '2020-01-16'),
	(2, 4, 100002, '2019-12-29', '2020-01-19'),
	(5, 4, 100002, '2019-12-29', '2020-01-19'),
	(8, 4, 100002, '2019-12-29', '2020-01-19'),
	(15, 4, 100002, '2019-12-29', '2020-01-19'),
	(20, 4, 100002, '2019-12-29', '2020-01-19'),
	(2, 4, 100005, '2019-12-14', '2020-01-04'),
	(6, 4, 100005, '2019-12-14', '2020-01-04'),
	(13, 4, 100005, '2019-12-14', '2020-01-04'),
	(16, 4, 100005, '2019-12-14', '2020-01-04'),
	(20, 4, 100005, '2019-12-14', '2020-01-04'),
	(5, 4, 100007, '2019-12-14', '2020-01-04'),
	(6, 4, 100007, '2019-12-20', '2020-01-10'),
	(8, 4, 100007, '2019-12-13', '2020-01-03'),
	(10, 4, 100007, '2019-12-20', '2020-01-10'),
	(11, 4, 100007, '2019-12-13', '2020-01-03'),
	(13, 4, 100007, '2019-12-13', '2020-01-03'),
	(16, 4, 100007, '2019-12-20', '2020-01-10'),
	(18, 4, 100007, '2019-12-13', '2020-01-03'),
	(20, 4, 100007, '2019-12-13', '2020-01-03')
;