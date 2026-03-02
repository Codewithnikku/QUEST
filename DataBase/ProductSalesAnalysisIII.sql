-- Product Sales Analysis III
-- Problem: Find the first year each product was sold
-- Tables: Sales (sale_id, product_id, year, quantity, price)
--         Product (product_id, product_name)

-- Intuition:
-- To find the first year each product was sold, we need to identify the minimum year for each unique product.
-- This can be achieved by grouping the sales data by product and then finding the minimum year within each group.
-- We also need to join with the Product table to get the product name.

-- Approach:
-- 1. Join the Sales table with the Product table on product_id to get product names.
-- 2. Group the results by product_id and product_name.
-- 3. For each group, find the minimum year using the MIN() aggregate function.
-- 4. Select the product_id, product_name, and the calculated first_year.
-- 5. Order the results by product_id for consistent output.

-- OPTIMIZED SOLUTION using MIN with GROUP BY
SELECT 
    s.product_id,
    p.product_name,
    MIN(s.year) AS first_year
FROM Sales s
INNER JOIN Product p ON s.product_id = p.product_id
GROUP BY s.product_id, p.product_name
ORDER BY s.product_id;

-- ALTERNATIVE: Using ROW_NUMBER (if MIN doesn't work)
/*
SELECT 
    s.product_id,
    p.product_name,
    s.year AS first_year
FROM Sales s
INNER JOIN Product p ON s.product_id = p.product_id
WHERE (s.product_id, s.year) IN (
    SELECT product_id, MIN(year)
    FROM Sales
    GROUP BY product_id
)
ORDER BY s.product_id;
*/

-- Time Complexity: O(n log n) due to sorting
-- Space Complexity: O(n) for GROUP BY operation
-- Why it's optimized:
-- 1. MIN() is a single-pass aggregate function
-- 2. INNER JOIN only includes products that have sales
-- 3. GROUP BY aggregates efficiently when indexed
-- 4. No subqueries or window functions needed
