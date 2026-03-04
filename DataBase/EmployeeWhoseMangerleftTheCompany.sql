-- Intuition:
-- Find employees with salary less than 30000 whose manager has left the company.
-- If a manager leaves, their row is removed from Employees, but reports still keep manager_id.
-- So an employee qualifies when manager_id is not null and not present among existing employee_ids.

-- Approach:
-- 1. Filter employees with salary < 30000.
-- 2. Ensure they currently have a manager_id (not null).
-- 3. Exclude those whose manager_id still exists in Employees, i.e., manager_id NOT IN (SELECT employee_id FROM Employees).
-- 4. Return employee_id ordered ascending as required.

-- Time Complexity:
-- Let N be number of rows in Employees. The subquery scans Employees once and the outer filter scans Employees once.
-- Typical complexity O(N) to O(N log N) depending on indexing and NOT IN evaluation.

-- Space Complexity:
-- O(N) for the subquery result set, often optimized by the database engine; output size is O(K).

SELECT employee_id
FROM Employees
WHERE salary < 30000
  AND manager_id IS NOT NULL
  AND manager_id NOT IN (SELECT employee_id FROM Employees)
ORDER BY employee_id;
