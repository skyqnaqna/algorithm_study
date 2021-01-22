# 백준 11123 Counting Sheep
# 21.01.22
import sys
sys.setrecursionlimit(10**6)


def DFS(r, c):
    if graph[r][c] == '.' or visit[r][c]: return
    visit[r][c] = True

    for i in range(4):
        nr = r + dy[i]
        nc = c + dx[i]

        if nr < 0 or nr >= n or nc < 0 or nc >= m: continue

        if graph[nr][nc] == '#' and not visit[nr][nc]:
            DFS(nr, nc)
    return


t = int(input())
dx = [0, 0, -1, 1]
dy = [-1, 1, 0, 0]
ans = []
while t:
    n, m = map(int, sys.stdin.readline().split())
    graph = [[] for _ in range(n)]
    visit = [[False] * m for _ in range(n)]

    for i in range(n):
        graph[i] = list(sys.stdin.readline().rstrip())

    cnt = 0
    for i in range(n):
        for j in range(m):
            if graph[i][j] == '#' and not visit[i][j]:
                DFS(i, j)
                cnt += 1

    ans.append(cnt)
    graph.clear()
    visit.clear()
    t -= 1

for i in ans:
    print(i)