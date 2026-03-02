var selfDividingNumbers = function(left, right) {
    const result = [];
    
    for (let num = left; num <= right; num++) {
        if (isSelfDividing(num)) {
            result.push(num);
        }
    }
    
    return result;
};

function isSelfDividing(num) {
    const original = num;
    while (num > 0) {
        const digit = num % 10;
        if (digit === 0 || original % digit !== 0) {
            return false;
        }
        num = Math.floor(num / 10);
    }
    return true;
}