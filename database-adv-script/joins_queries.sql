-- INNER JOIN to retrieve all bookings and the respective users who made those bookings
SELECT
    b.booking_id,
    b.start_date,
    b.end_date,
    b.status,
    u.user_id,
    u.first_name,
    u.last_name,
    u.email
FROM Bookings b
INNER JOIN Users u ON b.user_id = u.user_id
ORDER BY b.start_date DESC, u.last_name ASC;

-- LEFT JOIN to retrieve all properties and their reviews, including properties that have no reviews
SELECT
    p.property_id,
    p.title,
    p.description,
    p.price_per_night,
    r.review_id,
    r.rating,
    r.comment,
    r.created_at AS review_date
FROM Properties p
LEFT JOIN Reviews r ON p.property_id = r.property_id
ORDER BY p.price_per_night DESC, r.rating DESC NULLS LAST;

-- FULL OUTER JOIN to retrieve all users and all bookings, even if the user has no booking or a booking is not linked to a user
SELECT
    u.user_id,
    u.first_name,
    u.last_name,
    u.email,
    b.booking_id,
    b.start_date,
    b.end_date,
    b.status
FROM Users u
FULL OUTER JOIN Bookings b ON u.user_id = b.user_id
ORDER BY u.last_name ASC, b.start_date DESC NULLS LAST;
