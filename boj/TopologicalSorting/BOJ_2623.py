# 백준 2623 음악프로그램
# 21.03.16
import sys
from functools import cmp_to_key
from collections import deque
from itertools import combinations
from itertools import permutations
rd = sys.stdin.readline
INF = int(1e9)

n, m = map(int, input().split())
indegree = [0] * (n + 1)
edges = [[] for _ in range(n + 1)]
for _ in range(m):
    temp = list(map(int, rd().split()))
    for i in range(2, len(temp)):
        edges[temp[i-1]].append(temp[i])
        indegree[temp[i]] += 1

ans = []
q = []
for i in range(1, n + 1):
    if indegree[i] == 0:
        q.append(i)
        ans.append(i)

while q:
    now = q.pop(0)

    for i in edges[now]:
        indegree[i] -= 1
        if indegree[i] == 0:
            q.append(i)
            ans.append(i)

if len(ans) < n: print(0)
else:
    for i in ans: print(i)