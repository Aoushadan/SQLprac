
/*CREATE TABLE Screen (
  screen_id INT IDENTITY(1,1) PRIMARY KEY,
  name VARCHAR(50) NOT NULL,
  class_type VARCHAR(10) NOT NULL,
  capacity INT NOT NULL
);


CREATE TABLE Seat (
  seat_id INT IDENTITY(1,1) PRIMARY KEY,
  screen_id INT NOT NULL,
  seat_number VARCHAR(10) NOT NULL,
  FOREIGN KEY (screen_id) REFERENCES Screen(screen_id)
);


CREATE TABLE Movie (
  movie_id INT IDENTITY(1,1) PRIMARY KEY,
  title VARCHAR(255) NOT NULL,
  genre VARCHAR(50) NOT NULL,
  rating DECIMAL(3,1) NOT NULL,
  status VARCHAR(20) NOT NULL,
  poster_image_url VARCHAR(255)
);


CREATE TABLE MovieCast (
  cast_id INT IDENTITY(1,1) PRIMARY KEY,
  movie_id INT NOT NULL,
  person_name VARCHAR(100) NOT NULL,
  role VARCHAR(100) NOT NULL,
  FOREIGN KEY (movie_id) REFERENCES Movie(movie_id)
);


CREATE TABLE Review (
  review_id INT IDENTITY(1,1) PRIMARY KEY,
  movie_id INT NOT NULL,
  content TEXT NOT NULL,
  review_date DATETIME NOT NULL,
  reviewer_name VARCHAR(100) NOT NULL,
  FOREIGN KEY (movie_id) REFERENCES Movie(movie_id)
);


CREATE TABLE Show (
  show_id INT IDENTITY(1,1) PRIMARY KEY,
  screen_id INT NOT NULL,
  movie_id INT NOT NULL,
  show_datetime DATETIME NOT NULL,
  FOREIGN KEY (screen_id) REFERENCES Screen(screen_id),
  FOREIGN KEY (movie_id) REFERENCES Movie(movie_id)
);


CREATE TABLE ShowSeat (
  show_seat_id INT IDENTITY(1,1) PRIMARY KEY,
  show_id INT NOT NULL,
  seat_id INT NOT NULL,
  is_available BIT NOT NULL DEFAULT 1,
  FOREIGN KEY (show_id) REFERENCES Show(show_id),
  FOREIGN KEY (seat_id) REFERENCES Seat(seat_id)
);


CREATE TABLE [User] (
  user_id INT IDENTITY(1,1) PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  email VARCHAR(150) NOT NULL UNIQUE,
  phone VARCHAR(15)
);


CREATE TABLE Membership (
  membership_id INT IDENTITY(1,1) PRIMARY KEY,
  user_id INT NOT NULL,
  current_points INT NOT NULL DEFAULT 0,
  FOREIGN KEY (user_id) REFERENCES [User](user_id)
);


CREATE TABLE Booking (
  booking_id INT IDENTITY(1,1) PRIMARY KEY,
  user_id INT NOT NULL,
  show_id INT NOT NULL,
  booking_datetime DATETIME NOT NULL,
  total_cost DECIMAL(10,2) NOT NULL,
  FOREIGN KEY (user_id) REFERENCES [User](user_id),
  FOREIGN KEY (show_id) REFERENCES Show(show_id)
);

CREATE TABLE Ticket (
    ticket_id INT PRIMARY KEY NOT NULL,
    qr_code VARCHAR(100) NOT NULL,
    delivery_method VARCHAR(50) NOT NULL,
    scanned_at DATETIME
);*/

-- Ticket Table
CREATE TABLE Ticket (
    ticket_id INT IDENTITY(1,1) PRIMARY KEY,
    booking_id INT NOT NULL,
    show_seat_id INT NOT NULL,
    qr_code VARCHAR(100) NOT NULL,
    delivery_method VARCHAR(50) NOT NULL,
    is_downloaded BIT NOT NULL DEFAULT 0,
    scanned_at DATETIME NULL,
    CONSTRAINT UC_Ticket UNIQUE (booking_id, show_seat_id)
);

