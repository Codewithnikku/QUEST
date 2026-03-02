-- Intuition:
-- The problem requires us to assign a rank to each score such that higher scores receive a higher rank.
-- If two scores are the same, they should receive the same rank.
-- The ranks should be consecutive, meaning there should be no gaps in the ranking sequence (e.g., if ranks are 1, 1, 2, 3, 3, 4, not 1, 1, 3, 4, 4, 6).
-- This is a classic use case for the `DENSE_RANK()` window function.

-- Approach:
-- 1. Select the `score` column from the `Scores` table.
-- 2. Use the `DENSE_RANK()` window function to calculate the rank.
--    - `OVER (ORDER BY score DESC)` specifies that the ranking should be based on the `score` column in descending order (higher score gets higher rank).
--    - `DENSE_RANK()` assigns consecutive ranks without gaps, giving the same rank to ties.
-- 3. Alias the calculated rank as 'rank'.
-- 4. Order the final result by `score` in descending order to present the ranked scores from highest to lowest.

-- Time Complexity:
-- The primary operation is sorting the `Scores` table to apply the `DENSE_RANK()` window function.
-- If `N` is the number of rows in the `Scores` table, sorting typically takes O(N log N) time.
-- Therefore, the time complexity is O(N log N).

-- Space Complexity:
-- The space complexity is mainly determined by the storage required for sorting the scores.
-- This typically involves O(N) auxiliary space for storing and manipulating the data during the sort operation.

SELECT
  score,
  DENSE_RANK() OVER (ORDER BY score DESC) AS 'rank'
FROM
  Scores
ORDER BY
  score DESC;
