Create database flight_booking_system;
use flight_booking_system;

-- Step 1: Create users table first
CREATE TABLE users (
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    role ENUM('admin', 'customer', 'staff') NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    phone VARCHAR(15) UNIQUE,
    full_name VARCHAR(255) NOT NULL,
    birth_date DATE,
    gender ENUM('male', 'female', 'other'),
    address TEXT,
    national_id VARCHAR(20) UNIQUE,
    nationality VARCHAR(50),
    membership_level ENUM('bronze', 'silver', 'gold', 'platinum'),
    wallet DECIMAL(15,2) DEFAULT 0.00,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB;

-- Step 2: Create aircraft_info table
CREATE TABLE aircraft_info (
    aircraft_id BIGINT PRIMARY KEY AUTO_INCREMENT,
    aircraft_model VARCHAR(100) NOT NULL,
    seat_capacity INT NOT NULL
) ENGINE=InnoDB;

-- Step 3: Create flights table AFTER aircraft_info
CREATE TABLE flights (
    flight_id INT PRIMARY KEY AUTO_INCREMENT,
    aircraft_id BIGINT NOT NULL,
    airline VARCHAR(255) NOT NULL,
    flight_code VARCHAR(50) UNIQUE NOT NULL,
    departure_time TIMESTAMP NOT NULL,
    arrival_time TIMESTAMP NOT NULL,
    price BIGINT NOT NULL,
    departure_location VARCHAR(255) NOT NULL,
    arrival_location VARCHAR(255) NOT NULL,
    seat_class ENUM('economy', 'business', 'first_class'),
    FOREIGN KEY (aircraft_id) REFERENCES aircraft_info(aircraft_id) ON DELETE CASCADE
) ENGINE=InnoDB;

-- Step 4: Create tickets table AFTER flights and users
CREATE TABLE tickets (
    ticket_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT NOT NULL,
    flight_id INT NOT NULL,
    booking_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    travel_date DATE NOT NULL,
    status ENUM('booked', 'canceled', 'completed') DEFAULT 'booked',
    FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE,
    FOREIGN KEY (flight_id) REFERENCES flights(flight_id) ON DELETE CASCADE
) ENGINE=InnoDB;

-- Step 5: Create payments table AFTER tickets
CREATE TABLE payments (
    payment_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT NOT NULL,
    ticket_id INT NOT NULL,
    amount BIGINT NOT NULL,
    payment_status ENUM('pending', 'completed', 'failed') NOT NULL,
    payment_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE,
    FOREIGN KEY (ticket_id) REFERENCES tickets(ticket_id) ON DELETE CASCADE
) ENGINE=InnoDB;

-- Step 6: Create seat_map table AFTER tickets and flights
CREATE TABLE seat_map (
    seat_id VARCHAR(10) PRIMARY KEY,
    ticket_id INT NOT NULL,
    flight_id INT NOT NULL,
    seat_status ENUM('available', 'reserved', 'occupied') NOT NULL,
    seat_class ENUM('economy', 'business', 'first_class') NOT NULL,
    FOREIGN KEY (ticket_id) REFERENCES tickets(ticket_id) ON DELETE CASCADE,
    FOREIGN KEY (flight_id) REFERENCES flights(flight_id) ON DELETE CASCADE
) ENGINE=InnoDB;

-- Step 7: Create luggage table AFTER tickets
CREATE TABLE luggage (
    luggage_id INT PRIMARY KEY AUTO_INCREMENT,
    ticket_id INT NOT NULL,
    weight INT NOT NULL,
    price BIGINT NOT NULL,
    luggage_type VARCHAR(100) NOT NULL,
    FOREIGN KEY (ticket_id) REFERENCES tickets(ticket_id) ON DELETE CASCADE
) ENGINE=InnoDB;
