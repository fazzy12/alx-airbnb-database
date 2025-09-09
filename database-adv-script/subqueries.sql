-- Non-correlated subquery: Find properties where average rating is greater than 4.0
SELECT *
FROM properties
WHERE id IN (
    SELECT property_id
    FROM Reviews
    GROUP BY property_id
    HAVING AVG(rating) > 4.0
);

-- Correlated subquery: Find users who have made more than 3 bookings
SELECT *
FROM Users u
WHERE (
    SELECT COUNT(*)
    FROM Bookings b
    WHERE b.user_id = u.id
) > 3;