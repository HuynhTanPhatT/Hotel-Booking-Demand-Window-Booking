/* Create "group_type" column based on Window Booking:
	- early_window_booking : window_booking > 30 days
	- short_window_booking : window_booking <= 30 days */

ALTER TABLE hotel_bookings
ADD group_type varchar(50);

UPDATE hotel_bookings
SET group_type = 
	(CASE 
		WHEN window_booking <= 30 THEN 'short_window_booking'
		WHEN window_booking > 30 THEN 'early_window_booking' END);
------------------------------------------------------------------------