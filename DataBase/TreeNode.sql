-- Intuition:
-- The problem asks us to classify each node in a tree as 'Root', 'Leaf', or 'Inner' based on its `id` and `p_id` (parent id).
-- - A 'Root' node has a `NULL` parent (`p_id IS NULL`).
-- - A 'Leaf' node has no children. This means its `id` does not appear as a `p_id` for any other node.
-- - An 'Inner' node is neither a 'Root' nor a 'Leaf'. It has a parent and also has children.

-- Approach:
-- 1. Use a `CASE` statement to apply the classification logic for each node.
-- 2. First condition: `WHEN p_id IS NULL THEN 'Root'`
--    - This identifies the root node(s) directly.
-- 3. Second condition: `WHEN id NOT IN (SELECT DISTINCT p_id FROM Tree WHERE p_id IS NOT NULL) THEN 'Leaf'`
--    - This identifies leaf nodes. A node is a leaf if its `id` is not present in the set of all `p_id` values (excluding `NULL` parents, which are roots).
--    - The subquery `(SELECT DISTINCT p_id FROM Tree WHERE p_id IS NOT NULL)` gets all `id`s that are parents of some other node.
-- 4. Else condition: `ELSE 'Inner'`
--    - Any node that is not a root and not a leaf must be an inner node.

-- Time Complexity:
-- The time complexity is primarily driven by the subquery used to identify leaf nodes.
-- If `N` is the number of nodes in the `Tree` table:
-- - The main query iterates through each node, which is O(N).
-- - The subquery `SELECT DISTINCT p_id FROM Tree WHERE p_id IS NOT NULL` involves scanning the `Tree` table and performing a `DISTINCT` operation, which can take O(N log N) due to sorting or O(N) with hashing.
-- - The `NOT IN` clause then compares each `id` with the results of the subquery. In the worst case, this could lead to O(N * M) where M is the number of distinct p_ids, but with efficient indexing and query optimization, it can be closer to O(N).
-- - Overall, the time complexity is approximately O(N log N) in the worst case, or O(N) with optimal indexing.

-- Space Complexity:
-- The space complexity depends on the intermediate results of the subquery.
-- - The subquery `SELECT DISTINCT p_id` might require O(N) space to store the distinct parent IDs.
-- - Overall, the space complexity is approximately O(N).

SELECT 
    id,
    CASE 
        WHEN p_id IS NULL THEN 'Root'
        WHEN id NOT IN (SELECT DISTINCT p_id FROM Tree WHERE p_id IS NOT NULL) THEN 'Leaf'
        ELSE 'Inner'
    END AS type
FROM Tree;
