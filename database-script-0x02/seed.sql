-- Seed data for AirBnB Clone Database

-- 1. Insert sample users
INSERT INTO users (user_id, first_name, last_name, email, password_hash, phone_number, role, created_at) VALUES
-- Host users
('a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11', 'Sarah', 'Johnson', 'sarah.johnson@email.com', '$2b$10$examplehash1234567890abcdefghij', '+1-555-0101', 'host', '2024-01-15 09:30:00'),
('b1eebc99-9c0b-4ef8-bb6d-6bb9bd380a12', 'Michael', 'Chen', 'michael.chen@email.com', '$2b$10$examplehash1234567890abcdefghij', '+1-555-0102', 'host', '2024-01-20 14:15:00'),
('c2eebc99-9c0b-4ef8-bb6d-6bb9bd380a13', 'Emily', 'Rodriguez', 'emily.rodriguez@email.com', '$2b$10$examplehash1234567890abcdefghij', '+1-555-0103', 'host', '2024-02-05 11:45:00'),

-- Guest users
('d3eebc99-9c0b-4ef8-bb6d-6bb9bd380a14', 'David', 'Kim', 'david.kim@email.com', '$2b$10$examplehash1234567890abcdefghij', '+1-555-0104', 'guest', '2024-02-10 16:20:00'),
('e4eebc99-9c0b-4ef8-bb6d-6bb9bd380a15', 'Jessica', 'Williams', 'jessica.williams@email.com', '$2b$10$examplehash1234567890abcdefghij', '+1-555-0105', 'guest', '2024-02-12 08:30:00'),
('f5eebc99-9c0b-4ef8-bb6d-6bb9bd380a16', 'Alex', 'Martinez', 'alex.martinez@email.com', '$2b$10$examplehash1234567890abcdefghij', '+1-555-0106', 'guest', '2024-02-15 13:45:00'),

-- Admin user
('g6eebc99-9c0b-4ef8-bb6d-6bb9bd380a17', 'Admin', 'User', 'admin@airbnbclone.com', '$2b$10$adminhash1234567890abcdefghij', '+1-555-0000', 'admin', '2024-01-01 00:00:00');

-- 2. Insert sample properties
INSERT INTO properties (property_id, host_id, name, description, location, pricepernight, created_at, updated_at) VALUES
-- Sarah's properties
('h7eebc99-9c0b-4ef8-bb6d-6bb9bd380a18', 'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11', 'Cozy Downtown Loft', 'Beautiful loft in the heart of downtown with amazing city views. Perfect for couples or solo travelers.', '123 Main St, New York, NY', 125.00, '2024-01-16 10:00:00', '2024-01-16 10:00:00'),
('i8eebc99-9c0b-4ef8-bb6d-6bb9bd380a19', 'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11', 'Beachfront Paradise', 'Stunning beachfront property with private access. Wake up to the sound of ocean waves.', '456 Ocean Dr, Miami Beach, FL', 275.00, '2024-01-25 14:30:00', '2024-01-25 14:30:00'),

-- Michael's properties
('j9eebc99-9c0b-4ef8-bb6d-6bb9bd380a20', 'b1eebc99-9c0b-4ef8-bb6d-6bb9bd380a12', 'Mountain Retreat Cabin', 'Secluded cabin in the mountains with hot tub and fireplace. Perfect for nature lovers.', '789 Mountain Rd, Aspen, CO', 195.00, '2024-01-22 09:15:00', '2024-01-22 09:15:00'),
('k0eebc99-9c0b-4ef8-bb6d-6bb9bd380a21', 'b1eebc99-9c0b-4ef8-bb6d-6bb9bd380a12', 'Urban Studio Apartment', 'Modern studio apartment in trendy neighborhood. Close to restaurants and nightlife.', '321 Urban Ave, San Francisco, CA', 145.00, '2024-02-01 16:45:00', '2024-02-01 16:45:00'),

-- Emily's properties
('l1eebc99-9c0b-4ef8-bb6d-6bb9bd380a22', 'c2eebc99-9c0b-4ef8-bb6d-6bb9bd380a13', 'Lakeside Cottage', 'Charming cottage on the lake with fishing dock and canoe. Family-friendly environment.', '654 Lakeview Dr, Lake Tahoe, CA', 165.00, '2024-02-06 11:00:00', '2024-02-06 11:00:00'),
('m2eebc99-9c0b-4ef8-bb6d-6bb9bd380a23', 'c2eebc99-9c0b-4ef8-bb6d-6bb9bd380a13', 'Historic Townhouse', 'Beautifully restored historic townhouse with original features. Walking distance to museums.', '987 Heritage St, Boston, MA', 210.00, '2024-02-08 13:20:00', '2024-02-08 13:20:00');

-- 3. Insert sample bookings
INSERT INTO bookings (booking_id, property_id, user_id, start_date, end_date, total_price, status, created_at) VALUES
-- David's bookings
('n3eebc99-9c0b-4ef8-bb6d-6bb9bd380a24', 'h7eebc99-9c0b-4ef8-bb6d-6bb9bd380a18', 'd3eebc99-9c0b-4ef8-bb6d-6bb9bd380a14', '2024-03-15', '2024-03-20', 625.00, 'confirmed', '2024-02-20 10:30:00'),
('o4eebc99-9c0b-4ef8-bb6d-6bb9bd380a25', 'j9eebc99-9c0b-4ef8-bb6d-6bb9bd380a20', 'd3eebc99-9c0b-4ef8-bb6d-6bb9bd380a14', '2024-04-10', '2024-04-15', 975.00, 'pending', '2024-02-25 14:45:00'),

