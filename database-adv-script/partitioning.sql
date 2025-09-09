-- create partitioned booking table
CREATE TABLE bookkings_partitioned (
    booking_id INT NOT NULL,
    user_id INT NOT NULL,
    property_id INT NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    status VARCHAR(20) NOT NULL
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (booking_id, start_date)
)PARTITION BY RANGE (start_dsate);

-- Create partitions for diffrent date ranges
CREATE TABLE BOOKING_2022 PARTITION OF bookings_partitioned
    FOR VALUES FROM ('2022-01-01') TO ('2023-02-02');

CREATE TABLE BOOKING_2023 PARTITION OF bookings_partitioned
    FOR VALUES FROM ('2023-01-01') TO ('2024-02-02');

CREATE TABLE BOOKING_2024 PARTITION OF bookings_partitioned
    FOR VALUES FROM ('2024-01-01') TO ('2025-02-02');

CREATE TABLE BOOKING_2025 PARTITION OF bookings_partitioned
    FOR VALUES FROM ('2025-01-01') TO ('2026-02-02');

CREATE TABLE BOOKING_2025 PARTITION OF bookings_partitioned
    FOR VALUES FROM ('2026-01-01') TO (MAXVALUE);


-- Create indexes on the partitioned table
CREATE INDEX idx_bookings_partitioned_user_id ON Bookings_partitioned(user_id);
CREATE INDEX idx_bookings_partitioned_property_id ON Bookings_partitioned(property_id);
CREATE INDEX idx_bookings_partitioned_status ON Bookings_partitioned(status);


-- Copy data from original table to partitioned table
INSERT INTO Bookings_partitioned;
SELECT * FROM Bookings;

-- Test query performance on partitioned table
EXPLAIN ANALYSE
SELECT * FROM Bookings_partitioned
WHERE start_date BETWEEN '2023-03-01' AND '2023-06-30';

-- Compare with original table performance
EXPLAIN ANALYZE
SELECT * FROM Bookings
WHERE start_date BETWEEN '2023-06-01' AND '2023-06-30';
