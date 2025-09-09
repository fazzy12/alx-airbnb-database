-- Initial query (before optimization)
SELECT
    b.booking_id,
    b.start_date,
    b.end_date,
    b.status as booking_status,
    u.user_id,
    u.first_name,
    u.last_name,
    u.email,
    p.property_id
    p.title as property_title,
    p.location as property_location,
    p.price_per_night,
    pay.payment_id,
    pay.amount,
    pay.status as payment_status,
    pay.created as payment_date
FROM Bookings b
INNER JOIN Users u ON b.user_id = u.user_id
INNER JOIN Properties p ON b.property_id = p.property_id
LEFT JOIN Payments pay ON  b.booking_id = pay.booking_id
ORDER BY b.start_date DESC

-- Use EXPLAIN ANALYZE to analyze the initial query performance
EXPLAIN ANALYZE
SELECT
    b.booking_id,
    b.start_date,
    b.end_date,
    b.status as booking_status,
    u.user_id,
    u.first_name,
    u.last_name,
    u.email,
    p.property_id
    p.title as property_title,
    p.location as property_location,
    p.price_per_night,
    pay.payment_id,
    pay.amount,
    pay.status as payment_status,
    pay.created as payment_date
FROM Bookings b
INNER JOIN Users u ON b.user_id = u.user_id
INNER JOIN Properties p ON b.property_id = p.property_id
LEFT JOIN Payments pay ON  b.booking_id = pay.booking_id
ORDER BY b.start_date DESC

-- Optimized query (after optimization)
SELECT
    b.booking_id,
    b.start_date,
    bend_date,
    b.status as booking_status,
    u.user_id,
    u.first_name,
    u.last_name,
    u.email,
    p.property_id
    p.title as property_title,
    p.location as property_loacation,
    p.price_per_night,
    pay.payament_id,
    pay.amount,
    pay.status as payment_status,
    pay.craeted_at as payment_date
FROM Booking b
INNER JOIN uSERS U ON b.user_id
INNER JOIN properties p ON b.property_id = p.property_id
LEFT JOIN payment pay ON b.booking_id = pay.booking_id
WHERE b.start_date >= CURRENT_DATE - INTERVAL '6 months'
and b.status IN ('confirm', 'completed')
ORDER BY B.start_date DESC

-- Create indexes to support the optimized querry
CREATE INDEX idx_booking_start_date ON Booking(start_date);
CREATE INDEX idx__bookings_status ON Bookings(status)
CREATE INDEX idx_payments_booking_id ON payments(booking_id);
