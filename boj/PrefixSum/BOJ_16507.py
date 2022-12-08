# 백준 16507 어두운 건  무서워
# 22.12.08
# https://github.com/skyqnaqna/algorithm_study

import sys
rd = sys.stdin.readline

r, c, q = map(int, rd().split())

prefixSum = [[0] * (c + 1) for _ in range(r + 1)]

for i in range(1, r + 1):
    brightness = list(map(int, rd().split()))

    for j in range(1, c + 1):
        prefixSum[i][j] += prefixSum[i][j - 1] + brightness[j - 1]

for j in range(1, c + 1):
    for i in range(2, r + 1):
        prefixSum[i][j] += prefixSum[i - 1][j]


for _ in range(q):
    r1, c1, r2, c2 = map(int, rd().split())

    cnt = (r2 - r1 + 1) * (c2 - c1 + 1)

    res = (prefixSum[r2][c2] - prefixSum[r1 - 1][c2] - prefixSum[r2][c1 - 1] + prefixSum[r1 - 1][c1 - 1]) // cnt

    print(res)
