var rearrangeSticks = function(n, k) {
    const dp = Array.from({ length: n + 1 }, () => Array(n + 1).fill(0));
    dp[0][0] = 1;
    for (let i = 1; i <= n; i++) {
        for (let j = 1; j <= i; j++) {
            dp[i][j] = (dp[i - 1][j - 1] + (i - 1) * dp[i - 1][j]) % (10**9 + 7);
        }
    }
    return dp[n][k];
};