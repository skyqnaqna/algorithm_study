# 백준 2887 행성 터널
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

n = int(input())
parent = [0] * n
for i in range(n): parent[i] = i
edges = []
x = []
y = []
z = []
for i in range(n):
    a, b, c = map(int, rd().split())
    x.append((a, i))
    y.append((b, i))
    z.append((c, i))

x.sort(reverse=True)
y.sort(reverse=True)
z.sort(reverse=True)

for i in range(1, n):
    edges.append((abs(x[i][0] - x[i-1][0]), x[i-1][1], x[i][1]))
    edges.append((abs(y[i][0] - y[i-1][0]), y[i-1][1], y[i][1]))
    edges.append((abs(z[i][0] - z[i-1][0]), z[i-1][1], z[i][1]))

edges.sort(reverse=True)
cnt = 0
ans = 0
while cnt < n - 1:
    w, u, v = edges.pop()

    if find(u) != find(v):
        union(u, v)
        cnt += 1
        ans += w

print(ans)