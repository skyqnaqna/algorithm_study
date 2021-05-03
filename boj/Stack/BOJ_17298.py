# 백준 17298 오큰수
# 21.05.03

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

A = list(map(int, rd().split()))
stack = []

for i in range(n):
    now = A[i]

    while stack and A[stack[-1]] < now:
        A[stack.pop()] = now
    stack.append(i)

for i in stack:
    A[i] = -1

answer = ""
for i in A:
    answer += str(i) + " "

print(answer)