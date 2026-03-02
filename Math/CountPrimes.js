/**
 * @param {number} n
 * @return {number}
 */
var countPrimes = function(n) {
    if (n <= 2) return 0;
    
    let isPrime = new Uint8Array(n).fill(1);
    isPrime[0] = isPrime[1] = 0;
    
    let count = 0;
    for (let i = 2; i < n; i++) {
        if (isPrime[i]) {
            count++;
            if (i * i < n) {
                for (let j = i * i; j < n; j += i) {
                    isPrime[j] = 0;
                }
            }
        }
    }
    return count;
};
