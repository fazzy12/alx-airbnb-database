# AirBnB Clone Database Schema

This directory contains the SQL Data Definition Language (DDL) for the AirBnB clone database, following the exact specification provided.

## Database Structure

### Tables Created

1. **users** - Stores user information and authentication details
2. **properties** - Contains property listings with location and pricing
3. **bookings** - Manages reservation records between users and properties
4. **payments** - Stores payment transactions for bookings
5. **reviews** - Holds user reviews and ratings for properties
6. **messages** - Manages communication between users

## Features Implemented

### Data Types & Constraints
- **UUID Primary Keys**: All tables use UUIDv4 as primary keys
- **ENUM Types**: Proper ENUM types for categorical fields:
  - `user_role`: guest, host, admin
  - `booking_status`: pending, confirmed, canceled
  - `payment_method_type`: credit_card, paypal, stripe
- **CHECK Constraints**: Rating validation (1-5) in reviews table
- **NOT NULL Constraints**: All required fields as per specification
- **UNIQUE Constraint**: Email field in users table

### Relationships
- **Foreign Key Constraints**: All specified relationships implemented with ON DELETE CASCADE
- **Referential Integrity**: Ensures data consistency across related tables

### Indexing
- **Primary Key Indexes**: Automatic indexing on all primary keys
- **Additional Indexes**:
  - `idx_users_email` - Users email field
  - `idx_properties_host_id` - Properties host_id field
  - `idx_bookings_property_id` - Bookings property_id field
  - `idx_bookings_user_id` - Bookings user_id field
  - `idx_payments_booking_id` - Payments booking_id field

### Automatic Timestamps
- **created_at**: Default current timestamp for all tables
- **updated_at**: Auto-updating timestamp for properties table (via trigger)

## Installation

1. Ensure PostgreSQL is installed and running
2. Create the database: `CREATE DATABASE airbnb_clone;`
3. Execute the schema: `psql -d airbnb_clone -f schema.sql`

## Usage

The database is now ready with:
- All 6 tables created according to specification
- Proper constraints and relationships
- Optimized indexes for performance
- Data validation rules enforced
- Automatic timestamp management

## File Structure
database-script-0x01/
- schema.sql # Main SQL DDL script
- README.md # This documentation file


## Notes
- Requires PostgreSQL with UUID-OSSP extension
- All field names and types match the specification exactly
- The schema includes proper error handling and data integrity features
- Indexes are optimized for the most common query patterns