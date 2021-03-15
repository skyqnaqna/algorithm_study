# 백준 10423 전기가 부족해
# 21.03.15
import sys
from functools import cmp_to_key
from collections import deque
from itertools import combinations
from itertools import permutations
rd = sys.stdin.readline
INF = int(1e9)

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


n, m, k = map(int, input().split())
parent = [0] * (n + 1)
for i in range(1, n + 1): parent[i] = i
for p in list(map(int, rd().split())): parent[p] = 0

edges = []
for _ in range(m):
    u, v, w = map(int, rd().split())
    edges.append((w, u, v))

edges.sort(reverse=True)
ans = []

while len(ans) < n - k:
    w, u, v = edges.pop()

    if find(u) != find(v):
        union(u, v)
        ans.append(w)

print(sum(ans))