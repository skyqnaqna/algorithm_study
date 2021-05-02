# 백준 2493 탑
# 21.05.02

import sys
import heapq
from functools import cmp_to_key
from collections import deque
from itertools import combinations
from itertools import permutations
# sys.setrecursionlimit(10**6)
rd = sys.stdin.readline
INF = int(1e9)

n = int(rd())
tops = list(map(int, rd().split()))
result = [0] * n
stack = []

for i in range(n-1, -1, -1):
    while stack and tops[stack[-1]] < tops[i]:
        result[stack[-1]] = i + 1
        stack.pop()
    stack.append(i)

for res in result:
    print(res, end=" ")