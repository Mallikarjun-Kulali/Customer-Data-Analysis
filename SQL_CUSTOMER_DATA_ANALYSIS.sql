-- 1.	How is the shopping distribution according to gender?
SELECT gender, COUNT(*) AS Total_customers
FROM customer
GROUP BY gender;

-- 2.	Which gender did we sell more products to?
SELECT gender,
    SUM(quantity) AS total_items_sold
FROM customer
GROUP BY gender
ORDER BY total_items_sold DESC;

-- 3.	Which gender generated more revenue?
SELECT gender,
    SUM(quantity * price) AS total_revenue
FROM customer
GROUP BY gender
ORDER BY total_revenue DESC;

-- 4.	Distribution of purchase categories relative to other columns?
-- Gender wise category distribution
SELECT gender, category,
    COUNT(*) AS total_purchases
FROM customer
GROUP BY gender, category
ORDER BY gender, total_purchases DESC;

-- Age group wise category distribution
SELECT CASE 
        WHEN age < 18 THEN 'Under 18'
        WHEN age BETWEEN 18 AND 25 THEN '18-25'
        WHEN age BETWEEN 26 AND 35 THEN '26-35'
        WHEN age BETWEEN 36 AND 45 THEN '36-45'
        WHEN age BETWEEN 46 AND 60 THEN '46-60'
        ELSE '60+'
    END AS age_group, category, COUNT(*) AS total_purchases
FROM customer
GROUP BY age_group, category
ORDER BY total_purchases DESC;

-- Payment method wise distribution
SELECT  payment_method, category, COUNT(*) AS total_purchases
FROM customer
GROUP BY payment_method, category
ORDER BY payment_method, total_purchases DESC;

-- Overall category performance
SELECT category,
    COUNT(*) AS total_transactions,
    SUM(quantity) AS total_items_sold,
    SUM(quantity * price) AS total_revenue
FROM customer
GROUP BY category
ORDER BY total_revenue DESC;


-- 5.	How is the shopping distribution according to age?
SELECT CASE 
        WHEN age < 18 THEN 'Under 18'
        WHEN age BETWEEN 18 AND 25 THEN '18-25'
        WHEN age BETWEEN 26 AND 35 THEN '26-35'
        WHEN age BETWEEN 36 AND 45 THEN '36-45'
        WHEN age BETWEEN 46 AND 60 THEN '46-60'
        ELSE '60+'
    END AS age_group, 
    COUNT(*) AS transactions,
    SUM(quantity) AS total_items,
    SUM(quantity*price) AS total_revenue
FROM customer
GROUP BY age_group
ORDER BY total_revenue DESC;


-- 6.	Which age cat did we sell more products to?
SELECT CASE
        WHEN age < 18 THEN 'Under 18'
        WHEN age BETWEEN 18 AND 25 THEN '18-25'
        WHEN age BETWEEN 26 AND 35 THEN '26-35'
        WHEN age BETWEEN 36 AND 45 THEN '36-45'
        WHEN age BETWEEN 46 AND 60 THEN '46-60'
        ELSE '60+'
    END AS age_group,
    SUM(quantity) AS total_items_sold
FROM customer
GROUP BY age_group
ORDER BY total_items_sold DESC;

-- 7.	Which age cat generated more revenue?
SELECT CASE
        WHEN age < 18 THEN 'Under 18'
        WHEN age BETWEEN 18 AND 25 THEN '18-25'
        WHEN age BETWEEN 26 AND 35 THEN '26-35'
        WHEN age BETWEEN 36 AND 45 THEN '36-45'
        WHEN age BETWEEN 46 AND 60 THEN '46-60'
        ELSE '60+'
    END AS age_group,
    SUM(quantity * price) AS total_revenue
FROM customer
GROUP BY age_group
ORDER BY total_revenue DESC;


-- 9.	Does the payment method have a relation with other columns?
-- Payment method vs Gender
SELECT gender, payment_method,
	COUNT(*) AS total_transactions
FROM customer
GROUP BY gender, payment_method
ORDER BY total_transactions DESC;


-- Payment method vs shopping mall
SELECT shopping_mall, payment_method,
    COUNT(DISTINCT invoice_no) AS transactions,
    SUM(quantity * price) AS total_revenue
FROM customer
GROUP BY shopping_mall, payment_method;

-- Payment method vs age_group
SELECT CASE 
            WHEN age < 18 THEN 'Under 18'
            WHEN age BETWEEN 18 AND 25 THEN '18-25'
			WHEN age BETWEEN 26 AND 35 THEN '26-35'
			WHEN age BETWEEN 36 AND 45 THEN '36-45'
			WHEN age BETWEEN 46 AND 60 THEN '46-60'
			ELSE '60+'
        END AS age_group, payment_method,
        COUNT(*) AS total_transactions
FROM customer
GROUP BY age_group, payment_method
ORDER BY total_transactions DESC;

-- Payment method vs category
SELECT payment_method, category,
    COUNT(*) AS total_transactions
FROM customer
GROUP BY payment_method, category
ORDER BY total_transactions DESC;


-- 10.	How is the distribution of the payment method?
SELECT payment_method,
    COUNT(*) AS total_transactions
FROM customer
GROUP BY payment_method
ORDER BY total_transactions DESC;



