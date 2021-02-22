# 백준 1463 1로 만들기
# 21.02.22

import sys
from functools import cmp_to_key
from collections import deque
from itertools import combinations
from itertools import permutations
sys.setrecursionlimit(10**6)

n = int(input())

INF = 2147000000

d = [INF] * (1000001)
d[1] = 0
d[2] = 1
d[3] = 1

for i in range(4, n + 1):
    if i % 3 == 0: d[i] = min(d[i], d[i // 3] + 1)
    if i % 2 == 0: d[i] = min(d[i], d[i // 2] + 1)
    d[i] = min(d[i], d[i - 1] + 1)

print(d[n])