# 백준 1309 동물원
# 21.02.22

import sys
from functools import cmp_to_key
from collections import deque
from itertools import combinations
from itertools import permutations
sys.setrecursionlimit(10**6)

n = int(input())
m = 9901
d = [[0] * 3 for _ in range(n)] # 0 : 배치 안함 / 1 : 왼쪽에 배치 / 2 : 오른쪽에 배치
d[0][0] = d[0][1] = d[0][2] = 1

for i in range(1, n):
    d[i][0] = (d[i-1][0] + d[i-1][1] + d[i-1][2])%m
    d[i][1] = (d[i-1][0] + d[i-1][2])%m
    d[i][2] = (d[i-1][0] + d[i-1][1])%m

print(sum(d[n-1])%m)