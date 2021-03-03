# 백준 1058 친구
# 21.03.03

import sys
import heapq
from functools import cmp_to_key
from collections import deque
from itertools import combinations
from itertools import permutations
sys.setrecursionlimit(10**6)

# 거리가 2이하인 친구만 세기
INF = int(1e9)
n = int(input())
graph = [[INF] * n for _ in range(n)]

for i in range(n):
    line = sys.stdin.readline().rstrip()
    for j in range(n):
        if line[j] == 'Y':
            graph[i][j] = 1

for k in range(n):
    for i in range(n):
        for j in range(n):
            if i == j or i == k or j == k: continue
            graph[i][j] = min(graph[i][j], graph[i][k] + graph[k][j])

ans = 0
for i in range(n):
    cnt = 0
    for j in range(n):
        if graph[i][j] <= 2: cnt += 1
    ans = max(ans, cnt)

print(ans)