# 백준 16236 아기 상어
# 21.04.10

import sys
import heapq
from functools import cmp_to_key
from collections import deque
from itertools import combinations
from itertools import permutations
# sys.setrecursionlimit(10**6)
rd = sys.stdin.readline
INF = int(1e9)

def bfs(sr, sc, size):
    fishes = []
    minDist = INF
    q = deque()
    q.append((sr, sc, 0))
    visited = [[False] * n for _ in range(n)]
    visited[sr][sc] = True

    while q:
        r, c, dist = q.popleft()
        if dist >= minDist: continue

        for i in range(4):
            nr, nc = r + dy[i], c + dx[i]
            
            if nr < 0 or nc < 0 or nr >= n or nc >= n or dist + 1 > minDist: continue

            # 갈 수 있는 경로인지 체크
            if not visited[nr][nc] and graph[nr][nc] <= size:
                q.append((nr, nc, dist + 1))
                visited[nr][nc] = True
                # 먹을 수 있는 먹이인지 체크
                if graph[nr][nc] != 0 and graph[nr][nc] < size and dist + 1 <= minDist:
                    minDist = dist + 1
                    fishes.append((minDist, nr, nc))
        
    return fishes


n = int(rd())
graph = []
dx = [0, -1, 0, 1]
dy = [-1, 0, 1, 0]

row, col = 0, 0 # 현재 상어의 위치
for i in range(n):
    graph.append(list(map(int, rd().split())))

    for j in range(n):
        if graph[i][j] == 9:
            row, col = i, j

size, cnt = 2, 0 # 상어의 현재 크기와 먹은 먹이 수
time = 0

while True:
    q = bfs(row, col, size)
    if not q: break

    # 거리순으로 정렬 후 거리가 같으면 가장 윗 행렬이 오도록 정렬, 같으면 왼쪽이 오도록 정렬
    q.sort(key=lambda x: (x[0], x[1], x[2]))
    dist, r, c = q[0][0], q[0][1], q[0][2]

    graph[r][c] = 0
    time += dist
    cnt += 1
    graph[r][c], graph[row][col] = graph[row][col], graph[r][c]
    row, col = r, c

    if cnt == size:
        size += 1
        cnt = 0
    
print(time)
