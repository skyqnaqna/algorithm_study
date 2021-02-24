# 백준 11404 플로이드
# 21.02.24

import sys
from functools import cmp_to_key
from collections import deque
from itertools import combinations
from itertools import permutations
sys.setrecursionlimit(10**6)

INF = 1e9

n = int(input())
m = int(input())
graph = [[INF] * (n + 1) for _ in range(n + 1)]

for _ in range(m):
    u, v, w = map(int, sys.stdin.readline().split())
    graph[u][v] = min(graph[u][v], w)

for k in range(1, n + 1):
    for a in range(1, n + 1):
        for b in range(1, n + 1):
            if a == b or a == k or b == k: continue

            graph[a][b] = min(graph[a][b], graph[a][k] + graph[k][b])

for i in range(1, n + 1):
    for j in range(1, n + 1):
        if graph[i][j] >= INF: print(0, end=" ")
        else: print(graph[i][j], end=" ")
    print()
