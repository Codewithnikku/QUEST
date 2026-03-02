var maxPoints = function(points) {
    const n = points.length;
    if (n <= 2) return n;

    let max = 0;

    const gcd = (a, b) => b === 0 ? a : gcd(b, a % b);

    for (let i = 0; i < n; i++) {
        const map = new Map();
        let currentMax = 0;

        for (let j = i + 1; j < n; j++) {
            let dx = points[j][0] - points[i][0];
            let dy = points[j][1] - points[i][1];

            const common = gcd(dx, dy);
            dx /= common;
            dy /= common;

            const slope = `${dx}/${dy}`;
            map.set(slope, (map.get(slope) || 0) + 1);
            if (map.get(slope) > currentMax) currentMax = map.get(slope);
        }
        if (currentMax + 1 > max) max = currentMax + 1;
    }

    return max;
};