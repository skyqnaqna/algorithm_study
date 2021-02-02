# 백준 1260 DFS와 BFS
# 21.01.20
from collections import deque


def DFS(v):
    if check[v]: return
    print(v, end=' ')
    check[v] = True

    for i in edges[v]:
        if not check[i]:
            DFS(i)
    return


def BFS(v):
    q = deque()
    q.append(v)
    while q:
        now = q.popleft()
        if check[now]: continue
        print(now, end=' ')
        check[now] = True
        for i in edges[now]:
            if check[i]: continue
            q.append(i)


n, m, start = map(int, input().split())

edges = [[] for _ in range(n + 1)]

for _ in range(m):
    u, v = map(int, input().split())
    edges[u].append(v)
    edges[v].append(u)

for i in range(1, n+1):
    edges[i].sort()

check = [False] * (n + 1)

DFS(start)
print()
for i in range(n+1):
    check[i] = False
BFS(start)
print()