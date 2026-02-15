CREATE DATABASE oceanview_resort;
USE oceanview_resort;

CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    password_hash VARCHAR(64) NOT NULL,
    role VARCHAR(20) NOT NULL DEFAULT 'STAFF',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE room_types (
    code VARCHAR(20) PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    nightly_rate DECIMAL(10,2) NOT NULL
);

INSERT INTO room_types(code, name, nightly_rate) VALUES
    ('STANDARD', 'Standard Room', 8000),
    ('DELUXE', 'Deluxe Room', 12000),
    ('SUITE', 'Suite Room', 20000);

CREATE TABLE rooms (
    id INT AUTO_INCREMENT PRIMARY KEY,
    room_number VARCHAR(10) NOT NULL UNIQUE,
    room_type_code VARCHAR(20) NOT NULL,
    status VARCHAR(20) NOT NULL DEFAULT 'ACTIVE',
    FOREIGN KEY (room_type_code) REFERENCES room_types(code)
);

INSERT INTO rooms(room_number, room_type_code) VALUES
    ('101','STANDARD'),
    ('102','STANDARD'),
    ('201','DELUXE'),
    ('301','SUITE');

CREATE TABLE reservations (
    id INT AUTO_INCREMENT PRIMARY KEY,
    reservation_code VARCHAR(20) NOT NULL UNIQUE,
    guest_name VARCHAR(100) NOT NULL,
    guest_address VARCHAR(255) NOT NULL,
    contact_number VARCHAR(20) NOT NULL,
    room_id INT NOT NULL,
    check_in DATE NOT NULL,
    check_out DATE NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (room_id) REFERENCES rooms(id)
);

CREATE TABLE bills (
    id INT AUTO_INCREMENT PRIMARY KEY,
    reservation_id INT NOT NULL UNIQUE,
    nights INT NOT NULL,
    nightly_rate DECIMAL(10,2) NOT NULL,
    total DECIMAL(10,2) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (reservation_id) REFERENCES reservations(id)
);

-- default user admin/admin123
INSERT INTO users(username, password_hash, role)
VALUES ('admin', '240be518fabd2724ddb6f04eeb1da5967448d7e831c08c8fa822809f74c720a9', 'ADMIN');
