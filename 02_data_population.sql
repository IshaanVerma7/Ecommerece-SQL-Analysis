INSERT INTO Users (name, email) VALUES
('rahul_sharma', 'rahul@email.com'),
('priya_v', 'priya@email.com'),
('amit_k', 'amit@email.com');

INSERT INTO Products (name, Category, price, stock_quantity) VALUES
('Smartphone', 'ELectronics', 15000.00, 10),
('Laptop', 'Electronics', 55000.00, 5),
('Headphones', 'Accessories', 2000.00, 20),
('Backpack', 'Fashion', 1500.00, 15);

INSERT INTO customer_orders (user_id, order_date, total_amount) VALUES 
(1, '2024-05-20 10:00:00', 15000.00), -- Original
(2, '2024-05-20 11:30:00', 2000.00),
(3, '2024-05-20 12:45:00', 55000.00),
(1, '2024-05-20 10:00:00', 15000.00), -- DUPLICATE (Accidental double-click)
(2, '2024-05-20 11:30:00', 2000.00);  -- DUPLICATE
