-- Intuition:
-- The problem asks us to report the number of times each student attended each exam.
-- This means for every student and every subject, we need to count how many times that student took an exam in that specific subject.
-- If a student did not attend any exam for a particular subject, the count should be 0.

-- Approach:
-- 1. Generate all possible (student, subject) pairs:
--    - Use a `CROSS JOIN` between the `Students` table and the `Subjects` table. This creates a Cartesian product, ensuring every student is paired with every subject.
-- 2. Link with examinations:
--    - Use a `LEFT JOIN` with the `Examinations` table. This is crucial because we want to keep all (student, subject) pairs generated in step 1, even if there's no corresponding examination record.
--    - The join condition should match `student_id` and `subject_name` to link a specific student's exam attempt in a specific subject.
-- 3. Count attended exams:
--    - Group the results by `student_id`, `student_name`, and `subject_name`.
--    - Use `COUNT(e.student_id)` to count the number of examination records for each (student, subject) group. `COUNT(e.student_id)` will correctly count `NULL` as 0 for subjects where a student had no exams due to the `LEFT JOIN`.
-- 4. Order the results:
--    - Order the final output by `student_id` and then by `subject_name` for a structured report.

-- Time Complexity:
-- Let `S` be the number of students, `B` be the number of subjects, and `E` be the number of examinations.
-- - `CROSS JOIN` between `Students` and `Subjects` creates `S * B` rows. This is the dominant factor.
-- - `LEFT JOIN` with `Examinations` involves matching `S * B` rows with `E` rows. With proper indexing on `student_id` and `subject_name` in `Examinations`, this can be efficient.
-- - `GROUP BY` operation typically takes O((S * B) log (S * B)) due to sorting, or O(S * B) with hashing.
-- - Overall, the time complexity is approximately O(S * B + E) if joins are efficient, or O((S * B) log (S * B)) due to grouping.

-- Space Complexity:
-- The space complexity depends on the intermediate results of the `CROSS JOIN` and `GROUP BY`.
-- - The `CROSS JOIN` generates `S * B` rows, which can consume O(S * B) space.
-- - The `GROUP BY` operation might require O(S * B) space for storing intermediate group results.
-- - Overall, the space complexity is approximately O(S * B).

SELECT 
    s.student_id,
    s.student_name,
    sub.subject_name,
    COUNT(e.student_id) AS attended_exams
FROM Students s
CROSS JOIN Subjects sub
LEFT JOIN Examinations e 
    ON s.student_id = e.student_id 
    AND sub.subject_name = e.subject_name
GROUP BY s.student_id, s.student_name, sub.subject_name
ORDER BY s.student_id, sub.subject_name;