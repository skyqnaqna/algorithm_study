# 백준 2644 촌수계산
# 21.01.21
import sys
from collections import deque

n = int(sys.stdin.readline())
a, b = map(int, sys.stdin.readline().split())
m = int(input())
graph = [[] for _ in range(n+1)]
dist = [-1] * (n+1)

for _ in range(m):
    u, v = map(int, sys.stdin.readline().split())
    graph[u].append(v)
    graph[v].append(u)

bfs = deque()
bfs.append(a)
dist[a] = 0
while bfs:
    now = bfs.popleft()

    for i in graph[now]:
        if dist[i] == -1:
            bfs.append(i)
            dist[i] = dist[now] + 1

print(dist[b])