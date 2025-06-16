

DELETE FROM ShowSeat WHERE show_id = 1 AND seat_id = 1;


DELETE FROM ShowSeat WHERE show_id = 1;


DELETE FROM Show WHERE show_id = 1;



DELETE FROM Seat WHERE seat_number = 'A1';


DELETE FROM ShowSeat WHERE show_id IN (SELECT show_id FROM Show WHERE screen_id = 1);

-- 2. Delete from Seat Table where screen_id is 1
DELETE FROM Seat WHERE screen_id = 1;

-- 3. Delete from Screen Table where screen_id is 1
DELETE FROM Screen WHERE screen_id = 1;

DELETE FROM Seat WHERE screen_id = 1;

DELETE FROM MovieCast WHERE person_name = 'Chadwick Boseman';


DELETE FROM MovieCast WHERE movie_id = 1;


DELETE FROM Movie WHERE movie_id = 1;



DELETE FROM Review WHERE reviewer_name = 'John Doe';


DELETE FROM Booking WHERE booking_id = 1;


DELETE FROM Membership WHERE user_id = 1;


DELETE FROM [User] WHERE user_id = 1;


ALTER TABLE Screen
ADD Popcorn varchar(55)
