# 백준 2670 연속부분최대곱
# 21.02.22

import sys
from functools import cmp_to_key
from collections import deque
from itertools import combinations
from itertools import permutations
sys.setrecursionlimit(10**6)

n = int(input())
arr = []
for _ in range(n):
    arr.append(float(sys.stdin.readline().rstrip()))


for i in range(1, n):
    arr[i] = max(arr[i - 1] * arr[i], arr[i])

print("%.3f" %max(arr))