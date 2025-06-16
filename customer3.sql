

--1NF
-- Table Creation
CREATE TABLE Student_Subjects (
    Student_ID INT,
    Subject VARCHAR(50),
    PRIMARY KEY (Student_ID, Subject)
);

-- Sample Inserts
INSERT INTO Student_Subjects (Student_ID, Subject) VALUES
(1, 'Math'),
(1, 'Physics'),
(2, 'Biology'),
(2, 'Chemistry'),
(3, 'Math');

-- Retrieval
SELECT * FROM Student_Subjects;


-- Table Creation
CREATE TABLE Orders (
    Order_ID INT PRIMARY KEY,
    Customer_Name VARCHAR(100)
);

CREATE TABLE Order_Products (
    Order_ID INT,
    Product_ID INT,
    Quantity INT,
    FOREIGN KEY (Order_ID) REFERENCES Orders(Order_ID)
);

--2NF
-- Sample Inserts
INSERT INTO Orders (Order_ID, Customer_Name) VALUES
(1001, 'Alice'),
(1002, 'Bob');

INSERT INTO Order_Products (Order_ID, Product_ID, Quantity) VALUES
(1001, 1, 2),
(1001, 2, 1),
(1002, 2, 3);

-- Retrieval
-- All orders with their products
SELECT o.Order_ID, o.Customer_Name, p.Product_ID, p.Quantity
FROM Orders o
JOIN Order_Products p ON o.Order_ID = p.Order_ID;


-- Table Creation
CREATE TABLE Departments_Normalized (
    Department_ID INT PRIMARY KEY,
    Department_Name VARCHAR(100),
    Manager_ID INT
);

CREATE TABLE Employees_Normalized (
    Emp_ID INT PRIMARY KEY,
    Name VARCHAR(100),
    Department_ID INT,
    FOREIGN KEY (Department_ID) REFERENCES Departments_Normalized(Department_ID)
);


--3NF
-- Sample Inserts
INSERT INTO Departments_Normalized (Department_ID, Department_Name, Manager_ID) VALUES
(10, 'HR', 100),
(20, 'Engineering', 101);

INSERT INTO Employees_Normalized (Emp_ID, Name, Department_ID) VALUES
(1, 'Alice', 10),
(2, 'Bob', 20),
(3, 'Charlie', 20);

-- Retrieval
-- All employees with their department names
SELECT e.Emp_ID, e.Name, d.Department_Name
FROM Employees_Normalized e
JOIN Departments_Normalized d ON e.Department_ID = d.Department_ID;


-- Supporting tables
CREATE TABLE Students (
    Student_ID INT PRIMARY KEY,
    Name VARCHAR(100)
);

CREATE TABLE Courses (
    Course_ID INT PRIMARY KEY,
    Course_Name VARCHAR(100)
);

-- Main Enrollments table
CREATE TABLE Enrollments (
    Student_ID INT,
    Course_ID INT,
    Enrollment_Date DATE NOT NULL,
    Grade VARCHAR(2),
    FOREIGN KEY (Student_ID) REFERENCES Students(Student_ID),
    FOREIGN KEY (Course_ID) REFERENCES Courses(Course_ID),
    PRIMARY KEY (Student_ID, Course_ID)
);


--MANY TO MANY
-- Sample Inserts
INSERT INTO Students (Student_ID, Name) VALUES
(1, 'Alice'),
(2, 'Bob');

INSERT INTO Courses (Course_ID, Course_Name) VALUES
(101, 'Math'),
(102, 'History');

INSERT INTO Enrollments (Student_ID, Course_ID, Enrollment_Date, Grade) VALUES
(1, 101, '2024-09-01', 'A'),
(1, 102, '2024-09-01', 'B'),
(2, 101, '2024-09-01', 'A');

-- Retrieval
-- All students with their enrolled courses and grades
SELECT s.Name AS Student_Name, c.Course_Name, e.Enrollment_Date, e.Grade
FROM Enrollments e
JOIN Students s ON e.Student_ID = s.Student_ID
JOIN Courses c ON e.Course_ID = c.Course_ID;
