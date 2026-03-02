SELECT e.name AS Employee
FROM Employee e
JOIN Employee m
ON e.managerId = m.id
WHERE e.salary > m.salary;


/*
Intuition:
We need to find the employees who earn more than their managers.
We can do this by joining the Employee table with itself based on the managerId.
We then compare the salary of each employee with the salary of their manager.

Approach:
1. We start by selecting the name column from the Employee table.
2. We then join the Employee table with itself based on the managerId.
3. We alias the joined table as e for the Employee table and m for the Manager table.
4. We compare the salary of each employee with the salary of their manager using the WHERE clause.
5. If the salary of an employee is greater than the salary of their manager,
   we include that employee in the result.

Time Complexity: O(n)
Space Complexity: O(n)
*/