
INSERT INTO Screen (name, class_type, capacity)
VALUES
  ('Screen A', 'Gold', 150),
  ('Screen B', 'Silver', 120),
  ('Screen C', 'Iron', 100);


INSERT INTO Seat (screen_id, seat_number)
VALUES
  (1, 'A1'), (1, 'A2'), (1, 'A3'),
  (2, 'B1'), (2, 'B2'), (2, 'B3'),
  (3, 'C1'), (3, 'C2'), (3, 'C3');

  
INSERT INTO Movie (title, genre, rating, status, poster_image_url)
VALUES
  ('Avengers: Endgame', 'Action', 8.9, 'Now Showing', 'https://example.com/endgame.jpg'),
  ('The Lion King', 'Animation', 8.5, 'Upcoming', 'https://example.com/lionking.jpg');


INSERT INTO MovieCast (movie_id, person_name, role)
VALUES
  (1, 'Robert Downey Jr.', 'Iron Man'),
  (1, 'Chris Evans', 'Captain America'),
  (2, 'Donald Glover', 'Simba');


INSERT INTO Review (movie_id, content, review_date, reviewer_name)
VALUES
  (1, 'An epic conclusion to the saga!', '2025-06-11 14:30:00', 'John Doe'),
  (2, 'A beautiful remake with stunning visuals.', '2025-06-10 16:00:00', 'Jane Smith');

INSERT INTO Show (screen_id, movie_id, show_datetime)
VALUES
  (1, 1, '2025-06-12 18:00:00'),
  (2, 2, '2025-06-13 20:00:00');


INSERT INTO ShowSeat (show_id, seat_id, is_available)
VALUES
  (1, 1, 1), (1, 2, 1), (1, 3, 1),
  (2, 4, 1), (2, 5, 1), (2, 6, 1);


INSERT INTO [User] (name, email, phone)
VALUES
  ('Alice Johnson', 'alice@example.com', '9876543210'),
  ('Bob Williams', 'bob@example.com', '9123456789');


INSERT INTO Membership (user_id, current_points)
VALUES
  (1, 100),
  (2, 50);

INSERT INTO Booking (user_id, show_id, booking_datetime, total_cost)
VALUES
  (1, 1, '2025-06-11 15:00:00', 500.00),
  (2, 2, '2025-06-11 17:00:00', 400.00);

-- Insert into Ticket Table
INSERT INTO Ticket (booking_id, show_seat_id, qr_code, delivery_method, is_downloaded, scanned_at)
VALUES
(101, 1, 'QR1234567890', 'WhatsApp', 0, NULL),
(102, 2, 'QR0987654321', 'App', 1, '2025-06-16 09:00:00');

-- Insert into PaymentGateway Table
INSERT INTO PaymentGateway (name)
VALUES
('PayPal'),
('Bill Desk'),
('Stripe');

-- Insert into Payment Table
INSERT INTO Payment (booking_id, gateway_id, transaction_amount, transaction_datetime, status, failure_reason, credit_card_name, credit_card_number, expiry_date, cvv)
VALUES
(101, 1, 150.00, '2025-06-15 14:30:00', 'Completed', NULL, 'John Doe', '4111111111111111', '2026-12-31', '123'),
(102, 2, 200.00, '2025-06-16 10:00:00', 'Failed', 'Insufficient funds', 'Jane Smith', '5500000000000004', '2025-11-30', '456');

-- Insert into FoodItem Table
INSERT INTO FoodItem (name, description, is_combo)
VALUES
('Popcorn', 'Salty and crunchy popcorn', 0),
('Nachos', 'Cheese nachos with salsa dip', 0),
('Combo A', 'Popcorn and Nachos combo', 1);

-- Insert into FoodItemSize Table
INSERT INTO FoodItemSize (item_id, size_name, rate)
VALUES
(1, 'Small', 50.00),
(1, 'Large', 80.00),
(2, 'Regular', 100.00),
(2, 'Large', 150.00),
(3, 'Standard', 120.00);

-- Insert into FoodOrder Table
INSERT INTO FoodOrder (booking_id, screen_id, seat_id, order_datetime, total_cost, delivery_method)
VALUES
(101, 1, 1, '2025-06-15 14:00:00', 150.00, 'QR'),
(102, 2, 2, '2025-06-16 09:30:00', 200.00, 'Manual');

-- Insert into FoodOrderItem Table
INSERT INTO FoodOrderItem (order_id, item_id, size_id, quantity, price_at_time)
VALUES
(1, 1, 2, 1, 80.00),
(1, 2, 1, 1, 70.00),
(2, 1, 1, 2, 50.00),
(2, 2, 2, 1, 150.00);

-- Insert into PointsTransaction Table
INSERT INTO PointsTransaction (user_id, amount, points_earned, transaction_datetime, transaction_type)
VALUES
(201, 150.00, 15, '2025-06-15 14:30:00', 'Booking'),
(202, 200.00, 20, '2025-06-16 10:00:00', 'Food'),
(203, 100.00, 10, '2025-06-16 11:00:00', 'Redemption');
