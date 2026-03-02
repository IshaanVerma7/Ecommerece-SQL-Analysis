DROP DATABASE IF EXISTS Mystore;
CREATE DATABASE Mystore;
USE Mystore;

-- 1. Create Users (Parent Table)
CREATE TABLE users (
  user_id INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(50) NOT NULL,
  email VARCHAR(50), -- PREVENTS DUPLICATE ACCOUNTS
  join_date DATE DEFAULT (CURRENT_DATE)
) ENGINE=InnoDB;

-- 2. Create Products (Parent Table)
CREATE TABLE products (
  product_id INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(50) NOT NULL,
  category VARCHAR(50),
  price DECIMAL(10,2) NOT NULL,
  stock_quantity INT NOT NULL,

CONSTRAINT chk_price CHECK (PRICE > 0),   -- prive cannot be zero or negative
CONSTRAINT chk_stock CHECK (stock_quantity>=0) -- stock cannot be negative
);

-- 3. Create Orders (Child of Users)
CREATE TABLE customer_orders (
  order_id INT PRIMARY KEY AUTO_INCREMENT,
  user_id INT NOT NULL,
  order_date DATETIME DEFAULT CURRENT_TIMESTAMP,
  total_amount DECIMAL(10,2) NOT NULL,
  FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE,
  CONSTRAINT chk_total CHECK (total_amount>=0)
  );

-- 4. Create Order Items (Child of Orders and Products)
CREATE TABLE order_items (
  item_id INT PRIMARY KEY AUTO_INCREMENT,
  order_id INT NOT NULL,
  product_id INT NOT NULL,
  quantity INT NOT NULL DEFAULT 1,
  price_at_purchase DECIMAL(10,2) NOT NULL,
  FOREIGN KEY (order_id) REFERENCES customer_orders(order_id),
  FOREIGN KEY (product_id) REFERENCES products(product_id),
CONSTRAINT chk_qty CHECK (quantity > 0) -- cannot buy  0 or -1 tems
);