-- Jessica's bookings
('p5eebc99-9c0b-4ef8-bb6d-6bb9bd380a26', 'i8eebc99-9c0b-4ef8-bb6d-6bb9bd380a19', 'e4eebc99-9c0b-4ef8-bb6d-6bb9bd380a15', '2024-03-22', '2024-03-27', 1375.00, 'confirmed', '2024-02-18 09:15:00'),
('q6eebc99-9c0b-4ef8-bb6d-6bb9bd380a27', 'm2eebc99-9c0b-4ef8-bb6d-6bb9bd380a23', 'e4eebc99-9c0b-4ef8-bb6d-6bb9bd380a15', '2024-05-01', '2024-05-05', 840.00, 'confirmed', '2024-02-28 16:20:00'),

-- Alex's bookings
('r7eebc99-9c0b-4ef8-bb6d-6bb9bd380a28', 'l1eebc99-9c0b-4ef8-bb6d-6bb9bd380a22', 'f5eebc99-9c0b-4ef8-bb6d-6bb9bd380a16', '2024-03-08', '2024-03-12', 660.00, 'confirmed', '2024-02-22 11:30:00'),
('s8eebc99-9c0b-4ef8-bb6d-6bb9bd380a29', 'k0eebc99-9c0b-4ef8-bb6d-6bb9bd380a21', 'f5eebc99-9c0b-4ef8-bb6d-6bb9bd380a16', '2024-06-15', '2024-06-20', 725.00, 'pending', '2024-03-01 13:45:00');

-- 4. Insert sample payments
INSERT INTO payments (payment_id, booking_id, amount, payment_date, payment_method) VALUES
('t9eebc99-9c0b-4ef8-bb6d-6bb9bd380a30', 'n3eebc99-9c0b-4ef8-bb6d-6bb9bd380a24', 625.00, '2024-02-20 10:35:00', 'credit_card'),
('u0eebc99-9c0b-4ef8-bb6d-6bb9bd380a31', 'p5eebc99-9c0b-4ef8-bb6d-6bb9bd380a26', 1375.00, '2024-02-18 09:20:00', 'paypal'),
('v1eebc99-9c0b-4ef8-bb6d-6bb9bd380a32', 'q6eebc99-9c0b-4ef8-bb6d-6bb9bd380a27', 840.00, '2024-02-28 16:25:00', 'stripe'),
('w2eebc99-9c0b-4ef8-bb6d-6bb9bd380a33', 'r7eebc99-9c0b-4ef8-bb6d-6bb9bd380a28', 660.00, '2024-02-22 11:35:00', 'credit_card');

-- 5. Insert sample reviews
INSERT INTO reviews (review_id, property_id, user_id, rating, comment, created_at) VALUES
('x3eebc99-9c0b-4ef8-bb6d-6bb9bd380a34', 'h7eebc99-9c0b-4ef8-bb6d-6bb9bd380a18', 'd3eebc99-9c0b-4ef8-bb6d-6bb9bd380a14', 5, 'Amazing stay! The loft was even better than described. Sarah was a wonderful host.', '2024-03-21 09:00:00'),
('y4eebc99-9c0b-4ef8-bb6d-6bb9bd380a35', 'i8eebc99-9c0b-4ef8-bb6d-6bb9bd380a19', 'e4eebc99-9c0b-4ef8-bb6d-6bb9bd380a15', 4, 'Beautiful beachfront property. The views were stunning, but the WiFi was a bit slow.', '2024-03-28 14:30:00'),
('z5eebc99-9c0b-4ef8-bb6d-6bb9bd380a36', 'l1eebc99-9c0b-4ef8-bb6d-6bb9bd380a22', 'f5eebc99-9c0b-4ef8-bb6d-6bb9bd380a16', 5, 'Perfect lakeside getaway! The canoe was so much fun and the cabin was very cozy.', '2024-03-13 16:45:00');

-- 6. Insert sample messages
INSERT INTO messages (message_id, sender_id, recipient_id, message_body, sent_at) VALUES
('a6eebc99-9c0b-4ef8-bb6d-6bb9bd380a37', 'd3eebc99-9c0b-4ef8-bb6d-6bb9bd380a14', 'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11', 'Hi Sarah, I''m interested in your downtown loft. Is it available for March 15-20?', '2024-02-19 15:30:00'),
('b7eebc99-9c0b-4ef8-bb6d-6bb9bd380a38', 'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11', 'd3eebc99-9c0b-4ef8-bb6d-6bb9bd380a14', 'Hi David! Yes, those dates are available. The loft would be perfect for your stay!', '2024-02-19 16:45:00'),
('c8eebc99-9c0b-4ef8-bb6d-6bb9bd380a39', 'e4eebc99-9c0b-4ef8-bb6d-6bb9bd380a15', 'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11', 'Hello Sarah, I saw your beachfront property. Are pets allowed?', '2024-02-17 11:20:00'),
('d9eebc99-9c0b-4ef8-bb6d-6bb9bd380a40', 'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11', 'e4eebc99-9c0b-4ef8-bb6d-6bb9bd380a15', 'Hi Jessica! Unfortunately, we don''t allow pets at the beach property due to allergies.', '2024-02-17 12:30:00');

-- Display success message
SELECT 'Database seeded successfully with sample data!' AS status;