/**
 * @param {string[]} arr
 * @return {number}
 */
var maxLength = function(arr) {
    let maxLen = 0;
    backtrack(0, '');
    return maxLen;
    
    function backtrack(index, current) {
        if (index === arr.length) {
            maxLen = Math.max(maxLen, current.length);
            return;
        }
        backtrack(index + 1, current);
        if (hasUniqueChars(current + arr[index])) {
            backtrack(index + 1, current + arr[index]);
        }
    }
    
    function hasUniqueChars(str) {
        const charSet = new Set(str);
        return charSet.size === str.length;
    }
};