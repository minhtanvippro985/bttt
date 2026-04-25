CREATE DATABASE mini_mart;
USE mini_mart;


CREATE TABLE customers(
	customer_id INT PRIMARY KEY ,
    full_name VARCHAR(50),
    phone VARCHAR(15) UNIQUE NOT NULL,
    address VARCHAR(30) NOT NULL ,
    customer_type VARCHAR(20) NOT NULL

);

CREATE TABLE products(
	product_id INT PRIMARY KEY,
    product_name VARCHAR(30) NOT NULL UNIQUE,
    category VARCHAR(30) ,
    price DEC(10,2),
    stock INT
);


CREATE TABLE orders(
	order_id INT PRIMARY KEY,
	customer_id INT,
    order_date DATE,
    status VARCHAR(30),
    foreign key(customer_id) references customers(customer_id)

);


CREATE TABLE order_details(
	id INT PRIMARY KEY,
    order_id INT ,
    product_id INT ,
    quantity INT ,
    total_price DEC(10,2),
    foreign key (order_id) REFERENCES orders(order_id),
    foreign key (product_id) REFERENCES products(product_id)
);

INSERT INTO customers (customer_id, full_name, phone, address, customer_type) VALUES
(1, 'Nguyen Van A', '0901234567', 'Hanoi', 'VIP'),
(2, 'Tran Thi B', '0902345678', 'HCMC', 'Regular'),
(3, 'Le Van C', '0903456789', 'Danang', 'VIP'),
(4, 'Pham Minh D', '0904567890', 'Can Tho', 'Normal'),
(5, 'Hoang Lan E', '0905678901', 'Hue', 'Normal'),
(6, 'Doan Trong F', '0906789012', 'Hanoi', 'Normal'), 
(7, 'Vu Thi G', '0907890123', 'HCMC', 'Normal');   



INSERT INTO products (product_id, product_name, category, price, stock) VALUES
(1, 'Sua Tuoi Titit', 'Dairy', 15.00, 95), -- Khách vừa mua 5 cái này
(2, 'Sua Chua Trang', 'Dairy', 10.00, 50),
(3, 'Banh Mi Gối', 'Bakery', 20.00, 30),
(4, 'Banh Bong Lan', 'Bakery', 45.00, 20),
(5, 'Banh Quy Bo', 'Bakery', 60.00, 15),
(6, 'Nuoc Suoi Aqua', 'Beverage', 5.00, 200),
(7, 'Nuoc Cam Ep', 'Beverage', 25.00, 40),
(8, 'Tra Xanh C2', 'Beverage', 12.00, 60),
(9, 'Sua Dac Ong Tho', 'Dairy', 22.00, 25),
(10, 'Coca Cola Zero', 'Beverage', 15.00, 0); 



INSERT INTO orders (order_id, customer_id, order_date, status) VALUES
(101, 1, '2026-04-20', 'Completed'),
(102, 2, '2026-04-21', 'Cancelled'), -- Đơn hàng bị hủy
(103, 3, '2026-04-22', 'Completed'),
(104, 4, '2026-04-23', 'Shipping'),
(105, 1, '2026-04-25', 'Processing'); 



INSERT INTO order_details (id, order_id, product_id, quantity, total_price) VALUES
(1, 101, 1, 2, 30.00),
(2, 101, 2, 1, 10.00),
(3, 101, 6, 5, 25.00),

(4, 102, 3, 1, 20.00),
(5, 102, 7, 2, 50.00),

(6, 103, 4, 1, 45.00),
(7, 103, 8, 3, 36.00),

(8, 104, 5, 1, 60.00),
(9, 104, 9, 2, 44.00),
(10, 104, 2, 4, 40.00),

-- Don hang 105 (Khách ID 1 vừa mua 5 sản phẩm ID 1)
(11, 105, 1, 5, 75.00),
(12, 105, 6, 2, 10.00);



UPDATE products
SET stock = stock - 5
WHERE product_id = 1;