-- Tables

CREATE TABLE users (
    user_id INT PRIMARY KEY,
    full_name VARCHAR(100),
    email VARCHAR(100),
    role VARCHAR(50),
    created_at DATE
);

CREATE TABLE servers (
    server_id INT PRIMARY KEY,
    server_name VARCHAR(100),
    environment VARCHAR(50),
    status VARCHAR(20),
    cpu_usage INT,
    memory_usage INT
);

CREATE TABLE logs (
    log_id INT PRIMARY KEY,
    server_id INT,
    log_level VARCHAR(20),
    message TEXT,
    log_time TIMESTAMP,
    FOREIGN KEY (server_id) REFERENCES servers(server_id)
);

-- Sample data

INSERT INTO users VALUES
(1, 'John Doe', 'john@company.com', 'Admin', '2025-01-10'),
(2, 'Sarah Smith', 'sarah@company.com', 'Developer', '2025-02-15'),
(3, 'Michael Brown', 'michael@company.com', 'Support', '2025-03-20');

INSERT INTO servers VALUES
(101, 'Web-Server-1', 'AWS', 'Active', 65, 70),
(102, 'DB-Server-1', 'Azure', 'Active', 80, 90),
(103, 'Backup-Server', 'On-Prem', 'Maintenance', 20, 30);

INSERT INTO logs VALUES
(1, 101, 'INFO', 'Server started successfully', '2026-05-01 08:00:00'),
(2, 102, 'WARNING', 'High CPU usage detected', '2026-05-01 09:15:00'),
(3, 102, 'ERROR', 'Database connection timeout', '2026-05-01 09:20:00'),
(4, 101, 'INFO', 'Routine health check completed', '2026-05-01 10:00:00');

-- Queries

SELECT * FROM users;

SELECT * FROM servers
WHERE status = 'Active';

SELECT server_name, cpu_usage, memory_usage
FROM servers
WHERE cpu_usage > 70 OR memory_usage > 80;

SELECT s.server_name, s.environment, l.log_level, l.message, l.log_time
FROM logs l
JOIN servers s ON l.server_id = s.server_id;

SELECT server_id, COUNT(*) AS total_logs
FROM logs
GROUP BY server_id;

SELECT COUNT(*) AS error_count
FROM logs
WHERE log_level = 'ERROR';

SELECT *
FROM logs
ORDER BY log_time DESC;