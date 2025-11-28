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
