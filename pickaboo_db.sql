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
