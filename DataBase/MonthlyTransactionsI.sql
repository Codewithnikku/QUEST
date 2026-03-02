-- Intuition:
-- The problem asks us to analyze transactions on a monthly and country basis.
-- For each month and country, we need to report:
-- 1. The total number of transactions (`trans_count`).
-- 2. The number of approved transactions (`approved_count`).
-- 3. The total amount of all transactions (`trans_total_amount`).
-- 4. The total amount of approved transactions (`approved_total_amount`).

-- Approach:
-- 1. Extract month and year:
--    - Use `DATE_FORMAT(trans_date, '%Y-%m')` to extract the year and month from the `trans_date` column. This will be used for grouping.
-- 2. Group by month and country:
--    - `GROUP BY DATE_FORMAT(trans_date, '%Y-%m'), country` aggregates the data for each unique month-country combination.
-- 3. Calculate aggregate values:
--    - `COUNT(*)`: Counts all transactions in the group.
--    - `SUM(CASE WHEN state = 'approved' THEN 1 ELSE 0 END)`: Counts approved transactions. This `CASE` statement assigns `1` for approved transactions and `0` for others, then sums them up.
--    - `SUM(amount)`: Calculates the total amount of all transactions.
--    - `SUM(CASE WHEN state = 'approved' THEN amount ELSE 0 END)`: Calculates the total amount of approved transactions. This `CASE` statement includes the `amount` for approved transactions and `0` for others, then sums them up.
-- 4. Order the results:
--    - `ORDER BY month, country` ensures the output is sorted chronologically by month and then alphabetically by country.

-- Time Complexity:
-- Let `N` be the number of rows in the `Transactions` table.
-- - The `DATE_FORMAT` function is applied to each row.
-- - The `GROUP BY` operation involves sorting or hashing all `N` transactions. This typically takes O(N log N) due to sorting, or O(N) with hashing.
-- - The `SUM` and `COUNT` aggregate functions are performed during the grouping.
-- - Overall, the time complexity is approximately O(N log N) in the worst case, or O(N) with optimal indexing and query planning.

-- Space Complexity:
-- The space complexity depends on the intermediate results of grouping.
-- - The `GROUP BY` operation might require O(M * C) space, where `M` is the number of distinct months and `C` is the number of distinct countries, to store intermediate group results.
-- - In the worst case, this could be O(N) if all month-country combinations are unique.

SELECT 
    DATE_FORMAT(trans_date, '%Y-%m') AS month,
    country,
    COUNT(*) AS trans_count,
    SUM(CASE WHEN state = 'approved' THEN 1 ELSE 0 END) AS approved_count,
    SUM(amount) AS trans_total_amount,
    SUM(CASE WHEN state = 'approved' THEN amount ELSE 0 END) AS approved_total_amount
FROM 
    Transactions
GROUP BY 
    DATE_FORMAT(trans_date, '%Y-%m'),
    country
ORDER BY 
    month,
    country;