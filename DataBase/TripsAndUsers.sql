-- Intuition:
-- The problem asks us to calculate the cancellation rate of requests made by unbanned users between '2013-10-01' and '2013-10-03'.
-- The cancellation rate is defined as the number of cancelled trips divided by the total number of trips.
-- We need to consider only trips where both the client and the driver are not banned.

-- Approach:
-- 1. Filter trips by date: Select trips within the specified date range ('2013-10-01' to '2013-10-03').
-- 2. Filter out banned users:
--    - Join the `Trips` table with the `Users` table twice: once for the client and once for the driver.
--    - In both joins, ensure that the `banned` status is 'No'. This effectively filters out trips involving banned clients or drivers.
-- 3. Calculate cancellation status:
--    - Use a `CASE` statement to assign `1` if a trip's `status` is not 'completed' (i.e., cancelled) and `0` otherwise.
-- 4. Group by request date: Group the results by `request_at` to calculate the cancellation rate for each day.
-- 5. Calculate cancellation rate:
--    - `SUM(CASE WHEN t.status != 'completed' THEN 1 ELSE 0 END)` gives the total number of cancelled trips for each day.
--    - `COUNT(*)` gives the total number of trips for each day (after filtering banned users).
--    - Divide the sum of cancelled trips by the total number of trips.
--    - Multiply by `1.0` to ensure floating-point division and `ROUND` the result to two decimal places.

-- Time Complexity:
-- The time complexity is dominated by the `JOIN` operations and the `GROUP BY` clause.
-- If `T` is the number of trips and `U` is the number of users:
-- - The two `JOIN` operations can take up to O(T * U) in the worst case, but with proper indexing on `users_id` and `client_id`/`driver_id`, it can be closer to O(T + U).
-- - The `GROUP BY` operation typically takes O(T log T) due to sorting.
-- - Overall, with efficient indexing, the time complexity is approximately O(T log T).

-- Space Complexity:
-- The space complexity depends on the intermediate results of the joins and the grouping.
-- - Intermediate join results could take O(T) space.
-- - The `GROUP BY` operation might require O(D) space, where `D` is the number of distinct days in the result.
-- - Overall, the space complexity is approximately O(T).

SELECT 
    t.request_at AS Day,
    ROUND(SUM(CASE 
                 WHEN t.status != 'completed' THEN 1 
                 ELSE 0 
              END) * 1.0 / COUNT(*), 2) AS "Cancellation Rate"
FROM Trips t
JOIN Users c ON t.client_id = c.users_id AND c.banned = 'No'
JOIN Users d ON t.driver_id = d.users_id AND d.banned = 'No'
WHERE t.request_at BETWEEN '2013-10-01' AND '2013-10-03'
GROUP BY t.request_at;
