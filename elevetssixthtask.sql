CREATE DATABASE LibraryDB;
USE LibraryDB;

CREATE TABLE books (
    bookID INT PRIMARY KEY,
    title VARCHAR(100),
    price DECIMAL(5,2)
);

CREATE TABLE loans (
    loanID INT PRIMARY KEY,
    bookID INT,
    memberID INT,
    loanDate DATE
);

CREATE TABLE members (
    memberID INT PRIMARY KEY,
    name VARCHAR(100)
);

INSERT INTO books VALUES
(1, 'Java Basics', 500),
(2, 'SQL Guide', 400),
(3, 'Python 101', 600);

INSERT INTO members VALUES
(1, 'Pallavi'),
(2, 'Amit');

INSERT INTO loans VALUES
(101, 1, 1, '2024-06-01'),
(102, 2, 2, '2024-06-05');

SELECT * FROM books
WHERE bookID NOT IN (SELECT bookID FROM loans);

SELECT title,
  (SELECT COUNT(*) FROM loans WHERE bookID = books.bookID) AS times_borrowed
FROM books;

SELECT * FROM members m
WHERE EXISTS (
  SELECT 1 FROM loans l WHERE l.memberID = m.memberID
);

