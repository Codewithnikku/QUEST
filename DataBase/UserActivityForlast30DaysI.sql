-- Intuition:
-- The problem asks us to calculate the number of active users each day for a specific 30-day period ending on '2019-07-27'.
-- An active user on a given day is defined as a user who performed at least one activity on that day.
-- We need to count distinct users for each day within the specified window.

-- Approach:
-- 1. Filter by date range:
--    - The `WHERE` clause filters activities to be within the 30-day period ending on '2019-07-27'.
--    - `DATE_SUB('2019-07-27', INTERVAL 29 DAY)` calculates the start date of the 30-day window (inclusive).
--    - So, `activity_date > DATE_SUB('2019-07-27', INTERVAL 29 DAY)` effectively selects dates from '2019-06-28' to '2019-07-27'.
-- 2. Group by activity date:
--    - `GROUP BY activity_date` aggregates the data for each day.
-- 3. Count distinct active users:
--    - `COUNT(DISTINCT user_id)` counts the unique users who performed an activity on each grouped day.
-- 4. Format the date:
--    - `CAST(activity_date AS DATE)` ensures the date is displayed without time components.
-- 5. Order the results:
--    - `ORDER BY activity_date` presents the results chronologically.

-- Time Complexity:
-- Let `A` be the number of rows in the `Activity` table.
-- - Filtering by date range typically involves scanning a portion of the table. If `activity_date` is indexed, this can be very efficient (O(log A) to find start/end, then O(K) for K rows in range).
-- - `GROUP BY activity_date` and `COUNT(DISTINCT user_id)` will involve sorting or hashing the data within the filtered range. This typically takes O(K log K) where K is the number of activities in the 30-day window.
-- - Overall, the time complexity is approximately O(A) in the worst case (if the entire table needs to be scanned), or O(K log K) if filtering is efficient and K is the number of relevant activities.

-- Space Complexity:
-- The space complexity depends on the intermediate results of grouping.
-- - The `GROUP BY` operation might require O(D) space, where `D` is the number of distinct days in the 30-day window (at most 30).
-- - Overall, the space complexity is relatively small, approximately O(D).

SELECT
    CAST(activity_date AS DATE) AS day,
    COUNT(DISTINCT user_id) AS active_users
FROM Activity
WHERE activity_date > DATE_SUB('2019-07-27', INTERVAL 29 DAY)
GROUP BY activity_date
ORDER BY activity_date;