-- PaymentGateway Table
CREATE TABLE PaymentGateway (
    gateway_id INT IDENTITY(1,1) PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

-- Payment Table
CREATE TABLE Payment (
    payment_id INT IDENTITY(1,1) PRIMARY KEY,
    booking_id INT NOT NULL,
    gateway_id INT NOT NULL,
    transaction_amount DECIMAL(10,2) NOT NULL,
    transaction_datetime DATETIME NOT NULL,
    status VARCHAR(20) NOT NULL,
    failure_reason TEXT NULL,
    credit_card_name VARCHAR(100) NULL,
    credit_card_number VARCHAR(20) NULL,
    expiry_date DATE NULL,
    cvv VARCHAR(4) NULL,
    CONSTRAINT FK_Payment_Booking FOREIGN KEY (booking_id) REFERENCES Booking(booking_id),
    CONSTRAINT FK_Payment_Gateway FOREIGN KEY (gateway_id) REFERENCES PaymentGateway(gateway_id)
);

-- FoodItem Table
CREATE TABLE FoodItem (
    item_id INT IDENTITY(1,1) PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    description TEXT NULL,
    is_combo BIT NOT NULL DEFAULT 0
);

-- FoodItemSize Table
CREATE TABLE FoodItemSize (
    size_id INT IDENTITY(1,1) PRIMARY KEY,
    item_id INT NOT NULL,
    size_name VARCHAR(50) NOT NULL,
    rate DECIMAL(10,2) NOT NULL,
    CONSTRAINT FK_FoodItemSize_FoodItem FOREIGN KEY (item_id) REFERENCES FoodItem(item_id)
);

-- FoodOrder Table
CREATE TABLE FoodOrder (
    order_id INT IDENTITY(1,1) PRIMARY KEY,
    booking_id INT NOT NULL,
    screen_id INT NOT NULL,
    seat_id INT NOT NULL,
    order_datetime DATETIME NOT NULL,
    total_cost DECIMAL(10,2) NOT NULL,
    delivery_method VARCHAR(50) NOT NULL,
    CONSTRAINT FK_FoodOrder_Booking FOREIGN KEY (booking_id) REFERENCES Booking(booking_id)
);

-- FoodOrderItem Table
CREATE TABLE FoodOrderItem (
    order_item_id INT IDENTITY(1,1) PRIMARY KEY,
    order_id INT NOT NULL,
    item_id INT NOT NULL,
    size_id INT NOT NULL,
    quantity INT NOT NULL,
    price_at_time DECIMAL(10,2) NOT NULL,
    CONSTRAINT FK_FoodOrderItem_FoodOrder FOREIGN KEY (order_id) REFERENCES FoodOrder(order_id),
    CONSTRAINT FK_FoodOrderItem_FoodItem FOREIGN KEY (item_id) REFERENCES FoodItem(item_id),
    CONSTRAINT FK_FoodOrderItem_FoodItemSize FOREIGN KEY (size_id) REFERENCES FoodItemSize(size_id)
);

-- PointsTransaction Table
CREATE TABLE PointsTransaction (
    transaction_id INT IDENTITY(1,1) PRIMARY KEY,
    user_id INT NOT NULL,
    amount DECIMAL(10,2) NOT NULL,
    points_earned INT NOT NULL,
    transaction_datetime DATETIME NOT NULL,
    transaction_type VARCHAR(20) NOT NULL,
    CONSTRAINT FK_PointsTransaction_User FOREIGN KEY (user_id) REFERENCES [User](user_id)
);


SELECT * FROM Review
WHERE review_date = '2025-06-10 16:00:00.000'

SELECT '2025-06-13 20:00:00.000';

SELECT LTRIM('     Job Aoushadan');

SELECT RTRIM('Job Aoushadan           ');


/*CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(50) NOT NULL,
    Location VARCHAR(50)
);


INSERT INTO Departments (DepartmentID, DepartmentName, Location) VALUES
(101, 'HR', 'New York'),
(102, 'IT', 'London'),
(103, 'Sales', 'Paris');


CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    EmployeeName VARCHAR(50) NOT NULL,
    DepartmentID INT,
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);


INSERT INTO Employees (EmployeeID, EmployeeName, DepartmentID) VALUES
(1, 'Alice', 101),
(2, 'Bob', 102),
(3, 'Charlie', 101),
(4, 'David', NULL);*/

SELECT E.EmployeeID,
E.EmployeeName,
D.DepartmentName
FROM
Employees AS E
INNER JOIN
Departments AS D ON E.DepartmentID = D.DepartmentID;


SELECT E.EmployeeID,
E.EmployeeName,
D.DepartmentName
FROM
Employees AS E
LEFT JOIN
Departments AS D ON E.DepartmentID = D.DepartmentID;

SELECT E.EmployeeID,
E.EmployeeName,
D.DepartmentName
FROM
Employees AS E
RIGHT JOIN
Departments AS D ON E.DepartmentID = D.DepartmentID;

SELECT E.EmployeeID,
E.EmployeeName,
D.DepartmentName
FROM
Employees AS E
FULL JOIN
Departments AS D ON E.DepartmentID = D.DepartmentID;

SELECT 
E.EmployeeName,
D.DepartmentName
FROM
Employees AS E
CROSS JOIN
Departments AS D;


--SUBQUERY

SELECT EmployeeID
FROM Employees
WHERE EmployeeID > 1 
    (SELECT EmployeeName FROM Employees WHERE EmployeeName = 'Bob');



SELECT SUBSTRING('Alice', 1, 10)

SELECT EmployeeName, ASCII(EmployeeName) AS ASCIIVALUES
FROM Employees;

SELECT QUOTENAME('Hexa');

TRUNCATE TABLE Ticket;

DROP TABLE Ticket;

BEGIN TRANSACTION
SELECT *
FROM Employees
WHERE EmployeeName = 'Bob';
COMMIT; 

BEGIN TRANSACTION
SELECT *
FROM Employees
WHERE DepartmentID = '101';
ROLLBACK;

BEGIN TRANSACTION
DELETE 
FROM Employees
WHERE EmployeeID = 3;
SAVE TRANSACTION sp1;

SELECT EmployeeID
FROM Employees
WHERE EmployeeID < 1 
    (SELECT EmployeeName FROM Employees WHERE EmployeeName = 'Bob');

SELECT EmployeeID
FROM Employees
WHERE EmployeeID = 1 
    (SELECT EmployeeName FROM Employees WHERE EmployeeName = 'David');
