/* CREATE STORED PROCEDURES FOR VARIOUS QUERIES */

USE db_Library
GO

/* 1 */
CREATE PROCEDURE usp_CopiesLostTribe_Sharpstown
AS
SELECT a.Number_of_Copies
FROM tbl_Book_Copies a
INNER JOIN tbl_Library_Branch b ON b.BranchID = a.BranchID 
INNER JOIN tbl_Books c ON c.BookID = a.BookID
WHERE b.BranchName = 'Sharpstown'
AND c.Title = 'The Lost Tribe'
GO

/* 2 */
CREATE PROCEDURE usp_CopiesLostTribe
AS
SELECT a.Number_of_Copies, b.BranchName
FROM tbl_Book_Copies a
INNER JOIN tbl_Library_Branch b ON b.BranchID = a.BranchID 
INNER JOIN tbl_Books c ON c.BookID = a.BookID
WHERE c.Title = 'The Lost Tribe'
GO

/* 3 */
CREATE PROCEDURE usp_NoLoans
AS
SELECT a.Name
FROM tbl_Borrower a
LEFT JOIN tbl_Book_Loans b ON a.CardNo = b.CardNo
WHERE b.CardNo IS NULL
GO

/* 4 */
CREATE PROCEDURE usp_DueToday_Sharpstown
AS
SELECT c.Title, b.Name, b.Address
FROM tbl_Book_Loans a
INNER JOIN tbl_Borrower b ON b.CardNo = a.CardNo
INNER JOIN tbl_Books c ON c.BookID = a.BookID
INNER JOIN tbl_Library_Branch d ON d.BranchID = a.BranchID
WHERE a.DateDue = (CONVERT(DATE, GETDATE()))
AND d.BranchName = 'Sharpstown'
GO

/* 5 */
CREATE PROCEDURE usp_TotalLoansByBranch
AS
SELECT b.BranchName, COUNT(a.BookID) AS 'Total Loans'
FROM tbl_Book_Loans a
INNER JOIN tbl_Library_Branch b ON b.BranchID = a.BranchID
GROUP BY b.BranchName
GO

/* 6 */
CREATE PROCEDURE usp_MoreThanFiveLoans
AS
SELECT b.Name, b.Address, COUNT(a.BookID) AS 'Total Loans'
FROM tbl_Book_Loans a
INNER JOIN tbl_Borrower b ON b.CardNo = a.CardNo
GROUP BY b.Name, b.Address
HAVING COUNT(a.BookID) > 5
GO

/* 7 */
CREATE PROCEDURE usp_StephenKing_Central
AS
SELECT d.Title, a.Number_Of_Copies 
FROM tbl_Book_Copies a 
INNER JOIN tbl_Book_Authors b ON b.BookID = a.BookID
INNER JOIN tbl_Library_Branch c ON c.BranchID = a.BranchID
INNER JOIN tbl_Books d on d.BookID = a.BookID
WHERE b.AuthorName = 'Stephen King'
AND c.BranchName = 'Central'
GO