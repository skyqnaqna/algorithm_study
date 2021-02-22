# 백준 1463 RGB거리
# 21.02.22

import sys
from functools import cmp_to_key
from collections import deque
from itertools import combinations
from itertools import permutations
sys.setrecursionlimit(10**6)

n = int(input())

d = []
for _ in range(n):
    d.append(list(map(int, sys.stdin.readline().split())))

for i in range(1, n):
    d[i][0] += min(d[i-1][1], d[i-1][2])
    d[i][1] += min(d[i-1][0], d[i-1][2])
    d[i][2] += min(d[i-1][0], d[i-1][1])

print(min(d[n-1]))