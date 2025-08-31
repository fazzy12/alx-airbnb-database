# Database Normalization - AirBnB Clone

## Overview

This document explains the normalization process applied to the AirBnB clone database schema to achieve Third Normal Form (3NF). The normalization process ensures data integrity, reduces redundancy, and improves overall database performance.

## Schema Analysis and Normalization Steps

The initial database schema was already well-structured but required some refinements to fully comply with 3NF principles.

### First Normal Form (1NF) Compliance

The original schema already satisfied 1NF requirements:

- All tables had primary keys
- All columns contained atomic values
- No repeating groups of data existed
- All values were of consistent types within columns

### Second Normal Form (2NF) Compliance

The schema also satisfied 2NF requirements:

- All tables had proper primary keys
- All non-key attributes were fully functionally dependent on the primary keys
- No partial dependencies existed

## Normalization Improvements

### 1. Location Field Normalization

**Issue:** The location field in the properties table was a single VARCHAR field that potentially contained multiple pieces of information (address, city, state, country).

**Solution:** Decomposed the location field into discrete components:

```sql
-- Before:
location VARCHAR NOT NULL

-- After:
address_line1 VARCHAR NOT NULL
address_line2 VARCHAR
city VARCHAR NOT NULL
state VARCHAR NOT NULL
country VARCHAR NOT NULL
postal_code VARCHAR
latitude DECIMAL
longitude DECIMAL
```

**Benefit:** This change eliminates potential data redundancy and enables more precise querying and indexing based on specific location components.

### 2. Removal of Derived Data

**Issue:** The total_price field in the bookings table was a derived value that could be calculated from other fields (pricepernight × duration of stay).

**Solution:** Removed the total_price column and implemented calculation at query time:

```sql
-- Before:
total_price DECIMAL NOT NULL

-- After:
-- Removed column, calculate as needed:
-- pricepernight * (DATEDIFF(end_date, start_date)) AS total_price
```

**Benefit:** Eliminates the risk of data inconsistency between the stored total_price and the actual calculated value.

### 3. Preparation for Future Many-to-Many Relationships

**Issue:** The schema didn't account for potential many-to-many relationships that might be needed in the future (e.g., property amenities, user roles).

**Solution:** Added documentation for potential junction tables:

```sql
-- For property amenities:
Table property_amenities {
  property_id VARCHAR NOT NULL
  amenity_id INTEGER NOT NULL
  PRIMARY KEY (property_id, amenity_id)
}

Table amenities {
  amenity_id INTEGER PRIMARY KEY
  name VARCHAR NOT NULL
  category VARCHAR NOT NULL
}

-- For user roles (if needed):
Table user_roles {
  user_id VARCHAR NOT NULL
  role_id INTEGER NOT NULL
  PRIMARY KEY (user_id, role_id)
}

Table roles {
  role_id INTEGER PRIMARY KEY
  role_name VARCHAR NOT NULL
  permissions TEXT
}
```

**Benefit:** Provides a scalable foundation for future feature enhancements without requiring significant schema changes.

## Final Normalized Schema

After implementing these normalization improvements, the database schema achieves 3NF:

```dbml
// AirBnB Clone Database Schema - Normalized Version

Table users {
  user_id varchar [primary key]
  first_name varchar [not null]
  last_name varchar [not null]
  email varchar [not null, unique]
  password_hash varchar [not null]
  phone_number varchar
  role varchar [not null]
  created_at timestamp [default: `CURRENT_TIMESTAMP`]
  
  indexes {
    email
  }
}

Table properties {
  property_id varchar [primary key]
  host_id varchar [not null]
  name varchar [not null]
  description text [not null]
  address_line1 varchar [not null]
  address_line2 varchar
  city varchar [not null]
  state varchar [not null]
  country varchar [not null]
  postal_code varchar
  latitude decimal
  longitude decimal
  pricepernight decimal [not null]
  created_at timestamp [default: `CURRENT_TIMESTAMP`]
  updated_at timestamp [default: `CURRENT_TIMESTAMP`]
  
  indexes {
    host_id
    city
    country
  }
}

Table bookings {
  booking_id varchar [primary key]
  property_id varchar [not null]
  user_id varchar [not null]
  start_date date [not null]
  end_date date [not null]
  status varchar [not null]
  created_at timestamp [default: `CURRENT_TIMESTAMP`]
  
  indexes {
    property_id
    user_id
    start_date
    end_date
  }
}

Table payments {
  payment_id varchar [primary key]
  booking_id varchar [not null]
  amount decimal [not null]
  payment_date timestamp [default: `CURRENT_TIMESTAMP`]
  payment_method varchar [not null]
  
  indexes {
    booking_id
  }
}

Table reviews {
  review_id varchar [primary key]
  property_id varchar [not null]
  user_id varchar [not null]
  rating integer [not null]
  comment text [not null]
  created_at timestamp [default: `CURRENT_TIMESTAMP`]
}

Table messages {
  message_id varchar [primary key]
  sender_id varchar [not null]
  recipient_id varchar [not null]
  message_body text [not null]
  sent_at timestamp [default: `CURRENT_TIMESTAMP`]
}

// Define relationships
Ref: properties.host_id > users.user_id
Ref: bookings.property_id > properties.property_id
Ref: bookings.user_id > users.user_id
Ref: payments.booking_id > bookings.booking_id
Ref: reviews.property_id > properties.property_id
Ref: reviews.user_id > users.user_id
Ref: messages.sender_id > users.user_id
Ref: messages.recipient_id > users.user_id
```

## Benefits of Normalization

### Reduced Data Redundancy
- Location data is now properly structured without duplication
- Eliminated storage of derived data

### Improved Data Integrity
- Structured location data ensures consistent formatting
- Eliminates risk of calculated fields becoming inconsistent

### Enhanced Query Capabilities
- Can now query by specific location components
- Better support for location-based searches and analytics

### Scalability
- Prepared for future many-to-many relationships
- More flexible schema for evolving business requirements

### Maintainability
- Clearer table structures
- Reduced risk of update anomalies

## Conclusion

The normalized schema maintains all the original functionality while improving data integrity, query flexibility, and long-term maintainability. The database now fully complies with Third Normal Form (3NF) requirements, ensuring optimal performance and data consistency for the AirBnB clone application.