# 백준 7569 토마토
# 21.01.22
import sys
from collections import deque
#sys.setrecursionlimit(10 ** 6)


m, n, h = map(int, sys.stdin.readline().split())

graph = [[[] for _ in range(n)] for _ in range(h)]

for i in range(h):
    for j in range(n):
        graph[i][j] = list(map(int, sys.stdin.readline().split()))

q = deque()
remain = 0
for i in range(h):
    for j in range(n):
        for k in range(m):
            if graph[i][j][k] == 1:
                q.append((i, j, k))
            elif graph[i][j][k] == 0:
                remain += 1

# 상, 하, 좌, 우, 윗상자, 아랫상자
dx = [0, 0, -1, 1, 0, 0]
dy = [-1, 1, 0, 0, 0, 0]
dz = [0, 0, 0, 0, 1, -1]
day = 0
while q:
    z, r, c = q.popleft()
    for i in range(6):
        nz = z + dz[i]
        nr = r + dy[i]
        nc = c + dx[i]

        if nr < 0 or nr >= n or nc < 0 or nc >= m or nz < 0 or nz >= h: continue
        if graph[nz][nr][nc] == 0:
            graph[nz][nr][nc] = graph[z][r][c] + 1
            remain -= 1
            q.append((nz, nr, nc))
            if graph[nz][nr][nc] > day:
                day = graph[nz][nr][nc] - 1

if remain != 0:
    print(-1)
else:
    print(day)