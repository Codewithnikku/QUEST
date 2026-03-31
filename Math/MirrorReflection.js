/**
 * @param {number} p
 * @param {number} q
 * @return {number}
 */
var mirrorReflection = function(p, q) {
    const gcd = (a, b) => b === 0 ? a : gcd(b, a % b);
    let g = gcd(p, q);
    p /= g;
    q /= g;
    
    if (p % 2 === 0) return 2;
    if (q % 2 === 0) return 0;
    return 1;
};