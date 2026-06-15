# Assignment 3 - Football Ticket Booking Database

This repository contains the database schema and SQL queries for a football ticket booking system. It covers relational table design, constraints, and common query patterns in PostgreSQL.

## Project Overview

The project models a simple ticket booking platform where users can book seats for football matches. The schema defines three related tables—`Users`, `Matches`, and `Bookings`—and the query file demonstrates filtering, pattern matching, joins, subqueries, and pagination.

## Contents

### `schema.sql`

Defines and creates the database structure:

- Drops existing tables (`Bookings`, `Matches`, `Users`) if they exist
- Creates `Users` with roles (`Ticket Manager`, `Football Fan`), unique email, and optional phone number
- Creates `Matches` with fixture details, tournament category, base ticket price, and match status (`Available`, `Selling Fast`, `Sold Out`, `Postponed`)
- Creates `Bookings` linking users to matches with seat number, payment status, and total cost
- Enforces primary keys, foreign keys, and `CHECK` constraints on prices and enum-like values

### `queries.sql`

Contains seven SQL queries that practice core database operations:

1. **Filter matches** — Select available Champions League fixtures and their ticket prices
2. **Pattern matching** — Find users whose names start with `Tanvir` or contain `Haque` (case-insensitive)
3. **NULL handling** — List bookings with missing payment status, using `COALESCE` to label them as `Action Required`
4. **Inner join** — Combine booking, user, and match data into a single result set
5. **Left join** — List all users and their bookings, including users with no bookings
6. **Subquery** — Find bookings whose total cost is above the average booking cost
7. **Sorting and pagination** — Return the second and third most expensive matches using `ORDER BY`, `LIMIT`, and `OFFSET`

## Database Schema Summary

### `Users`

| Column         | Description                        |
| -------------- | ---------------------------------- |
| `user_id`      | Primary key                        |
| `full_name`    | User's full name                   |
| `email`        | Unique email address               |
| `role`         | `Ticket Manager` or `Football Fan` |
| `phone_number` | Optional contact number            |

### `Matches`

| Column                | Description                                             |
| --------------------- | ------------------------------------------------------- |
| `match_id`            | Primary key                                             |
| `fixture`             | Match description (e.g., team names)                    |
| `tournament_category` | Tournament name (e.g., Champions League)                |
| `base_ticket_price`   | Base price per ticket (non-negative)                    |
| `match_status`        | `Available`, `Selling Fast`, `Sold Out`, or `Postponed` |

### `Bookings`

| Column           | Description                                        |
| ---------------- | -------------------------------------------------- |
| `booking_id`     | Primary key                                        |
| `user_id`        | Foreign key to `Users`                             |
| `match_id`       | Foreign key to `Matches`                           |
| `seat_number`    | Optional seat identifier                           |
| `payment_status` | `Pending`, `Confirmed`, `Cancelled`, or `Refunded` |
| `total_cost`     | Total booking cost (non-negative)                  |

## Setup

1. Ensure PostgreSQL is installed and running.
2. Create a database (optional):
   ```bash
   createdb football_booking
   ```
3. Run the schema file to create tables:
   ```bash
   psql -d football_booking -f schema.sql
   ```
4. Insert sample data as needed, then run individual queries from `queries.sql`:
   ```bash
   psql -d football_booking -f queries.sql
   ```

## Technologies Used

- PostgreSQL
- SQL (DDL and DML)
- Table constraints (PRIMARY KEY, FOREIGN KEY, CHECK, UNIQUE)
- Joins (INNER JOIN, LEFT JOIN)
- Subqueries, `COALESCE`, `LIKE` / `ILIKE`, `ORDER BY`, `LIMIT`, `OFFSET`

## Author

Md Yunus Ali
