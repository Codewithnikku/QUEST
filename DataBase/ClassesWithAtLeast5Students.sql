-- Intuition:
-- The problem asks us to find all classes that have at least 5 students.
-- This means we need to count the number of students in each class and then filter for classes where this count is 5 or more.

-- Approach:
-- 1. Group by class:
--    - Use `GROUP BY class` to aggregate all records belonging to the same class.
-- 2. Count students in each class:
--    - For each group (class), use `COUNT(student)` to count the number of students.
--    - Note: `COUNT(DISTINCT student)` would be used if a student could be listed multiple times for the same class and we only wanted to count unique students. Assuming each row represents a unique student enrollment in a class, `COUNT(student)` is sufficient.
-- 3. Filter classes with at least 5 students:
--    - Use the `HAVING` clause to filter the grouped results, keeping only those classes where `COUNT(student) >= 5`.
-- 4. Select the class name:
--    - Select the `class` column for the filtered groups.

-- Time Complexity:
-- Let `N` be the number of rows in the `courses` table.
-- - The `GROUP BY` operation involves scanning all `N` rows and then sorting or hashing them to form groups. This typically takes O(N log N) due to sorting, or O(N) with hashing.
-- - The `COUNT(student)` aggregation and `HAVING` clause are performed during or after the grouping.
-- - Overall, the time complexity is approximately O(N log N) in the worst case, or O(N) with optimal indexing and query planning.

-- Space Complexity:
-- The space complexity depends on the intermediate results of grouping.
-- - The `GROUP BY` operation might require O(C) space, where `C` is the number of distinct classes, to store intermediate group results.
-- - In the worst case, this could be O(N) if all classes are unique.

SELECT class
FROM courses
GROUP BY class
HAVING COUNT(student) >= 5;