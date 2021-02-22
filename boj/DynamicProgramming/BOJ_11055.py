# 백준 11055 가장 큰 증가 부분 수열
# 21.02.22

import sys
from functools import cmp_to_key
from collections import deque
from itertools import combinations
from itertools import permutations
sys.setrecursionlimit(10**6)

n = int(input())
arr = list(map(int, sys.stdin.readline().split()))
d = [0] * n
d[0] = arr[0]

ans = d[0]
for i in range(1, n):
    d[i] = arr[i]
    for j in range(0, i):
        if arr[j] < arr[i] and d[i] < d[j] + arr[i]:
            d[i] = d[j] + arr[i]
    ans = max(ans, d[i])

print(ans)