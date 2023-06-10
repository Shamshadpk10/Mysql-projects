use amazone;
-- Create the Branch table
CREATE TABLE Branch (
  Branch_no INT PRIMARY KEY,
  Manager_Id INT,
  Branch_address VARCHAR(255),
  Contact_no VARCHAR(20)
);

INSERT INTO Branch (Branch_no, Manager_Id, Branch_address, Contact_no)
VALUES
  (1, 101, '123 Main Street', '123-456-7890'),
  (2, 102, '456 Elm Street', '987-654-3210'),
  (3, 103, '789 Oak Street', '555-555-5555'),
  (4, 104, '321 Pine Street', '111-222-3333'),
  (5, 105, '567 Maple Street', '444-555-6666'),
  (6, 106, '890 Walnut Street', '777-888-9999');
  
-- Create the Employee table
CREATE TABLE Employee (
  Emp_Id INT PRIMARY KEY,
  Emp_name VARCHAR(255),
  Position VARCHAR(100),
  Salary DECIMAL(10, 2)
);
INSERT INTO Employee (Emp_Id, Emp_name, Position, Salary)
VALUES
  (101, 'John snow', 'Manager', 8000.00),
  (102, 'Jane Smith', 'Librarian', 4500.00),
  (103, 'Robert Johnson', 'Clerk', 3500.00),
  (104, 'Emily Davis', 'Assistant', 3000.00),
  (105, 'Michael Wilson', 'Clerk', 3500.00),
  (106, 'Jessica Brown', 'Librarian', 4000.00);

-- Create the Customer table
CREATE TABLE Customer (
  Customer_Id INT PRIMARY KEY,
  Customer_name VARCHAR(255),
  Customer_address VARCHAR(255),
  Reg_date DATE
);
INSERT INTO Customer (Customer_Id, Customer_name, Customer_address, Reg_date)
VALUES
  (1, 'Alice Johnson', '456 Main Street', '2023-01-15'),
  (2, 'Bob Smith', '789 Elm Street', '2022-12-01'),
  (3, 'Eve Wilson', '123 Oak Street', '2023-02-28'),
  (4, 'David Lee', '567 Pine Street', '2023-03-10'),
  (5, 'Sophia Martin', '890 Maple Street', '2023-04-05'),
  (6, 'Oliver Taylor', '321 Walnut Street', '2023-05-20');



-- Create the Books table
CREATE TABLE Books (
  ISBN VARCHAR(50) PRIMARY KEY,
  Book_title VARCHAR(255),
  Category VARCHAR(100),
  Rental_Price DECIMAL(10, 2),
  Status VARCHAR(3),
  Author VARCHAR(255),
  Publisher VARCHAR(255)
);
INSERT INTO Books (ISBN, Book_title, Category, Rental_Price, Status, Author, Publisher)
VALUES
  ('1234567890', 'The Matrix', 'Science Fiction', 300, 'yes', 'Lana Wachowski', 'Warner Bros.'),
  ('0987654321', 'Inception', 'Thriller',400, 'yes', 'Christopher Nolan', 'Paramount Pictures'),
  ('5432109876', 'Pulp Fiction', 'Crime',500, 'yes', 'Quentin Tarantino', 'Miramax'),
  ('1112223334', 'The Shawshank Redemption', 'Drama', 800, 'yes', 'Frank Darabont', 'Columbia Pictures'),
  ('4445556667', 'Fight Club', 'Drama', 600, 'yes', 'David Fincher', '20th Century Studios'),
  ('7778889990', 'The Godfather', 'Crime', 800, 'yes', 'Francis Ford Coppola', 'Paramount Pictures');

