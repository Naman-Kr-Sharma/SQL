CREATE DATABASE FreshMenu;

USE FreshMenu;

CREATE TABLE Users(
user_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    password VARCHAR(50) NOT NULL,
    Contact_NO VARCHAR(25),
    address TEXT(255),
    Created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Restaurants(
restaurant_id INT AUTO_INCREMENT PRIMARY KEY,
    Restaurant_Name VARCHAR(50) NOT NULL,
    address TEXT NOT NULL,
    Contact_NO VARCHAR(25),
    opening_time TIME,
    closing_time TIME,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Menu_Items(
     Menu_Items_id INT AUTO_INCREMENT PRIMARY KEY,
	restaurant_id INT NOT NULL,
    Restaurant_Name VARCHAR(50) NOT NULL,
   item_name VARCHAR(100) NOT NULL,
    item_description TEXT,
    price DECIMAL(10,2) NOT NULL,
    is_available BOOLEAN DEFAULT TRUE,
    FOREIGN KEY(restaurant_id) REFERENCES Restaurants(restaurant_id)
);

CREATE TABLE Orders(
order_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    restaurant_id INT NOT NULL,
    order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    total_price DECIMAL(10,2) NOT NULL,
    order_status ENUM('PENDING','PREPARING','DELIVERED','CANCELLED') DEFAULT 'PENDING',
    delievery_address TEXT,
    FOREIGN KEY(user_id)REFERENCES Users(user_id),
     FOREIGN KEY (restaurant_id)REFERENCES Restaurants(restaurant_id)
);

CREATE TABLE Fulfillment_Cordinator(
Fulfillment_Cordinator_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT NOT NULL,
    Menu_Items_id INT NOT NULL,
    quantity INT NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    FOREIGN KEY(order_id) REFERENCES orders(order_id),
       FOREIGN KEY(Menu_Items_id ) REFERENCES Menu_Items( Menu_Items_id )
);