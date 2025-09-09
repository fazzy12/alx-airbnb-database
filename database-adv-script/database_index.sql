-- Indexes for Users table
EXPLAIN ANALYZE 
CREATE INDEX idx_users_email ON Users(email);
CREATE INDEX idx_users_created_at ON Users(created_at);
CREATE INDEX idx_users_first_last_name ON Users(first_name, last_name);

-- Indexes for Bookings table
CREATE INDEX idx_bookings_user_id ON Bookings(user_id);
CREATE INDEX idx_bookings_property_id ON Bookings(property_id);
CREATE INDEX idx_bookings_start_date ON Bookings(start_date);
CREATE INDEX idx_bookings_end_date ON Bookings(end_date);
CREATE INDEX idx_bookings_status ON Bookings(status);
CREATE INDEX idx_bookings_user_status ON Bookings(user_id, status);

-- Indexes for Properties table
CREATE INDEX idx_properties_host_id ON Properties(host_id);
CREATE INDEX idx_properties_price ON Properties(price);
CREATE INDEX idx_properties_location ON Properties(location);
CREATE INDEX idx_properties_created_at ON Properties(created_at);
CREATE INDEX idx_properties_price_location ON Properties(price, location);

-- Indexes for Reviews table
CREATE INDEX idx_reviews_property_id ON Reviews(property_id);
CREATE INDEX idx_reviews_rating ON Reviews(rating);
CREATE INDEX idx_reviews_created_at ON Reviews(created_at);
