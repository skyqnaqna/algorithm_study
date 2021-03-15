# 백준 2056 작업
# 21.03.15
import sys
from functools import cmp_to_key
from collections import deque
from itertools import combinations
from itertools import permutations
rd = sys.stdin.readline
INF = int(1e9)

n = int(input())
time = [0] * (n + 1)
ans = [0] * (n + 1)
indegree = [0] * (n +1)
edges = [[] for _ in range(n + 1)]

for i in range(1, n + 1):
    temp = list(map(int, rd().split()))
    time[i] = ans[i] = temp[0]
    if temp[1] > 0:
        for j in temp[2:]:
            edges[j].append(i)
            indegree[i] += 1

q = []
for i in range(1, n + 1):
    if indegree[i] == 0:
        q.append(i)

while q:
    now = q.pop()

    for i in edges[now]:
        indegree[i] -= 1
        if ans[now] + time[i] > ans[i]: ans[i] = ans[now] + time[i]
        if indegree[i] == 0: q.append(i)

print(max(ans))