-- Intuition:
-- The problem asks us to find customers who have bought *all* products available in the `Product` table.
-- This means for a customer to qualify, the number of distinct products they have bought must be equal to the total number of distinct products available.

-- Approach:
-- 1. Calculate the total number of distinct products:
--    - Use a subquery `(SELECT COUNT(DISTINCT product_key) FROM Product)` to get this value. This will be our target count.
-- 2. Group customer purchases:
--    - Group the `Customer` table by `customer_id`.
-- 3. Count distinct products bought by each customer:
--    - For each customer group, count the number of distinct `product_key`s they have purchased using `COUNT(DISTINCT product_key)`.
-- 4. Filter customers:
--    - Use the `HAVING` clause to compare the count of distinct products bought by each customer with the total number of distinct products available (from step 1).
--    - Select `customer_id` for those customers who satisfy this condition.

-- Time Complexity:
-- Let `C` be the number of rows in the `Customer` table and `P` be the number of rows in the `Product` table.
-- - The subquery to count distinct products in `Product` takes O(P) or O(P log P) if sorting is involved for `DISTINCT`.
-- - The main query involves grouping the `Customer` table, which typically takes O(C log C) due to sorting for grouping, or O(C) with hashing.
-- - The `HAVING` clause then performs a comparison for each group.
-- - Overall, the time complexity is approximately O(C log C + P) or O(C + P) with optimal indexing and query planning.

-- Space Complexity:
-- The space complexity depends on the intermediate results of grouping and the subquery.
-- - The subquery might require O(P) space to store distinct product keys.
-- - The `GROUP BY` operation might require O(C) space for storing intermediate group results.
-- - Overall, the space complexity is approximately O(C + P).

SELECT customer_id
FROM Customer
GROUP BY customer_id
HAVING COUNT(DISTINCT product_key) = (SELECT COUNT(DISTINCT product_key) FROM Product)