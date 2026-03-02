/**
 * @param {number} left
 * @param {number} right
 * @return {number[]}
 */
var closestPrimes = function(left, right) {
    let isPrime = new Uint8Array(right + 1).fill(1);
    isPrime[0] = isPrime[1] = 0;
    for (let i = 2; i * i <= right; i++) {
        if (isPrime[i]) {
            for (let j = i * i; j <= right; j += i) {
                isPrime[j] = 0;
            }
        }
    }
    let prev = -1, minDiff = Infinity;
    let result = [-1, -1];
    for (let i = left; i <= right; i++) {
        if (isPrime[i]) {
            if (prev !== -1) {
                let diff = i - prev;
                if (diff < minDiff) {
                    minDiff = diff;
                    result = [prev, i];
                }
                if (minDiff <= 2) return result;
            }
            prev = i;
        }
    }
    return result;
};
