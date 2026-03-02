-- Intuition:
-- The problem asks us to find numbers that appear at least three times consecutively in the `Logs` table.
-- This means we need to look for a number `X` at `id=i`, `id=i+1`, and `id=i+2` such that all three `num` values are `X`.

-- Approach:
-- 1. Self-Join the `Logs` table three times:
--    - `l1` represents the current log entry.
--    - `l2` represents the log entry immediately following `l1` (i.e., `l2.id = l1.id + 1`).
--    - `l3` represents the log entry immediately following `l2` (i.e., `l3.id = l1.id + 2`).
-- 2. Filter for consecutive identical numbers:
--    - The `WHERE` clause checks if the `num` values for `l1`, `l2`, and `l3` are all equal (`l1.num = l2.num AND l2.num = l3.num`).
-- 3. Select distinct numbers:
--    - Use `SELECT DISTINCT l1.num` to return only the unique consecutive numbers, as a number might appear in multiple consecutive sequences.

-- Time Complexity:
-- The dominant operation is the three self-joins. If `N` is the number of rows in the `Logs` table,
-- a join operation can take up to O(N^2) in the worst case. With three joins, the complexity could theoretically be O(N^3).
-- However, with proper indexing on the `id` column, the joins can be much faster, closer to O(N) for each join,
-- leading to an overall time complexity of O(N) if the `id` column is indexed and the database optimizer is efficient.
-- Without indexes, or in a worst-case scenario, it could be higher.

-- Space Complexity:
-- The space complexity depends on the intermediate results of the joins. In the worst case,
-- if the joined tables are materialized, it could be O(N) for storing the intermediate results.
-- If the database can perform the joins efficiently without materializing large intermediate tables,
-- the space complexity could be lower.

SELECT DISTINCT l1.num AS ConsecutiveNums
FROM Logs l1
JOIN Logs l2 ON l1.id = l2.id - 1
JOIN Logs l3 ON l1.id = l3.id - 2
WHERE l1.num = l2.num AND l2.num = l3.num;
