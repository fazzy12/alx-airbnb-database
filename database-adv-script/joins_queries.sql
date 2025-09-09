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
FROM
bookings b
INNER JOIN users u ON b.user_id = u.user_id;

-- LEFT JOIN to retrieve all properties and their reviews, including properties that have no reviews.
SELECT
p.property_id,
p.title,
p.description,
p.price_per_night,
r.review_id,
r.rating,
r.comment
r.created_at AS review_date
FROM properties p
LEFT JOIN reviews r ON p.property_id = r.property_id;

--  FULL OUTER JOIN to retrieve all users and all bookings, even if the user has no booking or a booking is not linked to a user.
SELECT
u.user_id,
u.first_name,
u.last_name,
u.email,
b.booking_id,
b.start_date,
b.end_date,
b.status
FROM users u
FULL OUTER JOIN bookings b ON u.user_id = b.user_id;
