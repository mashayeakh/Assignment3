-- 1. Retrieve booking information along with Customer name and Vehicle name
SELECT
    b.b_id AS booking_id,
    u.u_name AS customer_name,
    v.v_name AS vehicle_name,
    b.b_start_date AS start_date,
    b.b_end_date AS end_date,
    b.b_booking_status AS status
FROM
    bookings b
    JOIN users u ON b.u_id = u.u_id
    JOIN vehicles v ON b.v_id = v.v_id
WHERE
    u.user_role = 'Customer';

-- 2. Find all vehicles that have never been booked never appeared in the bookings list and if its pending still it works..
SELECT *
FROM vehicles v
WHERE
    NOT EXISTS (
        SELECT 1
        FROM bookings b
        WHERE
            b.v_id = v.v_id
    );
--3.Retrieve all available vehicles of a specific type (e.g. cars).
SELECT
    v.v_id AS vehicle_id,
    v.v_name AS name,
    v.v_type AS type,
    v.v_model AS model,
    v.v_registration_number AS registration_number,
    v.v_rental_price AS rental_price,
    v.v_availability_status AS status
FROM vehicles v
WHERE
    v.v_availability_status = 'available'
    AND v.v_type = 'car'
    --4.Find the total number of bookings for each vehicle and display only those vehicles that have more than 2 bookings.
SELECT
    v.v_name AS vehicle_name,
    COUNT(b.b_id) AS total_bookings
FROM vehicles v
    JOIN bookings b ON v.v_id = b.v_id
GROUP BY
    v.v_id,
    v.v_name
HAVING
    COUNT(b.b_id) > 2;