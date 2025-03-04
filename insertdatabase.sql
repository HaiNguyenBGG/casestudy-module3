use flight_booking_system;

INSERT INTO aircraft_info (aircraft_model, seat_capacity) VALUES
('Airbus A321', 200),
('Boeing 787', 280),
('Airbus A350', 300),
('Boeing 737', 180),
('Embraer E190', 120);

INSERT INTO users (role, email, password, phone, full_name, birth_date, gender, address, national_id, nationality, membership_level, wallet) VALUES
('customer', 'nguyen.a@gmail.com', 'pass123', '0901234567', 'Nguyễn Văn An', '1990-05-12', 'male', 'Hà Nội', '001203456789', 'Vietnamese', 'gold', 5000000),
('customer', 'le.b@gmail.com', 'pass123', '0912345678', 'Lê Thị Bình', '1992-07-15', 'female', 'TP. HCM', '001223456789', 'Vietnamese', 'silver', 3000000),
('customer', 'tran.c@gmail.com', 'pass123', '0923456789', 'Trần Văn Cường', '1985-11-21', 'male', 'Đà Nẵng', '001233456789', 'Vietnamese', 'bronze', 1000000),
('customer', 'pham.d@gmail.com', 'pass123', '0934567890', 'Phạm Thị Dung', '1995-02-09', 'female', 'Huế', '001243456789', 'Vietnamese', 'gold', 7000000),
('customer', 'bui.e@gmail.com', 'pass123', '0945678901', 'Bùi Văn Em', '1998-08-30', 'male', 'Cần Thơ', '001253456789', 'Vietnamese', 'bronze', 1200000),
('staff', 'ly.f@gmail.com', 'pass123', '0956789012', 'Lý Văn Phát', '1980-04-22', 'male', 'Hà Nội', '001263456789', 'Vietnamese', 'gold', 0),
('staff', 'dang.g@gmail.com', 'pass123', '0967890123', 'Đặng Thị Hoa', '1988-06-14', 'female', 'TP. HCM', '001273456789', 'Vietnamese', 'silver', 0),
('staff', 'nguyen.h@gmail.com', 'pass123', '0978901234', 'Nguyễn Văn Hải', '1991-09-12', 'male', 'Đà Nẵng', '001283456789', 'Vietnamese', 'gold', 0),
('staff', 'tran.i@gmail.com', 'pass123', '0989012345', 'Trần Thị Lan', '1993-12-01', 'female', 'Huế', '001293456789', 'Vietnamese', 'silver', 0),
('admin', 'pham.j@gmail.com', 'admin123', '0990123456', 'Phạm Văn Nhật', '1975-03-10', 'male', 'Hà Nội', '001303456789', 'Vietnamese', 'platinum', 0);

INSERT INTO flights (aircraft_id, airline, flight_code, departure_time, arrival_time, price, departure_location, arrival_location, seat_class) VALUES
(1, 'Vietnam Airlines', 'VN101', '2025-03-05 08:00:00', '2025-03-05 10:00:00', 2000000, 'Noi Bai (HAN)', 'Tan Son Nhat (SGN)', 'economy'),
(2, 'Bamboo Airways', 'QH202', '2025-03-06 09:00:00', '2025-03-06 11:30:00', 2500000, 'Noi Bai (HAN)', 'Da Nang (DAD)', 'business'),
(3, 'VietJet Air', 'VJ303', '2025-03-07 13:00:00', '2025-03-07 15:00:00', 1500000, 'Da Nang (DAD)', 'Tan Son Nhat (SGN)', 'economy'),
(4, 'Pacific Airlines', 'PA404', '2025-03-08 17:00:00', '2025-03-08 19:30:00', 1800000, 'Tan Son Nhat (SGN)', 'Phu Quoc (PQC)', 'economy'),
(5, 'Vietnam Airlines', 'VN505', '2025-03-09 12:00:00', '2025-03-09 14:00:00', 2800000, 'Noi Bai (HAN)', 'Singapore (SIN)', 'business');

INSERT INTO tickets (user_id, flight_id, booking_date, travel_date, status) VALUES
(1, 1, NOW(), '2025-03-05', 'booked'),
(2, 2, NOW(), '2025-03-06', 'booked'),
(3, 3, NOW(), '2025-03-07', 'booked'),
(4, 4, NOW(), '2025-03-08', 'booked'),
(5, 5, NOW(), '2025-03-09', 'booked'),
(1, 3, NOW(), '2025-03-07', 'booked'),
(2, 4, NOW(), '2025-03-08', 'canceled'),
(3, 5, NOW(), '2025-03-09', 'completed'),
(4, 1, NOW(), '2025-03-05', 'completed'),
(5, 2, NOW(), '2025-03-06', 'booked');

INSERT INTO payments (user_id, ticket_id, amount, payment_status, payment_date) VALUES
(1, 1, 2000000, 'completed', NOW()),
(2, 2, 2500000, 'completed', NOW()),
(3, 3, 1500000, 'completed', NOW()),
(4, 4, 1800000, 'completed', NOW()),
(5, 5, 2800000, 'pending', NOW()),
(1, 6, 1500000, 'completed', NOW());

INSERT INTO luggage (ticket_id, weight, price, luggage_type) VALUES
(1, 20, 500000, 'checked'),
(2, 15, 300000, 'checked'),
(3, 10, 200000, 'carry-on'),
(4, 25, 700000, 'checked'),
(5, 30, 900000, 'checked'),
(6, 18, 450000, 'checked'),
(7, 22, 550000, 'checked'),
(8, 10, 200000, 'carry-on'),
(9, 15, 300000, 'carry-on'),
(10, 20, 500000, 'checked'),
(1, 10, 250000, 'carry-on'),
(2, 12, 350000, 'checked'),
(3, 8, 150000, 'carry-on'),
(4, 25, 700000, 'checked'),
(5, 20, 500000, 'checked');

INSERT INTO seat_map (seat_id, ticket_id, flight_id, seat_status, seat_class) VALUES
('1A', 1, 1, 'reserved', 'economy'),
('1B', 2, 1, 'reserved', 'economy'),
('3C', 3, 2, 'reserved', 'business'),
('4D', 4, 3, 'reserved', 'economy'),
('5E', 5, 4, 'reserved', 'economy'),
('6F', 6, 5, 'reserved', 'business'),
('2A', 7, 1, 'available', 'economy'),
('2B', 8, 2, 'available', 'business'),
('2C', 9, 3, 'available', 'economy'),
('3D', 10, 4, 'reserved', 'economy');
