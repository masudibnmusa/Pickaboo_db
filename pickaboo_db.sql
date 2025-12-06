create DATABASE pickabo_db;
use pickabo_db;
CREATE TABLE customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100),
    phone VARCHAR(20),
    address VARCHAR(150),
    district VARCHAR(50)
);
use pickabo_db;
CREATE TABLE brands (
    brand_id INT AUTO_INCREMENT PRIMARY KEY,
    brand_name VARCHAR(100)
);

CREATE TABLE categories (
    category_id INT AUTO_INCREMENT PRIMARY KEY,
    category_name VARCHAR(100)
);

CREATE TABLE products (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    brand_id INT,
    category_id INT,
    product_name VARCHAR(150),
    price DECIMAL(10,2),
    stock INT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (brand_id) REFERENCES brands(brand_id),
    FOREIGN KEY (category_id) REFERENCES categories(category_id)
);

CREATE TABLE product_images (
    image_id INT AUTO_INCREMENT PRIMARY KEY,
    product_id INT,
    image_url VARCHAR(255),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

CREATE TABLE orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    total_amount DECIMAL(10,2),
    order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

CREATE TABLE order_items (
    order_item_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT,
    price DECIMAL(10,2),
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

INSERT INTO customers (name, email, phone, address, district) VALUES
('Masud Ibn Musa', 'masud@example.com', '01710000001', 'Katiadi', 'Kishoreganj'),
('Rakib Hossain', 'rakib@example.com', '01710000002', 'Moshua', 'Dhaka'),
('Sajid Ahmed', 'sajid@example.com', '01710000003', 'Mirpur', 'Dhaka'),
('Fahim Khan', 'fahim@example.com', '01710000004', 'Uttara', 'Dhaka'),
('Siam Ali', 'siam@example.com', '01710000005', 'Banani', 'Dhaka'),
('Rana Hossain', 'rana@example.com', '01710000006', 'Gulshan', 'Dhaka'),
('Arif Chowdhury', 'arif@example.com', '01710000007', 'Motijheel', 'Dhaka'),
('Shamim Ahmed', 'shamim@example.com', '01710000008', 'Narsingdi', 'Narsingdi'),
('Tanvir Hossain', 'tanvir@example.com', '01710000009', 'Comilla', 'Comilla'),
('Jahid Alam', 'jahid@example.com', '01710000010', 'Chittagong', 'Chattogram'),
('Imran Sarker', 'imran@example.com', '01710000011', 'Khulna', 'Khulna'),
('Rafiq Islam', 'rafiq@example.com', '01710000012', 'Barishal', 'Barishal'),
('Nayeem Khan', 'nayeem@example.com', '01710000013', 'Sylhet', 'Sylhet'),
('Arman Hossain', 'arman@example.com', '01710000014', 'Jessore', 'Jessore'),
('Sabbir Rahman', 'sabbir@example.com', '01710000015', 'Pabna', 'Pabna'),
('Shuvo Das', 'shuvo@example.com', '01710000016', 'Dinajpur', 'Dinajpur'),
('Tariq Mahmud', 'tariq@example.com', '01710000017', 'Rangpur', 'Rangpur'),
('Foysal Ahmed', 'foysal@example.com', '01710000018', 'Cox’s Bazar', 'Cox’s Bazar'),
('Azizur Rahman', 'azizur@example.com', '01710000019', 'Tangail', 'Tangail'),
('Hasan Mahmud', 'hasan@example.com', '01710000020', 'Bogra', 'Bogra');

INSERT INTO brands (brand_name) VALUES
('Samsung'),
('Apple'),
('Xiaomi'),
('HP'),
('Dell'),
('Lenovo'),
('Asus'),
('Sony'),
('LG'),
('Oppo'),
('Vivo'),
('Canon'),
('Nikon'),
('Microsoft'),
('OnePlus'),
('Realme'),
('Acer'),
('Panasonic'),
('Huawei'),
('Motorola');

INSERT INTO categories (category_name) VALUES
('Smartphones'),
('Laptops'),
('Desktops'),
('Televisions'),
('Cameras'),
('Headphones'),
('Speakers'),
('Printers'),
('Monitors'),
('Tablets'),
('Smart Watches'),
('Gaming Consoles'),
('Accessories'),
('Networking'),
('Home Appliances'),
('Projectors'),
('Software'),
('Storage Devices'),
('Power Banks'),
('Drones');

INSERT INTO products (brand_id, category_id, product_name, price, stock) VALUES
(1, 1, 'Samsung Galaxy S23', 95000.00, 50),
(2, 1, 'iPhone 15', 160000.00, 40),
(3, 1, 'Xiaomi Redmi Note 13', 20000.00, 100),
(4, 2, 'HP Pavilion 15', 75000.00, 30),
(5, 2, 'Dell Inspiron 14', 70000.00, 25),
(6, 2, 'Lenovo IdeaPad 3', 65000.00, 20),
(7, 2, 'Asus TUF Gaming A16', 120000.00, 15),
(8, 4, 'Sony Bravia 55-inch', 90000.00, 10),
(9, 4, 'LG OLED 48-inch', 110000.00, 12),
(10, 5, 'Canon EOS 250D', 65000.00, 8),
(11, 5, 'Nikon D3500', 60000.00, 5),
(12, 6, 'Sony WH-1000XM5', 35000.00, 25),
(13, 6, 'Bose QuietComfort 45', 40000.00, 20),
(14, 7, 'JBL Flip 6', 8000.00, 50),
(15, 10, 'Apple iPad 10th Gen', 75000.00, 18),
(16, 11, 'Samsung Galaxy Watch 6', 25000.00, 30),
(17, 12, 'Sony PlayStation 5', 85000.00, 10),
(18, 13, 'Logitech MX Master 3', 15000.00, 40),
(19, 19, 'Anker PowerCore 26800', 6000.00, 60),
(20, 20, 'DJI Mini 3 Pro', 120000.00, 5);

INSERT INTO product_images (product_id, image_url) VALUES
(1, 'images/samsung_s23.jpg'),
(2, 'images/iphone15.jpg'),
(3, 'images/redmi_note13.jpg'),
(4, 'images/hp_pavilion15.jpg'),
(5, 'images/dell_inspiron14.jpg'),
(6, 'images/lenovo_ideapad3.jpg'),
(7, 'images/asus_tuf_a16.jpg'),
(8, 'images/sony_bravia55.jpg'),
(9, 'images/lg_oled48.jpg'),
(10, 'images/canon_eos250d.jpg'),
(11, 'images/nikon_d3500.jpg'),
(12, 'images/sony_wh1000xm5.jpg'),
(13, 'images/bose_qc45.jpg'),
(14, 'images/jbl_flip6.jpg'),
(15, 'images/ipad10.jpg'),
(16, 'images/galaxy_watch6.jpg'),
(17, 'images/ps5.jpg'),
(18, 'images/logitech_mx3.jpg'),
(19, 'images/anker_powercore.jpg'),
(20, 'images/dji_mini3pro.jpg');

INSERT INTO orders (customer_id, total_amount) VALUES
(1, 95000.00),
(2, 160000.00),
(3, 20000.00),
(4, 75000.00),
(5, 70000.00),
(6, 65000.00),
(7, 120000.00),
(8, 90000.00),
(9, 110000.00),
(10, 65000.00),
(11, 60000.00),
(12, 35000.00),
(13, 40000.00),
(14, 8000.00),
(15, 75000.00),
(16, 25000.00),
(17, 85000.00),
(18, 15000.00),
(19, 6000.00),
(20, 120000.00);

INSERT INTO order_items (order_id, product_id, quantity, price) VALUES
(1, 1, 1, 95000.00),
(2, 2, 1, 160000.00),
(3, 3, 1, 20000.00),
(4, 4, 1, 75000.00),
(5, 5, 1, 70000.00),
(6, 6, 1, 65000.00),
(7, 7, 1, 120000.00),
(8, 8, 1, 90000.00),
(9, 9, 1, 110000.00),
(10, 10, 1, 65000.00),
(11, 11, 1, 60000.00),
(12, 12, 1, 35000.00),
(13, 13, 1, 40000.00),
(14, 14, 1, 8000.00),
(15, 15, 1, 75000.00),
(16, 16, 1, 25000.00),
(17, 17, 1, 85000.00),
(18, 18, 1, 15000.00),
(19, 19, 1, 6000.00),
(20, 20, 1, 120000.00);


SELECT o.order_id, c.name, o.order_date
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id;

use pickabo_db;
SELECT oi.order_item_id, p.product_name, oi.quantity, oi.price
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id;

SELECT p.product_name, b.brand_name
FROM products p
JOIN brands b ON p.brand_id = b.brand_id;

SELECT p.product_name, c.category_name
FROM products p
JOIN categories c ON p.category_id = c.category_id;

SELECT o.order_id, c.name, o.total_amount
FROM orders o

SELECT o.order_id, p.product_name, oi.quantity
FROM orders o
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id;

SELECT DISTINCT c.name
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id;

SELECT c.name, o.order_id
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id;

SELECT p.product_name, oi.order_id
FROM products p
LEFT JOIN order_items oi ON p.product_id = oi.product_id
WHERE

SELECT o.order_id, COUNT(oi.order_item_id) AS items_count
FROM orders o
JOIN order_items oi ON o.order_id = oi.order_id
GROUP BY o.order_id;

SELECT p.product_name, SUM(oi.quantity) AS total_sold
FROM products p
JOIN order_items oi ON p.product_id = oi.product_id
GROUP BY p.product_name;

SELECT c.name, SUM(o.total_amount) AS total_spent
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.name;

SELECT p.product_name, pi.image_url
FROM products p
JOIN product_images pi ON p.product_id = pi.product_id;

SELECT c.name, o.order_id, o.order_date
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
WHERE YEAR(o.order_date) > 2024;

use pickabo_db;

SELECT c.category_name, COUNT(p.product_id) AS product_count
FROM categories c
LEFT JOIN products p ON c.category_id = p.category_id
GROUP BY c.category_name;

SELECT p.product_name, SUM(oi.quantity) AS sold_units
FROM products p
JOIN order_items oi ON p.product_id = oi.product_id
GROUP BY p.product_name
ORDER BY sold_units DESC;

SELECT b.brand_name, COUNT(p.product_id) AS product_count
FROM brands b
LEFT JOIN products p ON b.brand_id = p.brand_id
GROUP BY b.brand_name;

SELECT c.name, COUNT(o.order_id) AS total_orders
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.name;

SELECT c.name, o.order_id, p.product_name, oi.quantity
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id;

SELECT c.name, o.order_id, o.order_date
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
WHERE o.order_date = (
    SELECT MAX(order_date)
    FROM orders
    WHERE customer_id = c.customer_id
);

SELECT * FROM products
WHERE price < 500;

SELECT product_name, stock
FROM products
WHERE stock < 10;

SELECT * FROM customers
ORDER BY name ASC;

SELECT * FROM products
WHERE price BETWEEN 1000 AND 3000;

SELECT COUNT(*) AS total_customers
FROM customers;

SELECT AVG(price) AS avg_price
FROM products;

SELECT SUM(stock) AS total_stock
FROM products;

SELECT SUM(stock) AS total_stock
FROM products;

SELECT MAX(price) AS max_price
FROM products;

START TRANSACTION;

INSERT INTO orders (customer_id, total_amount)
VALUES (1, 1500);

SET @new_order_id = LAST_INSERT_ID();

INSERT INTO order_items (order_id, product_id, quantity, price)
VALUES 
(@new_order_id, 3, 2, 300),
(@new_order_id, 5, 1, 900);

COMMIT;

START TRANSACTION;

-- check stock
SELECT stock INTO @stock
FROM products
WHERE product_id = 2;

IF @stock < 3 THEN
    ROLLBACK;
ELSE
    UPDATE products
    SET stock = stock - 3
    WHERE product_id = 2;

    INSERT INTO order_items (order_id, product_id, quantity, price)
    VALUES (10, 2, 3, 350);

    COMMIT;
END IF;

START TRANSACTION;

UPDATE products
SET price = 1200
WHERE product_id = 6;

INSERT INTO price_logs (product_id, old_price, new_price, changed_at)
VALUES (6, 1000, 1200, NOW());

COMMIT;

START TRANSACTION;

-- Restore stock
UPDATE products p
JOIN order_items oi ON p.product_id = oi.product_id
SET p.stock = p.stock + oi.quantity
WHERE oi.order_id = 15;

-- Delete order items
DELETE FROM order_items WHERE order_id = 15;

-- Delete order
DELETE FROM orders WHERE order_id = 15;

COMMIT;

START TRANSACTION;

UPDATE customers
SET email = 'newmail@gmail.com'
WHERE customer_id = 3;

UPDATE customers
SET phone = '01700000000'
WHERE customer_id = 3;

COMMIT;

START TRANSACTION;

UPDATE products
SET stock = stock - 5
WHERE product_id = 1;

UPDATE products
SET stock = stock + 5
WHERE product_id = 2;

COMMIT;

START TRANSACTION;

UPDATE products
SET price = price + 500
WHERE product_id = 4;

ROLLBACK;

CREATE TABLE payments (
    payment_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT,
    payment_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    amount DECIMAL(10,2) NOT NULL,
    payment_method VARCHAR(50),    -- e.g., 'Credit Card', 'Bkash', 'Nagad', 'Cash'
    payment_status VARCHAR(20),    -- e.g., 'Pending', 'Completed', 'Failed'
    FOREIGN KEY (order_id) REFERENCES orders(order_id)
);



SELECT order_id FROM orders;
-- Delete all existing orders
DELETE FROM order_items;  -- first delete child rows
DELETE FROM orders;       -- then delete orders

-- Reset AUTO_INCREMENT
ALTER TABLE orders AUTO_INCREMENT = 1;
ALTER TABLE order_items AUTO_INCREMENT = 1;

INSERT INTO orders (customer_id, total_amount, order_date) VALUES
(1, 1200, '2025-01-10'),
(2, 400, '2025-01-12'),
(3, 1500, '2025-01-13'),
(4, 900, '2025-01-15'),
(5, 10, '2025-01-17'),
(6, 20, '2025-01-18'),
(7, 120, '2025-01-19'),
(8, 200, '2025-01-20'),
(9, 50, '2025-01-21'),
(10, 600, '2025-01-22'),
(11, 15, '2025-01-23'),
(12, 80, '2025-01-24'),
(13, 700, '2025-01-25'),
(14, 25, '2025-01-26'),
(15, 35, '2025-01-27'),
(16, 12, '2025-01-28'),
(17, 8, '2025-01-29'),
(18, 250, '2025-01-30'),
(19, 20, '2025-02-01'),
(20, 40, '2025-02-02');

INSERT INTO order_items (order_id, product_id, quantity, price) VALUES
(1, 1, 1, 1200),
(2, 2, 1, 400),
(3, 3, 1, 1500),
(4, 4, 1, 900),
(5, 5, 1, 10),
(6, 6, 1, 20),
(7, 7, 1, 120),
(8, 8, 1, 200),
(9, 9, 1, 50),
(10,10,1, 600),
(11,11,1, 15),
(12,12,1, 80),
(13,13,1, 700),
(14,14,1, 25),
(15,15,1, 35),
(16,16,1, 12),
(17,17,1, 8),
(18,18,1, 250),
(19,19,1, 20),
(20,20,1, 40);

INSERT INTO payments (order_id, amount, payment_method, payment_status) VALUES
(1, 1200, 'Credit Card', 'Completed'),
(2, 400, 'Bkash', 'Completed'),
(3, 1500, 'Nagad', 'Completed'),
(4, 900, 'Cash', 'Completed'),
(5, 10, 'Bkash', 'Completed'),
(6, 20, 'Credit Card', 'Completed'),
(7, 120, 'Nagad', 'Completed'),
(8, 200, 'Cash', 'Completed'),
(9, 50, 'Bkash', 'Completed'),
(10, 600, 'Credit Card', 'Completed'),
(11, 15, 'Nagad', 'Completed'),
(12, 80, 'Bkash', 'Completed'),
(13, 700, 'Credit Card', 'Completed'),
(14, 25, 'Cash', 'Completed'),
(15, 35, 'Bkash', 'Completed'),
(16, 12, 'Credit Card', 'Completed'),
(17, 8, 'Nagad', 'Completed'),
(18, 250, 'Cash', 'Completed'),
(19, 20, 'Bkash', 'Completed'),
(20, 40, 'Credit Card', 'Completed');

SELECT p.payment_id, p.order_id, p.amount, p.payment_method, p.payment_status, o.total_amount
FROM payments p
JOIN orders o ON p.order_id = o.order_id;

SELECT * FROM payments
WHERE payment_status = 'Completed';

SELECT * FROM payments
WHERE payment_status IN ('Pending', 'Failed');

SELECT o.order_id, c.name, o.total_amount, o.order_date
FROM orders o
INNER JOIN customers c ON o.customer_id = c.customer_id;

SELECT o.order_id, p.product_name, oi.quantity, oi.price
FROM orders o
INNER JOIN order_items oi ON o.order_id = oi.order_id
INNER JOIN products p ON oi.product_id = p.product_id;

SELECT p.product_name, b.brand_name, c.category_name, p.price
FROM products p
JOIN brands b ON p.brand_id = b.brand_id
JOIN categories c ON p.category_id = c.category_id;

SELECT p.product_name, oi.order_id, oi.quantity
FROM products p
LEFT JOIN order_items oi ON p.product_id = oi.product_id;

SELECT c.name, o.order_id, o.total_amount
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id;

SELECT c.category_name, COUNT(p.product_id) AS product_count
FROM categories c
LEFT JOIN products p ON c.category_id = p.category_id
GROUP BY c.category_name;

use pickabo_db;
SELECT c.name, o.order_id
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id

UNION

SELECT c.name, o.order_id
FROM customers c
RIGHT JOIN orders o ON c.customer_id = o.customer_id;

SELECT p.product_name, SUM(oi.quantity) AS total_sold
FROM products p
JOIN order_items oi ON p.product_id = oi.product_id
GROUP BY p.product_name
ORDER BY total_sold DESC;

SELECT p.payment_id, c.name, o.order_id, p.amount, p.payment_method
FROM payments p
JOIN orders o ON p.order_id = o.order_id
JOIN customers c ON o.customer_id = c.customer_id;

SELECT p.product_name, pi.image_url
FROM products p
JOIN product_images pi ON p.product_id = pi.product_id;

use pickabo_db;

SELECT * FROM customers;

SELECT 
    customer_name,
    rder_id
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id;

DESCRIBE customers;
DESCRIBE orders;
DESCRIBE payments;

SELECT 
    c.customer_id,
    c.name AS customer_name,
    o.order_id,
    o.total_amount,
    o.order_date
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id;

SELECT
    o.order_id,
    oi.order_item_id,
    oi.product_id,
    oi.quantity,
    oi.price
FROM orders o
JOIN order_items oi ON o.order_id = oi.order_id;

SELECT
    oi.order_id,
    oi.quantity,
    p.product_name,
    p.price
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id;

SELECT
    p.product_id,
    p.product_name,
    b.brand_name,
    c.category_name,
    p.price,
    p.stock
FROM products p
JOIN brands b ON p.brand_id = b.brand_id
JOIN categories c ON p.category_id = c.category_id;

SELECT
    p.product_name,
    pi.image_url
FROM products p
JOIN product_images pi ON p.product_id = pi.product_id;

SELECT
    c.name AS customer_name,
    o.order_id,
    oi.order_item_id,
    p.product_name,
    oi.quantity,
    oi.price
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id;

SELECT
    c.name AS customer_name,
    o.order_id,
    oi.order_item_id,
    p.product_name,
    oi.quantity,
    oi.price
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id;
use pickabo_db;
SELECT c.name, o.order_id, o.total_amount
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id;

SELECT o.order_id, oi.order_item_id, oi.quantity
FROM orders o
JOIN order_items oi ON o.order_id = oi.order_id;

SELECT oi.order_id, p.product_name, oi.quantity, oi.price
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id;

SELECT p.product_name, b.brand_name
FROM products p
JOIN brands b ON p.brand_id = b.brand_id;

SELECT p.product_name, c.category_name
FROM products p
JOIN categories c ON p.category_id = c.category_id;

SELECT p.product_name, b.brand_name, c.category_name
FROM products p
JOIN brands b ON p.brand_id = b.brand_id
JOIN categories c ON p.category_id = c.category_id;

SELECT p.product_name, pi.image_url
FROM product_images pi
JOIN products p ON pi.product_id = p.product_id;

SELECT DISTINCT p.product_name
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id;

SELECT c.name, o.order_id, p.product_name, oi.quantity
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id;

SELECT c.name, o.order_id, o.total_amount
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id;

SELECT DISTINCT c.name
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id;

SELECT c.name
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id
WHERE o.order_id IS NULL;

SELECT o.order_id, COUNT(oi.order_item_id) AS total_items
FROM orders o
JOIN order_items oi ON o.order_id = oi.order_id
GROUP BY o.order_id;

SELECT p.product_name, SUM(oi.quantity) AS sold_quantity
FROM products p
JOIN order_items oi ON p.product_id = oi.product_id
GROUP BY p.product_id;

use pickabo_db;

SELECT o.order_id, c.name, c.district
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id;

SELECT c.name, o.order_id, o.order_date
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN (
    SELECT customer_id, MAX(order_date) AS last_order
    FROM orders
    GROUP BY customer_id
) t ON o.customer_id = t.customer_id AND o.order_date = t.last_order;

SELECT p.product_name, COUNT(pi.image_id) AS image_count
FROM products p
JOIN product_images pi ON p.product_id = pi.product_id
GROUP BY p.product_id;

SELECT o.order_id, c.category_name, p.product_name
FROM orders o
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id
JOIN categories c ON p.category_id = c.category_id;

SELECT o.order_id, b.brand_name, p.product_name
FROM orders o
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id
JOIN brands b ON p.brand_id = b.brand_id;

SELECT 
    c.name AS customer_name,
    c.phone,
    o.order_id,
    o.total_amount,
    oi.quantity,
    p.product_name,
    p.price,
    b.brand_name,
    cat.category_name
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id
JOIN brands b ON p.brand_id = b.brand_id
JOIN categories cat ON p.category_id = cat.category_id;

SELECT c.customer_id, c.name, COUNT(o.order_id) AS order_count
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id;

SELECT p.product_id, p.product_name
FROM products p
LEFT JOIN order_items oi ON p.product_id = oi.product_id
WHERE oi.order_id IS NULL;

SELECT DISTINCT p.product_name
FROM products p
JOIN order_items oi ON p.product_id = oi.product_id;

SELECT p.product_name, SUM(oi.quantity) AS total_sold
FROM products p
JOIN order_items oi ON p.product_id = oi.product_id
GROUP BY p.product_id
ORDER BY total_sold DESC
LIMIT 1;

SELECT c.district, COUNT(o.order_id) AS total_orders
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.district;

SELECT cat.category_name, SUM(oi.quantity) AS total_sold
FROM categories cat
JOIN products p ON cat.category_id = p.category_id
JOIN order_items oi ON p.product_id = oi.product_id
GROUP BY cat.category_id;

SELECT b.brand_name, SUM(oi.quantity * oi.price) AS total_revenue
FROM brands b
JOIN products p ON b.brand_id = p.brand_id
JOIN order_items oi ON p.product_id = oi.product_id
GROUP BY b.brand_id;

SELECT c.name, SUM(o.total_amount) AS total_spent
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id
ORDER BY total_spent DESC
LIMIT 1;

use pickabo_db;
SELECT c.district, o.order_id, o.order_date
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN (
    SELECT customer_id, MAX(order_date) AS last_order
    FROM orders
    GROUP BY customer_id
) t ON o.customer_id = t.customer_id AND o.order_date = t.last_order;

SELECT o.order_id, SUM(oi.quantity) AS total_items
FROM orders o
JOIN order_items oi ON o.order_id = oi.order_id
GROUP BY o.order_id;

SELECT c.name, o.order_id, p.product_name, oi.quantity
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id;

SELECT cat.category_name, SUM(oi.quantity) AS total_qty
FROM categories cat
JOIN products p ON cat.category_id = p.category_id
JOIN order_items oi ON p.product_id = oi.product_id
GROUP BY cat.category_id
ORDER BY total_qty DESC
LIMIT 1;

SELECT c.name, o.order_id, p.product_name, cat.category_name
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id
JOIN categories cat ON p.category_id = cat.category_id;

SELECT c.name, SUM(oi.quantity) AS total_quantity
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN order_items oi ON o.order_id = oi.order_id
GROUP BY c.customer_id;
