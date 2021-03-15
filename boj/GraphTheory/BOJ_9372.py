# 백준 9372 상근이의 여행
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


t = int(input())

while t > 0:
    t -= 1
    n, m = map(int, rd().split())
    parent = [0] * (n + 1)
    edges = []
    for i in range(1, n + 1): parent[i] = i
    for _ in range(m):
        u, v = map(int, rd().split())
        edges.append((u, v))

    ans = 0
    while edges:
        u, v = edges.pop()

        if find(u) != find(v):
            union(u, v)
            ans += 1

    print(ans)
