/**
 * @param {number} x
 * @return {number}
 */
var reverse = function(x) {
        let sign = x < 0 ? -1 : 1;
        let rev = 0;
        let abs = Math.abs(x);
        while (abs > 0) {
            rev = rev * 10 + abs % 10;
            abs = Math.floor(abs / 10);
        }
        rev = sign * rev;
        if (rev < -2147483648 || rev > 2147483647) {
            return 0;
        }
        return rev;
};