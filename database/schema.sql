-- AquaMetrics Database Schema
-- Focus: Relational Integrity, Aggregations, and Analytical Queries

-- 1. Tenants/Users Table
CREATE TABLE users (
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    property_address TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 2. Smart Meters Table
CREATE TABLE smart_meters (
    meter_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    serial_number VARCHAR(50) UNIQUE NOT NULL,
    installation_date DATE,
    status ENUM('active', 'inactive', 'maintenance') DEFAULT 'active',
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

-- 3. Consumption Logs (High Volume Data)
CREATE TABLE consumption_logs (
    log_id BIGINT PRIMARY KEY AUTO_INCREMENT,
    meter_id INT,
    consumption_liters DECIMAL(10, 2),
    logged_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (meter_id) REFERENCES smart_meters(meter_id)
);

-- 4. Billing Records
CREATE TABLE billing (
    bill_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    billing_period_start DATE,
    billing_period_end DATE,
    total_amount DECIMAL(10, 2),
    payment_status ENUM('pending', 'paid', 'overdue') DEFAULT 'pending',
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

-- SAMPLE ANALYTICAL QUERIES

-- Query 1: Leak Detection (Identifies meters with constant consumption over 24 hours)
WITH HourlyConsumption AS (
    SELECT 
        meter_id,
        DATE_FORMAT(logged_at, '%Y-%m-%d %H:00:00') as hour_bin,
        SUM(consumption_liters) as total_hourly
    FROM consumption_logs
    WHERE logged_at >= NOW() - INTERVAL 1 DAY
    GROUP BY meter_id, hour_bin
)
SELECT meter_id, MIN(total_hourly) as min_flow
FROM HourlyConsumption
GROUP BY meter_id
HAVING MIN(total_hourly) > 0.5; -- Constant flow suggests a leak

-- Query 2: Monthly Consumption Summary for Billing
SELECT 
    u.full_name,
    u.email,
    sm.serial_number,
    SUM(cl.consumption_liters) as total_monthly_usage,
    COUNT(cl.log_id) as data_points_captured
FROM users u
JOIN smart_meters sm ON u.user_id = sm.user_id
JOIN consumption_logs cl ON sm.meter_id = cl.meter_id
WHERE cl.logged_at >= DATE_SUB(CURDATE(), INTERVAL 1 MONTH)
GROUP BY u.user_id, sm.meter_id
ORDER BY total_monthly_usage DESC;
