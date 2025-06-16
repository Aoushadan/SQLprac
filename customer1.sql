-- Create Customers table
/*CREATE TABLE Customerstable (
    customer_id INT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100),
    city VARCHAR(50),
    created_at DATE
);

-- Create Products table
CREATE TABLE Products (
    product_id INT PRIMARY KEY,
    name VARCHAR(100),
    category VARCHAR(50),
    price DECIMAL(10, 2),
    stock INT
);

-- Create Orders table
CREATE TABLE Orderstable (
    order_id INT PRIMARY KEY,
    customer_id INT,
    product_id INT,
    quantity INT,
    order_date DATE,
    total_price DECIMAL(10, 2),
    FOREIGN KEY (customer_id) REFERENCES Customerstable(customer_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

CREATE TABLE Payments (
    payment_id INT PRIMARY KEY,
    order_id INT,
    payment_date DATETIME,
    amount DECIMAL(10, 2),
    payment_method VARCHAR(50),
    FOREIGN KEY (order_id) REFERENCES Orderstable(order_id)
);
CREATE TABLE Reviews (
    review_id INT PRIMARY KEY,
    customer_id INT,
    product_id INT,
    rating INT,
    review_text TEXT,
    review_date DATETIME,
    FOREIGN KEY (customer_id) REFERENCES Customerstable(customer_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

CREATE TABLE studentss1(
    student_id INT,
    name NVARCHAR(100),
    score INT,
    class_id INT
);

CREATE TABLE studentss2(
    student_id INT,
    name NVARCHAR(100),
    score INT,
    class_id INT
);

CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    name NVARCHAR(100),
    department_id INT,
    salary DECIMAL(10, 2)
);



CREATE TABLE accounts (
    account_id INT PRIMARY KEY,
    account_holder NVARCHAR(100),
    balance DECIMAL(15, 2)
);

CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    department_name NVARCHAR(100)
);


CREATE TABLE logs (
    log_id INT PRIMARY KEY,
    message NVARCHAR(255),
    created_at DATETIME
);





INSERT INTO Customerstable (customer_id, name, email, city, created_at) VALUES
(1, 'Alice Johnson', 'alice.johnson@example.com', 'New York', '2024-01-15'),
(2, 'Bob Smith', 'bob.smith@example.com', 'Los Angeles', '2024-02-10'),
(3, 'Charlie Lee', 'charlie.lee@example.com', 'Chicago', '2024-03-05'),
(4, 'Diana Prince', 'diana.prince@example.com', 'Houston', '2024-01-22'),
(5, 'Evan Davis', 'evan.davis@example.com', 'Phoenix', '2024-02-28'),
(6, 'Fiona Green', 'fiona.green@example.com', 'Philadelphia', '2024-04-01'),
(7, 'George Brown', 'george.brown@example.com', 'San Antonio', '2024-03-20'),
(8, 'Hannah Wilson', 'hannah.wilson@example.com', 'San Diego', '2024-04-05'),
(9, 'Ian Miller', 'ian.miller@example.com', 'Dallas', '2024-03-15'),
(10, 'Julia Roberts', 'julia.roberts@example.com', 'San Jose', '2024-04-10');



INSERT INTO Products (product_id, name, category, price, stock) VALUES
(1, 'Wireless Mouse', 'Electronics', 25.99, 150),
(2, 'Bluetooth Headphones', 'Electronics', 79.99, 80),
(3, 'Coffee Maker', 'Home Appliances', 45.50, 60),
(4, 'LED Desk Lamp', 'Home Decor', 30.00, 100),
(5, 'Yoga Mat', 'Fitness', 20.00, 200),
(6, 'Smartphone', 'Electronics', 699.99, 40),
(7, 'Running Shoes', 'Footwear', 120.00, 70),
(8, 'Backpack', 'Accessories', 55.00, 90),
(9, 'Water Bottle', 'Fitness', 15.00, 300),
(10, 'Electric Kettle', 'Home Appliances', 35.00, 85);


INSERT INTO Orderstable (order_id, customer_id, product_id, quantity, order_date, total_price) VALUES
(1, 1, 2, 1, '2024-04-01', 79.99),
(2, 2, 5, 2, '2024-04-03', 40.00),
(3, 3, 1, 3, '2024-04-05', 77.97),
(4, 4, 7, 1, '2024-04-07', 120.00),
(5, 5, 3, 1, '2024-04-08', 45.50),
(6, 6, 8, 1, '2024-04-10', 55.00),
(7, 7, 10, 2, '2024-04-12', 70.00),
(8, 8, 6, 1, '2024-04-15', 699.99),
(9, 9, 9, 5, '2024-04-16', 75.00),
(10, 10, 4, 1, '2024-04-18', 30.00);



INSERT INTO Payments (payment_id, order_id, payment_date, amount, payment_method) VALUES
(1, 1, '2024-04-01 10:00:00', 79.99, 'Credit Card'),
(2, 2, '2024-04-03 14:30:00', 40.00, 'PayPal'),
(3, 3, '2024-04-05 09:45:00', 77.97, 'Credit Card'),
(4, 4, '2024-04-07 16:20:00', 120.00, 'Debit Card'),
(5, 5, '2024-04-08 12:10:00', 45.50, 'Credit Card'),
(6, 6, '2024-04-10 11:00:00', 55.00, 'PayPal'),
(7, 7, '2024-04-12 15:00:00', 70.00, 'Credit Card'),
(8, 8, '2024-04-15 08:30:00', 699.99, 'Debit Card'),
(9, 9, '2024-04-16 13:40:00', 75.00, 'Credit Card'),
(10, 10, '2024-04-18 10:50:00', 30.00, 'PayPal');


INSERT INTO Reviews (review_id, customer_id, product_id, rating, review_text, review_date) VALUES
(1, 1, 2, 5, 'Excellent sound quality and comfortable fit.', '2024-04-05 12:00:00'),
(2, 2, 5, 4, 'Good mat, non-slip and durable.', '2024-04-07 09:30:00'),
(3, 3, 1, 3, 'Works fine but a bit small for my hand.', '2024-04-08 15:45:00'),
(4, 4, 7, 5, 'Super comfortable running shoes.', '2024-04-10 10:00:00'),
(5, 5, 3, 4, 'Makes good coffee quickly.', '2024-04-11 16:15:00'),
(6, 6, 8, 4, 'Sturdy backpack, good for travel.', '2024-04-13 08:25:00'),
(7, 7, 10, 5, 'Boils water very fast!', '2024-04-14 11:40:00'),
(8, 8, 6, 3, 'Phone is good but battery life could be better.', '2024-04-16 14:10:00'),
(9, 9, 9, 5, 'Keeps water cold for hours.', '2024-04-17 09:55:00'),
(10, 10, 4, 4, 'Bright and adjustable lamp.', '2024-04-19 12:20:00');*/


