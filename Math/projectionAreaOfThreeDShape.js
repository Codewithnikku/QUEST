var projectionArea = function (grid) {
    let res = 0;
    const n = grid.length;
    for (let i = 0; i < n; i++) {
        let maxRow = 0;
        let maxCol = 0;
        for (let j = 0; j < n; j++) {
            const v1 = grid[i][j];
            const v2 = grid[j][i];
            if (v1 > 0) res++;
            if (v1 > maxRow) maxRow = v1;
            if (v2 > maxCol) maxCol = v2;
        }
        res += maxRow + maxCol;
    }
    return res;
};