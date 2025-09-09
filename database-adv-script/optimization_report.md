# Query Optimization Report

## Initial Query Analysis

### Query Description
The initial query retrieves all bookings along with user details, property details, and payment details. It joins four tables: Bookings, Users, Properties, and Payments.

### Performance Analysis (Before Optimization)
```sql
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
    p.property_id,
    p.title as property_title,
    p.location as property_location,
    p.price_per_night,
    pay.payment_id,
    pay.amount,
    pay.status as payment_status,
    pay.created_at as payment_date
FROM Bookings b
INNER JOIN Users u ON b.user_id = u.user_id
INNER JOIN Properties p ON b.property_id = p.property_id
LEFT JOIN Payments pay ON b.booking_id = pay.booking_id
ORDER BY b.start_date DESC;