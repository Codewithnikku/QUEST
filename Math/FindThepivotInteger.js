var pivotInteger = function(n) {
    let sum = 0;
    for(let i=1; i<=n; i++){
        sum += i;
    }
    let pivot = Math.sqrt(sum);
    if(pivot === Math.floor(pivot)) return pivot;
    return -1;
}

console.log(pivotInteger(8));
