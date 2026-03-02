var smallestRepunitDivByK = function(k) {
    if (k % 2 === 0 || k % 5 === 0) return -1;
    let remainder = 0;
    for (let i = 1; i <= k; i++) {
        remainder = (remainder * 10 + 1) % k;
        if (remainder === 0) return i;
    }
    return -1;
}