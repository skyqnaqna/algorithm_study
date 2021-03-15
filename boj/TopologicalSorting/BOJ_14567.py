# 백준 14567 선수과목
# 21.03.15
import sys
from functools import cmp_to_key
from collections import deque
from itertools import combinations
from itertools import permutations
rd = sys.stdin.readline
INF = int(1e9)

n, m = map(int, rd().split())
ans = [1] * (n + 1)
edges = [[] for _ in range(n + 1)]
indegree = [0] * (n + 1)

for _ in range(m):
    u, v = map(int, rd().split())
    edges[u].append(v)
    indegree[v] += 1

q = []
for i in range(1, n + 1):
    if indegree[i] == 0:
        q.append(i)

while q:
    now = q.pop()

    for i in edges[now]:
        indegree[i] -= 1
        ans[i] = max(ans[i], ans[now] + 1)
        if indegree[i] == 0:
            q.append(i)

for i in range(1, n + 1):
    print(ans[i], end=' ')