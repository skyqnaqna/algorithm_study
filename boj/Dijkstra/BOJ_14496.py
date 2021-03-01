# 백준 14496 그대, 그머가 되어
# 21.03.01

import sys
import heapq
from functools import cmp_to_key
from collections import deque
from itertools import combinations
from itertools import permutations
sys.setrecursionlimit(10**6)

INF = int(1e9)

a, b = map(int, sys.stdin.readline().split())
n, m = map(int, sys.stdin.readline().split())

edges = [[] for _ in range(n + 1)]
for _ in range(m):
    u, v = map(int, sys.stdin.readline().split())
    edges[u].append(v)
    edges[v].append(u)

dist = [INF] * (n + 1)
q = []
heapq.heappush(q, a)
dist[a] = 0

while q:
    now = heapq.heappop(q)
    cost = dist[now] + 1

    for next in edges[now]:
        if cost < dist[next]:
            dist[next] = cost
            heapq.heappush(q, next)

if dist[b] < INF: print(dist[b])
else: print(-1)