-- Handaling Top selling products
SELECT p.name, SUM(oi.quantity) AS units_sold, SUM(oi.quantity * oi. price_at_purchase) AS revenue
FROM order_items oi
JOIN Products p ON oi.product_id = p.product_id
GROUP BY p.name
ORDER BY revenue DESC;

-- 2. Customer Purchasing Patterns (Frequent Buyers)
SELECT u.name, COUNT(o.order_id) AS order_count, SUM(o.total_amount) AS total_spent
FROM Users u
JOIN customer_orders o ON u.user_id = o.user_id
GROUP BY u.name
HAVING COUNT(o.order_id) >= 1 -- You can change this to > 5 for "Power Users"
ORDER BY total_spent DESC;
