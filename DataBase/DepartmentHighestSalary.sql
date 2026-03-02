-- Intuition:
-- We need to find the employees who have the highest salary in each department.
-- This involves two main steps: first, determining the maximum salary for each department,
-- and second, selecting the employees whose salaries match these maximums within their respective departments.

-- Approach:
-- 1. Identify the maximum salary for each department:
--    - Use a subquery that groups the `Employee` table by `departmentId` and calculates the `MAX(salary)` for each group.
-- 2. Filter employees based on these maximum salaries:
--    - Join the `Employee` table with the `Department` table to get department names.
--    - Use a `WHERE` clause with an `IN` operator to select employees whose `(salary, departmentId)` pair matches any of the `(MAX(salary), departmentId)` pairs found in the subquery.
--    - This ensures that only employees with the highest salary in their department are selected.
-- 3. Select the `Department` name, `Employee` name, and `Salary`.

-- Time Complexity:
-- The time complexity will primarily depend on the `GROUP BY` operation in the subquery and the `JOIN` operation.
-- If `N` is the number of employees and `M` is the number of departments:
-- - The subquery involves scanning the `Employee` table and grouping, which is typically O(N) or O(N log N) if sorting is required for grouping.
-- - The main query involves joining `Employee` and `Department` tables (O(N) if `departmentId` is indexed) and then filtering using the results of the subquery.
-- - Overall, the time complexity is approximately O(N) or O(N log N) depending on indexing and the database's execution plan.

-- Space Complexity:
-- The space complexity will depend on the storage needed for the intermediate results of the subquery and the join.
-- - The subquery might require O(M) space to store the maximum salaries for each department.
-- - The join operation might require O(N) space for temporary tables.
-- - Overall, the space complexity is approximately O(N + M).

SELECT d.name AS Department, e.name AS Employee, e.salary AS Salary
FROM Employee e
JOIN Department d ON e.departmentId = d.id
WHERE (e.salary, e.departmentId) IN (
    SELECT MAX(salary), departmentId
    FROM Employee
    GROUP BY departmentId
);