INSERT INTO studentss1 (student_id, name, score, class_id) VALUES
(1, 'Alice', 85, 101),
(2, 'Bob', 78, 101),
(3, 'Charlie', 92, 101),
(4, 'David', 88, 102),
(5, 'Eva', 91, 102),
(6, 'Frank', 72, 102),
(7, 'Grace', 89, 103),
(8, 'Helen', 95, 103),
(9, 'Ian', 81, 103);


INSERT INTO studentss2 (student_id, name, score, class_id) VALUES
(1, 'Alice', 85, 101),
(2, 'Bob', 82, 101),
(3, 'Charlie', 92, 101),
(4, 'Job', 88, 102),
(5, 'Eva', 91, 102),
(6, 'Aoushadan', 56, 102),
(7, 'Grace', 80, 103),
(8, 'Helen', 67, 103),
(9, 'Mark', 99, 103);



INSERT INTO employees (emp_id, name, department_id, salary) VALUES
(1, 'Alice Smith', 10, 60000.00),
(2, 'Bob Johnson', 10, 75000.00),
(3, 'Charlie Lee', 20, 80000.00),
(4, 'Diana Adams', 20, 65000.00),
(5, 'Ethan Clark', 30, 70000.00),
(6, 'Fiona Davis', 30, 72000.00),
(7, 'George Baker', 10, 55000.00),
(8, 'Hannah Scott', 20, 90000.00);

-- INSERT DATA --

INSERT INTO accounts (account_id, account_holder, balance) VALUES
(1, 'Alice', 2000.00),
(2, 'Bob', 1500.00);

INSERT INTO departments (department_id, department_name) VALUES
(100, 'Engineering'),
(200, 'Marketing');



INSERT INTO logs (log_id, message, created_at) VALUES
(0, 'System started', GETDATE());




SELECT * FROM Customerstable;
SELECT * FROM Products;
SELECT * FROM Orderstable;
SELECT * FROM Payments;
SELECT * FROM Reviews;
SELECT * FROM studentss1;
SELECT * FROM studentss2;
SELECT * FROM accounts;
SELECT * FROM departments;
SELECT * FROM logs;