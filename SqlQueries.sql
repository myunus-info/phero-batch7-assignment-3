DROP TABLE IF EXISTS Bookings;
DROP TABLE IF EXISTS Matches;
DROP TABLE IF EXISTS Users;

CREATE TABLE Users (
    user_id INT PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    role VARCHAR(20) NOT NULL 
         CHECK(ROLE IN ('Ticket Manager', 'Football Fan')),
    phone_number VARCHAR(20),
);

CREATE TABLE Matches (
    match_id INT PRIMARY KEY,
    fixture VARCHAR(100) NOT NULL,
    tournament_category VARCHAR(50) NOT NULL,
    base_ticket_price DECIMAL(10, 2) NOT NULL 
        CHECK (base_ticket_price >= 0),
    match_status VARCHAR(20) NOT NULL 
        CHECK (match_status IN ('Available', 'Selling Fast', 'Sold Out', 'Postponed')),
);

