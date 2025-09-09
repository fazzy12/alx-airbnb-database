-- Find the total number of bookings made by each user, ordered by the number of bookings in descending order.
SELECT
    user_id,
    COUNT(*) AS total_bookings
    FROM Bookings
GROUP BY user_id
ORDER BY total_bookings DESC;

-- Query 2: Rank properties based on total number of bookings
SELECT
    property_id,
    COUNT(*) AS total_bookings,
    RANK() OVER (ORDER BY COUNT(*) DESC) AS booking_rank
    ROW_NUMBER() OVER (ORDER BY COUNT(*) DESC) AS booking_row_number
FROM Bookings
GROUP BY property_id
ORDER BY total_bookings DESC;
