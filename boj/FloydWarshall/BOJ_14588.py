# 백준 14588 Line Friends (Small)
# 21.03.03

import sys
import heapq
from functools import cmp_to_key
from collections import deque
from itertools import combinations
from itertools import permutations
# sys.setrecursionlimit(10**6)

INF = int(1e9)

n = int(input())
edges = [(0, 0)]
for _ in range(n):
    l, r = map(int, sys.stdin.readline().split())
    edges.append((l, r))

graph = [[INF] * (n + 1) for _ in range(n + 1)]
# 거리 1인 친구부터 구하기
for i in range(1, n + 1):
    l1, r1 = edges[i]
    for j in range(1, n + 1):
        if i == j or graph[i][j] < INF: continue
        l2, r2 = edges[j]
        if l1 <= l2 <= r1 or l1 <= r2 <= r1 or l2 <= l1 <= r2 or l2 <= r1 <= r2:
            graph[i][j] = graph[j][i] = 1

for k in range(1, n + 1):
    for i in range(1, n + 1):
        for j in range(1, n + 1):
            if i == j or i == k or j == k: continue
            graph[i][j] = min(graph[i][j], graph[i][k] + graph[k][j])

q = int(input())
for _ in range(q):
    a, b = map(int, sys.stdin.readline().split())
    if graph[a][b] < INF: print(graph[a][b])
    else: print(-1)