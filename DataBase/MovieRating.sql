-- Intuition:
-- This problem requires us to find two distinct pieces of information and combine them:
-- 1. The name of the user who has rated the most movies. In case of a tie, the user with the lexicographically smallest name should be chosen.
-- 2. The title of the movie that has the highest average rating in February 2020. In case of a tie, the movie with the lexicographically smallest title should be chosen.
-- We will use `UNION ALL` to combine these two results.

-- Approach:

-- Part 1: Find the user with the most movie ratings
-- 1. Join the `MovieRating` table with the `Users` table on `user_id`.
-- 2. Group the results by `user_id` and `u.name` to count the number of ratings each user has made.
-- 3. Order these grouped results first by the count of ratings in descending order (most ratings first),
--    and then by the user's name in ascending order (lexicographically smallest name for ties).
-- 4. Use `LIMIT 1` to retrieve only the top user.

-- Part 2: Find the movie with the highest average rating in February 2020
-- 1. Filter the `MovieRating` table to include only ratings made in February 2020.
--    This can be done by checking `YEAR(mr.created_at) = 2020 AND MONTH(mr.created_at) = 2`.
-- 2. Join the filtered `MovieRating` table with the `Movies` table on `movie_id`.
-- 3. Group the results by `movie_id` and `m.title` to calculate the average rating for each movie.
-- 4. Order these grouped results first by the average rating in descending order (highest average first),
--    and then by the movie's title in ascending order (lexicographically smallest title for ties).
-- 5. Use `LIMIT 1` to retrieve only the top movie.

-- Combine Results:
-- Use `UNION ALL` to combine the single result from Part 1 and the single result from Part 2.

-- Time Complexity:
-- Let `R` be the total number of ratings, `U` be the number of users, and `M` be the number of movies.
-- Part 1: Involves a join and a group by. With appropriate indexing on `user_id`, this can be approximately O(R log R) due to sorting for grouping, or O(R + U) if hashing is used.
-- Part 2: Involves filtering, a join, and a group by. Similarly, with indexing on `movie_id` and `created_at`, this can be approximately O(R log R) or O(R + M).
-- The `UNION ALL` operation typically takes time proportional to the sum of the rows returned by each query (which is constant here, 2 rows).
-- Overall, the dominant factor is the grouping and sorting, leading to a time complexity of approximately O(R log R).

-- Space Complexity:
-- The space complexity depends on the intermediate results of the joins and grouping operations.
-- Part 1 might require O(U) space for storing grouped user ratings.
-- Part 2 might require O(M) space for storing grouped movie ratings.
-- Overall, the space complexity is approximately O(U + M) in the worst case for storing intermediate results.

(SELECT u.name AS results
FROM MovieRating mr
JOIN Users u ON mr.user_id = u.user_id
GROUP BY mr.user_id
ORDER BY COUNT(*) DESC, u.name ASC
LIMIT 1)

UNION ALL

(SELECT m.title AS results
FROM MovieRating mr
JOIN Movies m ON mr.movie_id = m.movie_id
WHERE YEAR(mr.created_at) = 2020 AND MONTH(mr.created_at) = 2
GROUP BY mr.movie_id
ORDER BY AVG(mr.rating) DESC, m.title ASC
LIMIT 1)