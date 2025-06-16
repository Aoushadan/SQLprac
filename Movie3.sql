
UPDATE Screen
SET capacity = 160
WHERE name = 'Screen A';

UPDATE Seat
SET seat_number = 'A4'
WHERE seat_id = 4;


UPDATE Movie
SET rating = 9.0, status = 'Now Showing'
WHERE title = 'Avengers: Endgame';


UPDATE MovieCast
SET role = 'Black Panther'
WHERE person_name = 'Chadwick Boseman';


UPDATE Review
SET content = 'An unforgettable cinematic experience!'
WHERE reviewer_name = 'John Doe';


UPDATE Show
SET show_datetime = '2025-06-12 20:00:00'
WHERE show_id = 1;


UPDATE ShowSeat
SET is_available = 0
WHERE show_id = 1 AND seat_id = 1;


UPDATE [User]
SET phone = '9876543211'
WHERE user_id = 1;


UPDATE Membership
SET current_points = 120
WHERE user_id = 1;


UPDATE Booking
SET total_cost = 550.00
WHERE booking_id = 1;



