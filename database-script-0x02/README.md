# Database Seeding Script

This directory contains the SQL script to populate the AirBnB clone database with realistic sample data.

## Files

- `seed.sql`: SQL script containing INSERT statements for sample data
- `README.md`: This documentation file

## Sample Data Overview

### Users (7 records)
- **3 Hosts**: Sarah Johnson, Michael Chen, Emily Rodriguez
- **3 Guests**: David Kim, Jessica Williams, Alex Martinez  
- **1 Admin**: Admin User

### Properties (6 records)
- **2 properties per host** across different locations:
  - New York, NY - Cozy Downtown Loft ($125/night)
  - Miami Beach, FL - Beachfront Paradise ($275/night)
  - Aspen, CO - Mountain Retreat Cabin ($195/night)
  - San Francisco, CA - Urban Studio Apartment ($145/night)
  - Lake Tahoe, CA - Lakeside Cottage ($165/night)
  - Boston, MA - Historic Townhouse ($210/night)

### Bookings (6 records)
- **Multiple bookings per guest** with different statuses:
  - 4 confirmed bookings
  - 2 pending bookings
  - Various date ranges and prices

### Payments (4 records)
- **One payment per confirmed booking**
- **Multiple payment methods**: credit_card, paypal, stripe
- **Realistic amounts** matching booking totals

### Reviews (3 records)
- **Ratings**: 4-5 stars
- **Detailed comments** about the stay experience
- **One review per completed booking**

### Messages (4 records)
- **Guest-host conversations**
- **Realistic message content** about availability and questions
- **Timestamps showing conversation flow**

## Usage

### Prerequisites
1. Ensure the database schema has been created using the `schema.sql` script
2. PostgreSQL database should be running

### Running the Seed Script


# Navigate to the script directory
cd database-script-0x02

# Execute the seed script
psql -d airbnb_clone -f seed.sql

### Expected Output
```

      status
-------------------
 Database seeded successfully with sample data!
(1 row)
```

# Data Characteristics
## Realistic Data Patterns

- Geographic diversity: Properties in 6 different cities

- Price variation: $125-275/night range reflecting real-world pricing

- Date ranges: Future booking dates for realistic scenario testing

- Status mix: Combination of confirmed and pending bookings

- Payment methods: Variety of payment options

## Data Integrity
- Referential integrity: All foreign keys reference existing records

- Consistent timestamps: created_at dates are chronologically logical

- Proper relationships: Users have appropriate roles and relationships


## Test Scenarios Enabled
1. User authentication: Multiple user accounts with different roles

2. Property search: Various locations, prices, and property types

3. Booking workflow: Complete flow from pending to confirmed status

4. Payment processing: Different payment methods and amounts

5. Review system: Realistic reviews with ratings and comments

6. Messaging: Guest-host communication examples

## Customization
To modify the sample data:

1. Edit the seed.sql file

2. Change UUID values, names, dates, or other attributes as needed

3. Re-run the seed script

## Notes
- All passwords are placeholder hashes (replace with real hashes in production)

- UUIDs are hardcoded for predictable relationships in testing

- Dates are set in the future for realistic booking scenarios

- Financial amounts are realistic for short-term rental pricing