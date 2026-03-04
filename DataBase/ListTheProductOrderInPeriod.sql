-- Intuition:
-- List products that were ordered within a specific period and have sufficient demand.
-- We aggregate units ordered per product during the period and keep those with total units >= 100.

-- Approach:
-- 1. Join Orders with Products on product_id to get product_name.
-- 2. Filter Orders to the target period: 2020-02-01 to 2020-02-29.
-- 3. Group by product and sum units.
-- 4. Keep products whose summed units >= 100.
-- 5. Return product_name and total units, ordered by product_name.

-- Time Complexity:
-- Let N be number of Orders in the period and P total Products.
-- Join and filter scan Orders once; grouping is O(N) to O(N log N) depending on engine.
-- Overall O(N) to O(N log N).

-- Space Complexity:
-- O(P_period) for grouping intermediates and result; linear in distinct products in the period.

SELECT 
  p.product_name,
  SUM(o.unit) AS unit
FROM Orders o
JOIN Products p
  ON p.product_id = o.product_id
WHERE o.order_date BETWEEN '2020-02-01' AND '2020-02-29'
GROUP BY p.product_id, p.product_name
HAVING SUM(o.unit) >= 100
ORDER BY p.product_name;
