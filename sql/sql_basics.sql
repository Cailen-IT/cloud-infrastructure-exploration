-- SQL Basics for Data & Cloud Systems

-- Create table
CREATE TABLE users (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    email VARCHAR(100)
);

-- Insert data
INSERT INTO users VALUES (1, 'John Doe', 'john@email.com');

-- Select all data
SELECT * FROM users;

-- Filter data
SELECT * FROM users WHERE id = 1;