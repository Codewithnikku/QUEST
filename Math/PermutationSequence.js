var getPermutation = function(n, k) {
    let factorial = 1;
    for (let i = 1; i <= n; i++) {
        factorial *= i;
    }
    let numbers = [];
    for (let i = 1; i <= n; i++) {
        numbers.push(i);
    }
    let result = '';
    k--;
    for (let i = 0; i < n; i++) {
        factorial /= (n - i);
        let index = Math.floor(k / factorial);
        result += numbers[index];
        numbers.splice(index, 1);
        k %= factorial;
    }
    return result;
}