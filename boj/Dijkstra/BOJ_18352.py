# 백준 11779 특정 거리의 도시 찾기 
# 21.02.28

import sys
import heapq
from functools import cmp_to_key
from collections import deque
from itertools import combinations
from itertools import permutations
sys.setrecursionlimit(10**6)

INF = int(1e9)

n, m, k, x = map(int, sys.stdin.readline().split())

edges = [[] for _ in range(n+1)]
dist = [INF] * (n + 1)

for _ in range(m):
    u, v = map(int, sys.stdin.readline().split())
    edges[u].append(v)

dist[x] = 0
q = []
q.append((0, x))
while q:
    cost, now = heapq.heappop(q)

    if cost > dist[now]: continue

    for i in range(0, len(edges[now])):
        next = edges[now][i]

        if cost + 1 < dist[next]:
            dist[next] = cost + 1
            heapq.heappush(q, (cost + 1, next))

if not k in dist: print(-1)
else:
    for i in range(1, n + 1):
        if dist[i] == k: print(i)