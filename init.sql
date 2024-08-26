-- init.sql

CREATE DATABASE IF NOT EXISTS food_ordering;
USE food_ordering;

-- Create the users table
CREATE TABLE IF NOT EXISTS users (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  email VARCHAR(255) UNIQUE NOT NULL,
  password VARCHAR(255) NOT NULL,
  role ENUM('customer', 'vendor', 'admin') DEFAULT 'customer'
);

-- Create a new MySQL user and grant privileges
CREATE USER IF NOT EXISTS 'David'@'%' IDENTIFIED BY 'Okpe@123';
GRANT ALL PRIVILEGES ON food_ordering.* TO 'David'@'%';
FLUSH PRIVILEGES;
