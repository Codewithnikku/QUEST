-- Intuition:
-- The problem asks us to find the names of customers who are *not* referred by the customer with `id = 2`.
-- This means we need to include customers whose `referee_id` is `NULL` (not referred by anyone) or whose `referee_id` is any value other than `2`.

-- Approach:
-- 1. Select the `name` column from the `Customer` table.
-- 2. Use a `WHERE` clause to filter the customers based on their `referee_id`.
-- 3. The condition `referee_id IS NULL` includes customers who were not referred by anyone.
-- 4. The condition `referee_id != 2` includes customers who were referred by someone other than customer `2`.
-- 5. These two conditions are combined with an `OR` operator, as a customer can satisfy either one to be included in the result.
--    It's important to use `OR` and explicitly check for `IS NULL` because `NULL` values are treated specially in SQL comparisons (e.g., `NULL != 2` evaluates to `UNKNOWN`, not `TRUE`).

-- Time Complexity:
-- Let `N` be the number of rows in the `Customer` table.
-- - The query involves a single scan of the `Customer` table to apply the `WHERE` clause.
-- - If `referee_id` is indexed, the filtering can be very efficient, potentially O(log N) to find the relevant rows and then O(K) to retrieve K matching rows.
-- - In the worst case (no index or all rows match), it's O(N).
-- - Overall, the time complexity is approximately O(N).

-- Space Complexity:
-- The space complexity is minimal, as it only involves storing the result set.
-- - Approximately O(K) where K is the number of customers returned.

SELECT name
FROM Customer
WHERE referee_id IS NULL OR referee_id != 2;