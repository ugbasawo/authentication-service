CREATE DATABASE IF NOT EXISTS food_ordering;
USE food_ordering;

CREATE TABLE IF NOT EXISTS users (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  email VARCHAR(255) UNIQUE NOT NULL,
  password VARCHAR(255) NOT NULL,
  role ENUM('customer', 'vendor', 'admin') DEFAULT 'customer'
);

-- Create a new user
CREATE USER 'David'@'%' IDENTIFIED BY PASSWORD('*6C757D055806E6028786EE6557D055806E60287');

-- Grant all privileges to the new user on the food_ordering database
GRANT ALL PRIVILEGES ON food_ordering.* TO 'David'@'%';

-- Apply changes
FLUSH PRIVILEGES;
