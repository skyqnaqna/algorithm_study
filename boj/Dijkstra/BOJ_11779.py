# 백준 11779 최소비용 구하기 2
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
m = int(input())
edges = [[] for _ in range(n + 1)]
dist = [INF] * (n + 1)
pre = [0] * (n + 1)

for _ in range(m):
    u, v, w = map(int, sys.stdin.readline().split())
    edges[u].append((v, w))

a, b = map(int, sys.stdin.readline().split())

q = []
pre[a] = a
dist[a] = 0
heapq.heappush(q, (0, a))
while q:
    cost, now = heapq.heappop(q)
    if dist[now] < cost: continue

    for i in range(len(edges[now])):
        nx, nxCost = edges[now][i]
        if cost + nxCost <= dist[nx]:
            dist[nx] = cost + nxCost
            pre[nx] = now
            heapq.heappush(q, (cost + nxCost, nx))

ans = [b]
idx = b
while idx != a:
    ans.append(pre[idx])
    idx = pre[idx]

print(dist[b])
print(len(ans))
while ans:
    print(ans.pop(),end=' ')