# 백준 1854 K번째 최단경로 찾기
# 21.03.03

import sys
import heapq
from functools import cmp_to_key
from collections import deque
from itertools import combinations
from itertools import permutations
# sys.setrecursionlimit(10**6)
rd = sys.stdin.readline

INF = int(1e9)

n, m, k = map(int, rd().split())
edges = [[] for _ in range(n + 1)]
dist = [[] for _ in range(n + 1)]

for _ in range(m):
    u, v, w = map(int, rd().split())
    edges[u].append((v, w))

q = []
heapq.heappush(q, (0, 1))
heapq.heappush(dist[1], 0)

while q:
    cost, now = heapq.heappop(q)

    for edge in edges[now]:
        nx, nxCost = edge

        if len(dist[nx]) < k:
            # 파이썬의 힙은 최소힙이기 때문에 K번째 경로가 top에 위치하도록 마이너스 부호를 붙여서 삽입한다
            heapq.heappush(dist[nx], -(cost + nxCost))
            heapq.heappush(q, (cost + nxCost, nx))
        elif cost + nxCost < -dist[nx][0]:
            heapq.heappop(dist[nx])
            heapq.heappush(dist[nx], -(cost + nxCost))
            # K번째 경로의 최단 경로가 갱신되면 다른 경로에도 영향을 끼치므로 큐에 넣고 갱신한다
            heapq.heappush(q, (cost + nxCost, nx))

for i in range(1, n + 1):
    if len(dist[i]) < k: print(-1)
    else: print(-dist[i][0])
