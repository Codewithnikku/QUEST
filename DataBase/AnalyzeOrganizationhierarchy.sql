-- Intuition:
-- We need hierarchy levels, total team size (all descendants), and total budget (subtree salaries including self).
-- A standard top-down closure (manager -> descendants) can be O(N^2) and very slow for deep trees.
-- Instead, we use a bottom-up ancestry approach (employee -> all ancestors).
-- Since each employee has only ONE manager, the join in each recursive step is 1-to-1,
-- which is significantly faster and more stable for the database optimizer than 1-to-many branching.

-- Approach:
-- 1) levels: Recursive top-down starting from manager_id IS NULL (level 1) to find depths.
-- 2) ancestry: Recursive bottom-up starting from each employee (descendant_id).
--    In each step, we find the employee's manager (ancestor_id) and carry the descendant's salary up.
-- 3) Join levels with ancestry on level.employee_id = ancestry.ancestor_id.
-- 4) Aggregate: COUNT(descendants) - 1 for team size, and SUM(salary) for the total budget.
-- 5) Final sort by level ASC, budget DESC, employee_name ASC.

-- Time Complexity:
-- O(N * D) where N is number of employees and D is average depth of the tree.
-- In a typical hierarchy, D is small (log N), making this very efficient.
-- Space Complexity:
-- O(N * D) to store the ancestor-descendant pairs in the intermediate ancestry set.

WITH RECURSIVE 
-- Top-down to find levels
levels AS (
  SELECT 
    e.employee_id,
    e.employee_name,
    e.salary,
    1 AS level
  FROM Employees e
  WHERE e.manager_id IS NULL
  UNION ALL
  SELECT 
    e.employee_id,
    e.employee_name,
    e.salary,
    l.level + 1
  FROM Employees e
  JOIN levels l ON e.manager_id = l.employee_id
),
-- Bottom-up to build descendant -> ancestor pairs
-- Each employee finds all their ancestors by going up one manager at a time.
ancestry AS (
  SELECT 
    e.employee_id AS descendant_id,
    e.employee_id AS ancestor_id,
    e.salary
  FROM Employees e
  UNION ALL
  SELECT 
    a.descendant_id,
    e.manager_id AS ancestor_id,
    a.salary
  FROM ancestry a
  JOIN Employees e ON e.employee_id = a.ancestor_id
  WHERE e.manager_id IS NOT NULL
)
-- Aggregate stats for each node acting as an ancestor (manager)
SELECT 
  l.employee_id,
  l.employee_name,
  l.level,
  COUNT(a.descendant_id) - 1 AS team_size,
  SUM(a.salary) AS budget
FROM levels l
JOIN ancestry a ON l.employee_id = a.ancestor_id
GROUP BY 
  l.employee_id, 
  l.employee_name, 
  l.level
ORDER BY 
  l.level ASC, 
  budget DESC, 
  l.employee_name ASC;
