-- Intuition:
-- The problem asks us to select movies that meet two criteria:
-- 1. The movie's `id` is an odd number.
-- 2. The movie's `description` is not 'boring'.
-- The results should be ordered by `rating` in descending order.

-- Approach:
-- 1. Filter by `id`:
--    - Use the condition `id % 2 = 1` to select only movies with odd `id`s.
-- 2. Filter by `description`:
--    - Use the condition `description != 'boring'` to exclude movies whose description is 'boring'.
-- 3. Combine conditions:
--    - Both conditions must be true, so they are combined using `AND`.
-- 4. Select required columns:
--    - Select `id`, `movie`, `description`, and `rating`.
-- 5. Order the results:
--    - Use `ORDER BY rating DESC` to sort the filtered movies from highest rating to lowest.

-- Time Complexity:
-- Let `N` be the number of rows in the `Cinema` table.
-- - The query involves a single scan of the `Cinema` table to apply the `WHERE` clause.
-- - If `id` and `description` columns are indexed, the filtering can be very efficient, potentially O(log N) to find the relevant rows and then O(K) to retrieve K matching rows.
-- - The `ORDER BY` operation involves sorting the filtered results, which takes O(K log K) where K is the number of rows that satisfy the `WHERE` clause.
-- - In the worst case (no indexes or all rows match the filter), the time complexity is approximately O(N log N) due to sorting. With optimal indexing, it could be closer to O(N).

-- Space Complexity:
-- The space complexity depends on the storage required for the filtered results and for sorting.
-- - Approximately O(K) where K is the number of rows that satisfy the `WHERE` clause, for storing the intermediate results and for sorting.

SELECT 
    id,
    movie,
    description,
    rating
FROM 
    Cinema
WHERE 
    id % 2 = 1
    AND description != 'boring'
ORDER BY 
    rating DESC;