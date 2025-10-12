/* Question 1: Why do Short-Window-Booking Groups (<= 30 days) has fewer cancellations than Early-Window-Booking Groups (> 30 days)? */
WITH customer_group_cancellations_market AS (
SELECT	market_segment,
		group_type, 
		booking_status, deposit_type,
		(CASE WHEN booking_status = 'Cancelled' THEN 1 ELSE 0 END) as cancellations
FROM hotel_bookings
),
total_cancellations as (
/*	early: 18.329
	short: 5.675 */
SELECT	SUM(CASE WHEN group_type = 'early_window_booking' THEN cancellations ELSE 0 END) as total_early_cancell,
		SUM(CASE WHEN group_type = 'short_window_booking' THEN cancellations ELSE 0 END) as total_short_cancell
FROM customer_group_cancellations_market
)
SELECT	cgcm.market_segment as market,
	-- Early-Booking
		SUM(CASE WHEN cgcm.group_type = 'early_window_booking' THEN 1 ELSE 0 END) as early_bookings,
		SUM(CASE WHEN cgcm.group_type = 'early_window_booking' THEN cancellations ELSE 0 END) as early_cancell,
		ROUND(
			SUM(CASE WHEN cgcm.group_type = 'early_window_booking' THEN cancellations ELSE 0 END) * 100.0 /
			NULLIF(SUM(CASE WHEN cgcm.group_type = 'early_window_booking' THEN 1 ELSE 0 END),0),2) as early_pct_cancell,
		ROUND(
			SUM(CASE WHEN cgcm.group_type = 'early_window_booking' THEN cancellations ELSE 0 END) * 100.0 /
			NULLIF(tc.total_early_cancell,0),2) as early_pct_total_cancell, 
	-- Last-minute-Booking
		SUM(CASE WHEN cgcm.group_type = 'short_window_booking' THEN 1 ELSE 0 END) as short_bookings,
		SUM(CASE WHEN cgcm.group_type = 'short_window_booking' THEN cancellations ELSE 0 END) as short_cancell,
		ROUND(
			SUM(CASE WHEN cgcm.group_type = 'short_window_booking' THEN cancellations ELSE 0 END) * 100.0 /
			NULLIF(SUM(CASE WHEN cgcm.group_type = 'short_window_booking' THEN 1 ELSE 0 END),0),2) as short_pct_cancell,
		ROUND(
			SUM(CASE WHEN cgcm.group_type = 'short_window_booking' THEN cancellations ELSE 0 END) * 100.0 /
			NULLIF(tc.total_short_cancell,0),2) as short_pct_total_cancell,
		SUM(CASE WHEN cgcm.group_type = 'early_window_booking' and cgcm.deposit_type = 'No Deposit' THEN 1 ELSE 0 END) as early_no_deposit,
		SUM(CASE WHEN cgcm.group_type = 'short_window_booking' and cgcm.deposit_type = 'No Deposit' THEN 1 ELSE 0 END) as short_no_deposit,
		SUM(CASE WHEN cgcm.group_type = 'early_window_booking' and cgcm.deposit_type = 'Refundable' THEN 1 ELSE 0 END) as early_refund,
		SUM(CASE WHEN cgcm.group_type = 'short_window_booking' and cgcm.deposit_type = 'Refundable' THEN 1 ELSE 0 END) as short_refund,
		SUM(CASE WHEN cgcm.group_type = 'early_window_booking' and cgcm.deposit_type = 'Non Refund' THEN 1 ELSE 0 END) as early_nonrefund,
		SUM(CASE WHEN cgcm.group_type = 'short_window_booking' and cgcm.deposit_type = 'Non Refund' THEN 1 ELSE 0 END) as short_nonrefund
FROM customer_group_cancellations_market cgcm
CROSS JOIN total_cancellations tc
WHERE cgcm.market_segment <> 'Undefined'
GROUP BY cgcm.market_segment, tc.total_early_cancell, tc.total_short_cancell
ORDER BY  early_pct_total_cancell desc, short_pct_total_cancell desc;
--------------------------------------------------------------------------------------------------------------------------------
/* Question 2: Within the Early-Window-booking groups, which bucket has the highest cancellations rate (31-90, 91-180, +180) ? */
WITH customer_group_cancellations_bucket AS (
SELECT	group_type, 
		(CASE WHEN booking_status = 'Cancelled' THEN 1 ELSE 0 END) as cancellations,
		bucket
FROM hotel_bookings
),
total_cancellations as (
SELECT	SUM(cancellations) as total_cancellations
FROM customer_group_cancellations_bucket
WHERE group_type = 'early_window_booking'
)
SELECT	cgcb.bucket, 
		COUNT(*) as total_bucket,
		SUM(cancellations) as bucket_cancell,
		ROUND(
			SUM(cancellations) * 100.0 /
			NULLIF(COUNT(*),0),2) as bucket_pct_cancell,
		ROUND(
			SUM(cancellations) * 100.0 /
			NULLIF(tc.total_cancellations,0),2) as total_bucket_pct_cancell
