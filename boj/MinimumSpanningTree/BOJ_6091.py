# 백준 6091 핑크 플로이드
# 21.03.03

import sys
import heapq
from functools import cmp_to_key
from collections import deque
from itertools import combinations
from itertools import permutations
# sys.setrecursionlimit(10**6)
rd = sys.stdin.readline

def find(a):
    if parent[a] == a: return a
    else:
        parent[a] = find(parent[a])
        return parent[a]


def union(a, b):
    x = find(a)
    y = find(b)

    if x < y: parent[y] = x
    else: parent[x] = y


n = int(input())

edges = []
parent = [0] * (n + 1)

for i in range(1, n):
    arr = list(map(int, rd().split()))
    for j in range(len(arr)):
        edges.append((arr[j], i, i + j + 1))
    parent[i] = i
parent[n] = n

# 거리를 기준으로 내림차순
edges.sort(reverse=True)

q = []
while len(q) < n - 1:
    w, u, v = edges.pop()

    if find(u) != find(v):
        union(u, v)
        q.append((u, v))

ans = [[] for _ in range(n + 1)]
while q:
    u, v = q.pop()
    ans[u].append(v)
    ans[v].append(u)

for i in range(1, n + 1):
    print(len(ans[i]), end=" ")
    ans[i].sort()
    for j in ans[i]:
        print(j, end=" ")
    print()