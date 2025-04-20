
-- Create User Table
CREATE TABLE users (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    role ENUM('CUSTOMER', 'ADMIN') DEFAULT 'CUSTOMER'
);

-- Create Product Table
CREATE TABLE products (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    description TEXT,
    price DECIMAL(10, 2) NOT NULL
);

-- Create Order Table
CREATE TABLE orders (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    user_id BIGINT NOT NULL,
    order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id)
);

-- Create OrderItem Table
CREATE TABLE order_items (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    order_id BIGINT NOT NULL,
    product_id BIGINT NOT NULL,
    quantity INT NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (order_id) REFERENCES orders(id),
    FOREIGN KEY (product_id) REFERENCES products(id)
);

-- Sample Data Inserts

-- Insert Users
INSERT INTO users (name, email, role) VALUES 
('Shrishti', 'shrishti@gmail.com', 'CUSTOMER'),
('shivani', 'shivani@gmail.com', 'CUSTOMER'),
('riva', 'riva@gmail.com', 'ADMIN');

-- Insert Products
INSERT INTO products (name, description, price) VALUES
('Laptop', 'Laptop', 1500.00),
('Smartphone', 'Smartphone', 800.00),
('Headphones', 'Headphones', 200.00);

-- Insert Orders
INSERT INTO orders (user_id) VALUES (1), (2);

-- Insert Order Items
INSERT INTO order_items (order_id, product_id, quantity, price) VALUES
(1, 1, 1, 1500.00),
(1, 3, 2, 200.00),
(2, 2, 1, 800.00);
