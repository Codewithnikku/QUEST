-- Intuition:
-- The problem asks us to find the `customer_number` of the customer who has placed the largest number of orders.
-- This involves counting the orders for each customer and then selecting the customer with the maximum count.

-- Approach:
-- 1. Group by customer:
--    - Use `GROUP BY customer_number` to aggregate all orders belonging to the same customer.
-- 2. Count orders for each customer:
--    - For each group (customer), use `COUNT(*)` to count the total number of orders placed by that customer.
-- 3. Order by order count:
--    - Use `ORDER BY COUNT(*) DESC` to sort the customers in descending order based on their total order count. The customer with the most orders will be at the top.
-- 4. Limit to the top customer:
--    - Use `LIMIT 1` to retrieve only the first row, which corresponds to the customer who placed the largest number of orders.

-- Time Complexity:
-- Let `N` be the number of rows in the `Orders` table.
-- - The `GROUP BY` operation involves scanning all `N` rows and then sorting or hashing them to form groups. This typically takes O(N log N) due to sorting, or O(N) with hashing.
-- - The `COUNT(*)` aggregation is performed during or after the grouping.
-- - The `ORDER BY` operation also involves sorting, which takes O(N log N).
-- - `LIMIT 1` is very efficient after sorting.
-- - Overall, the time complexity is approximately O(N log N) due to the grouping and ordering operations.

-- Space Complexity:
-- The space complexity depends on the intermediate results of grouping and sorting.
-- - The `GROUP BY` operation might require O(C) space, where `C` is the number of distinct customers, to store intermediate group results.
-- - The `ORDER BY` operation might also require O(N) space for sorting.
-- - Overall, the space complexity is approximately O(N).

SELECT customer_number
FROM Orders
GROUP BY customer_number
ORDER BY COUNT(*) DESC
LIMIT 1;
