# 백준 1018 체스판 다시 칠하기
# 21.01.17
import sys


def compare(row, col):
    global black, white, graph
    bCnt = 0
    wCnt = 0

    for i in range(8):
        for j in range(8):
            if black[i][j] != graph[row + i][col + j]:
                bCnt += 1
            if white[i][j] != graph[row + i][col + j]:
                wCnt += 1

    return min(bCnt, wCnt)


n, m = map(int, input().split())

graph = [[] for _ in range(n)]

for i in range(n):
    graph[i] = list((sys.stdin.readline().rstrip()))

b = list('BWBWBWBW')
w = list('WBWBWBWB')

black = [[] for _ in range(8)]
white = [[] for _ in range(8)]

for i in range(8):
    if i % 2 == 0:
        black[i] = b
        white[i] = w
    else:
        black[i] = w
        white[i] = b

ans = 65

ans = min(ans, compare(0,0))
for i in range(n - 7):
    for j in range(m - 7):
        ans = min(ans, compare(i, j))

print(ans)
