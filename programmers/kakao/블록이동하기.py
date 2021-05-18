# 프로그래머스 블록 이동하기
# 21.05.18

import sys
from collections import deque
import copy

rd = sys.stdin.readline


def getNext(pos, graph):
    next = []
    pos = list(pos)
    preRow1, preCol1, preRow2, preCol2 = pos[0][0], pos[0][1], pos[1][0], pos[1][1]

    direction = [(0, -1), (0, 1), (-1, 0), (1, 0)]

    for dx, dy in direction:
        row1, col1, row2, col2 = preRow1 + dy, preCol1 + dx, preRow2 + dy, preCol2 + dx

        if graph[row1][col1] == 0 and graph[row2][col2] == 0:
            next.append({(row1, col1), (row2, col2)})

    # 가로
    if preRow1 == preRow2:
        for i in [-1, 1]:
            if graph[preRow1 + i][preCol1] == 0 and graph[preRow2 + i][preCol2] == 0:
                next.append({(preRow1, preCol1), (preRow1 + i, preCol1)})
                next.append({(preRow2, preCol2), (preRow2 + i, preCol2)})

    # 세로
    if preCol1 == preCol2:
        for i in [-1, 1]:
            if graph[preRow1][preCol1 + i] == 0 and graph[preRow2][preCol2 + i] == 0:
                next.append({(preRow1, preCol1), (preRow1, preCol1 + i)})
                next.append({(preRow2, preCol2), (preRow2, preCol2 + i)})

    return next


def solution(board):
    n = len(board)
    now = {(1, 1), (1, 2)}
    graph = [[1] * (n + 2) for _ in range(n + 2)]

    for i in range(n):
        for j in range(n):
            graph[i + 1][j + 1] = board[i][j]

    q = deque()
    visited = []
    q.append((now, 0))
    visited.append(now)

    while q:
        pre, dist = q.popleft()
        if (n, n) in pre:
            return dist

        nexts = getNext(pre, graph)

        for nextPos in nexts:
            if nextPos not in visited:
                q.append((nextPos, dist + 1))
                visited.append(nextPos)

    return 0