# 백준 17472 다리 만들기 2
# 21.03.16
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


n, m = map(int, input().split())
graph = []

for _ in range(n):
    graph.append(list(map(int, rd().split())))

dx = [0, 0, -1, 1]
dy = [-1, 1, 0, 0]

land = 1
visited = [[False] * m for _ in range(n)]

# 섬 번호 매기기
for i in range(n):
    for j in range(m):
        if graph[i][j] and not visited[i][j]:
            q = [(i, j)]
            graph[i][j] = land
            visited[i][j] = True
            while q:
                r, c = q.pop(0)
                visited[r][c] = True

                for a in range(4):
                    nr = r + dy[a]
                    nc = c + dx[a]

                    if nr < 0 or nr >= n or nc < 0 or nc >= m: continue
                    if graph[nr][nc] and not visited[nr][nc]:
                        q.append((nr, nc))
                        graph[nr][nc] = land
            land += 1

parent = [0] * land
for i in range(land): parent[i] = i

edges = []
for i in range(n):
    for j in range(m):
        # 가로 다리 구하기
        if j-1 >= 0 and graph[i][j] == 0 and graph[i][j-1]:
            pre = graph[i][j-1]
            nx = j + 1
            cost = 1
            while nx < m:
                if graph[i][nx] == 0: cost += 1
                else: break
                nx += 1
            if nx < m and graph[i][nx] and graph[i][nx] != pre and cost > 1:
                edges.append((cost, pre, graph[i][nx]))
        
        # 세로 다리 구하기
        if i-1 >= 0 and graph[i][j] == 0 and graph[i-1][j]:
            pre = graph[i-1][j]
            ny = i + 1
            cost = 1
            while ny < n:
                if graph[ny][j] == 0: cost += 1
                else: break
                ny += 1
            if ny < n and graph[ny][j] and graph[ny][j] != pre and cost > 1:
                edges.append((cost, pre, graph[ny][j]))

edges.sort(reverse=True)

q = []
# 섬 연결하기
while edges:
    w, u, v = edges.pop()

    if find(u) != find(v):
        union(u, v)
        q.append(w)

if len(q) < land - 2: print(-1)
else: print(sum(q))

