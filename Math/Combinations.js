/**
 * @param {number} n
 * @param {number} k
 * @return {number[][]}
 */

var combine = function(n, k) {
    let res = [];
    let comb = [];
    function backtrack(start) {
        if (comb.length === k) {
            res.push([...comb]);
            return;
        }
        for (let i = start; i <= n; i++) {
            comb.push(i);
            backtrack(i + 1);
            comb.pop();
        }
    }
    backtrack(1);
    return res;
};