FROM customer_group_cancellations_bucket cgcb
CROSS JOIN total_cancellations tc
WHERE group_type = 'early_window_booking'
GROUP BY cgcb.bucket, tc.total_cancellations
ORDER BY ROUND(SUM(cancellations) * 100.0 / NULLIF(tc.total_cancellations,0),2) DESC;
--------------------------------------------------------------------------------------------------------------------------------
/* Question 3: If the cancellations from Early-Booking groups continue, how much potential revenue will the hotel loss based on ADR ? */
-- Potential Revenue Loss = (ADR * Stay Duration [weekend_nights + week_nights])
WITH revenue_table AS (
SELECT	bucket, hotel_type,
		booking_status, weekend_nights, week_nights, adr
FROM hotel_bookings
WHERE group_type = 'early_window_booking'
)
SELECT	bucket,
	-- City Hotel
		ROUND(SUM(CASE WHEN hotel_type = 'City Hotel' THEN adr * (weekend_nights +  week_nights) ELSE 0 END), 2) AS total_revenue_city,
		ROUND(SUM(CASE WHEN hotel_type = 'City Hotel' AND booking_status = 'Confirmed' THEN adr * (weekend_nights +  week_nights) ELSE 0 END), 2) AS confirmed_revenue_city,
		ROUND(SUM(CASE WHEN hotel_type = 'City Hotel' AND booking_status = 'Cancelled' THEN adr * (weekend_nights +  week_nights) ELSE 0 END), 2) AS potential_loss_city,
		ROUND(
			SUM(CASE WHEN hotel_type = 'City Hotel' AND booking_status = 'Cancelled' THEN adr * (weekend_nights +  week_nights) ELSE 0 END) * 100/ 
			SUM(CASE WHEN hotel_type = 'City Hotel' THEN adr * (weekend_nights +  week_nights) ELSE 0 END), 2) as pct_city_loss,
	-- Resort Hotel
		ROUND(SUM(CASE WHEN hotel_type = 'Resort Hotel' THEN adr * (weekend_nights +  week_nights) ELSE 0 END), 2) AS total_revenue_resort,
		ROUND(SUM(CASE WHEN hotel_type = 'Resort Hotel' AND booking_status = 'Confirmed' THEN adr * (weekend_nights +  week_nights) ELSE 0 END), 2) AS confirmed_revenue_resort,
		ROUND(SUM(CASE WHEN hotel_type = 'Resort Hotel' AND booking_status = 'Cancelled' THEN adr * (weekend_nights +  week_nights) ELSE 0 END), 2) AS potential_loss_resort,
		ROUND(
			SUM(CASE WHEN hotel_type = 'Resort Hotel' AND booking_status = 'Cancelled' THEN adr * (weekend_nights +  week_nights) ELSE 0 END) * 100/ 
			SUM(CASE WHEN hotel_type = 'Resort Hotel' THEN adr * (weekend_nights +  week_nights) ELSE 0 END), 2) as pct_resort_loss
FROM revenue_table
GROUP BY bucket
ORDER BY potential_loss_city desc, potential_loss_resort desc;
--------------------------------------------------------------------------------------------------------------------------------
/* Question 4: Are the ADR of cancelled bookings higher or lower than the ADR of confirmed bookigns?*/
SELECT	bucket,
		SUM(CASE WHEN hotel_type = 'Resort Hotel' AND booking_status = 'Cancelled' THEN 1 ELSE 0 END) as resort_cancell,
		ROUND(AVG(CASE WHEN hotel_type = 'Resort Hotel' AND booking_status = 'Confirmed' THEN adr END),2) as avg_resort_conf,
		ROUND(AVG(CASE WHEN hotel_type = 'Resort Hotel' AND booking_status = 'Cancelled' THEN adr END),2) as avg_resort_cancell,
		SUM(CASE WHEN hotel_type = 'City Hotel' AND booking_status = 'Cancelled' THEN 1 ELSE 0 END) as city_cancell,
		ROUND(AVG(CASE WHEN hotel_type = 'City Hotel' AND booking_status = 'Confirmed' THEN adr END),2) as avg_city_conf,
		ROUND(AVG(CASE WHEN hotel_type = 'City Hotel' AND booking_status = 'Cancelled' THEN adr  END),2) as avg_city_cancell
FROM hotel_bookings
GROUP BY bucket
ORDER BY city_cancell desc, resort_cancell desc;
--------------------------------------------------------------------------------------------------------------------------------