-- Create the IssueStatus table
CREATE TABLE IssueStatus (
  Issue_Id INT PRIMARY KEY,
  Issued_cust INT,
  Issued_book_name VARCHAR(255),
  Issue_date DATE,
  Isbn_book VARCHAR(50),
  FOREIGN KEY (Issued_cust) REFERENCES Customer(Customer_Id),
  FOREIGN KEY (Isbn_book) REFERENCES Books(ISBN)
);
INSERT INTO IssueStatus (Issue_Id, Issued_cust, Issued_book_name, Issue_date, Isbn_book)
VALUES
  (1, 1, 'The Matrix', '2023-05-20', '1234567890'),
  (2, 2, 'Inception', '2023-06-01', '0987654321'),
  (3, 3, 'Pulp Fiction', '2023-05-10', '5432109876'),
  (4, 4, 'The Shawshank Redemption', '2023-06-02', '1112223334'),
  (5, 5, 'Fight Club', '2023-04-18', '4445556667'),
  (6, 6, 'The Godfather', '2023-05-30', '7778889990');

-- Create the ReturnStatus table
CREATE TABLE ReturnStatus (
  Return_Id INT PRIMARY KEY,
  Return_cust INT,
  Return_book_name VARCHAR(255),
  Return_date DATE,
  Isbn_book2 VARCHAR(50),
  FOREIGN KEY (Return_cust) REFERENCES Customer(Customer_Id),
  FOREIGN KEY (Isbn_book2) REFERENCES Books(ISBN) 
);
-- Insert data into the ReturnStatus table
INSERT INTO ReturnStatus (Return_Id, Return_cust, Return_book_name, Return_date, Isbn_book2)
VALUES
  (1, 1, 'The Matrix', '2023-06-05', '1234567890'),
  (2, 2, 'Inception', '2023-06-08', '0987654321'),
  (3, 3, 'Pulp Fiction', '2023-06-04', '5432109876'),
  (4, 4, 'The Shawshank Redemption', '2023-06-10', '1112223334'),
  (5, 5, 'Fight Club', '2023-06-07', '4445556667'),
  (6, 6, 'The Godfather', '2023-06-09', '7778889990');
  
  
SELECT*from books;
SELECT*from branch;
SELECT*from customer;
SELECT*from employee;
SELECT*from issuestatus;
SELECT*from returnstatus;

--  1 Retrieve the book title, category, and rental price of all available books. 
select book_title,category,rental_price from books where status='yes';

-- 2   List the employee names and their respective salaries in descending order of salary. 
SELECT emp_name,salary from employee ORDER BY salary DESC;

-- 3 Retrieve the book titles and the corresponding customers who have issued those books.
SELECT b.Book_title, c.Customer_name
FROM IssueStatus i
JOIN Books b ON i.Isbn_book = b.ISBN
JOIN Customer c ON i.Issued_cust = c.Customer_Id;

 -- 4 Display the total count of books in each category.
SELECT Category,count(*) as total_count from books group by category;

 -- 5 Retrieve the employee names and their positions for the employees 
-- whose salaries are above Rs.5000.
SELECT emp_name,position from employee where salary>=5000;
 
-- 6  List the customer names who registered before 2022-01-01 and have 
-- not issued any books yet.
SELECT Customer_name FROM Customer WHERE Reg_date < '2022-01-01'
AND Customer_Id NOT IN (SELECT Issued_cust FROM IssueStatus);

-- 7 Display the branch numbers and the total count of employees in each branch. 
SELECT b.Branch_no, COUNT(*) AS Total_Employees
FROM Branch b JOIN Employee e ON b.Manager_Id = e.Emp_Id
GROUP BY b.Branch_no;

-- 8  Display the names of customers who have issued books in the month of June 2023. 
SELECT c.Customer_name FROM Customer c
JOIN IssueStatus i ON c.Customer_Id = i.Issued_cust
WHERE i.Issue_date >= '2023-06-01' AND i.Issue_date < '2023-07-01';

-- 9  Retrieve book_title from book table containing history.
SELECT book_title from books where category ='drama'; -- no history catagory. using drama 

-- 10 Retrieve the branch numbers along with the count of employees for 
-- branches having more than 5 employees. 

SELECT b.Branch_no, COUNT(*) AS Employee_Count FROM Branch b
JOIN Employee e ON b.Manager_Id = e.Emp_Id
GROUP BY b.Branch_no
HAVING COUNT(*) > 5;










 


























