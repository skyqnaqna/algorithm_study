# 백준 1012 유기농 배추
# 21.01.21
import sys
sys.setrecursionlimit(10000)


def DFS(r, c):
    global n, m
    graph[r][c] = 0
    for i in range(4):
        nextRow = r + dy[i]
        nextCol = c + dx[i]
        if nextRow < 0 or nextRow >= n or nextCol < 0 or nextCol >= m: continue
        if graph[nextRow][nextCol] == 1:
            DFS(nextRow, nextCol)
    return


t = int(input())
ans = []
dx = [0, 0, -1, 1]
dy = [-1, 1, 0, 0]

while t:
    t -= 1
    m, n, k = map(int, input().split())
    cabbages = []
    graph = [[0] * m for _ in range(n)]

    for _ in range(k):
        col, row = map(int, sys.stdin.readline().rstrip().split())
        graph[row][col] = 1
        cabbages.append((row, col))

    cnt = 0
    for i in cabbages:
        row, col = i
        if graph[row][col] == 1:
            DFS(row, col)
            cnt += 1

    ans.append(cnt)
    graph.clear()

for i in ans:
    print(i)