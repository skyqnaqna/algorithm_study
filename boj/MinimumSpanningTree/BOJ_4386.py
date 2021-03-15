# 백준 4386 별자리 만들기
# 21.03.16
import sys
from functools import cmp_to_key
from collections import deque
from itertools import combinations
from itertools import permutations
rd = sys.stdin.readline
INF = int(1e9)

def getDist(a, b):
    return ((stars[a][0] - stars[b][0]) ** 2 + (stars[a][1] - stars[b][1]) ** 2) ** 0.5


def find(a):
    if parent[a] == a: return a
    else:
        parent[a] = find(parent[a])
        return parent[a]


def union(a, b):
    p = find(a)
    q = find(b)
    if p < q: parent[q] = p
    else: parent[p] = q


n = int(input())
stars = []
parent = [0] * n
for i in range(n):
    x, y = map(float, rd().split())
    stars.append((x, y))
    parent[i] = i

edges = []
for i in range(n):
    for j in range(i + 1, n):
        w = getDist(i, j)
        edges.append((w, i, j))

edges.sort(reverse=True)
ans = []
while edges:
    w, u, v = edges.pop()

    if find(u) != find(v):
        union(u, v)
        ans.append(w)

print('%.2f' % sum(ans))
