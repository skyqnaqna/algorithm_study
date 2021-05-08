# 카카오 인턴십 2

import sys
from collections import deque
import copy
rd = sys.stdin.readline

d = [(0, -1), (0, 1), (-1, 0), (1, 0)]

def getDistance(r1, c1, r2, c2):
    return abs(r1 - r2) + abs(c1 - c2)


def checkDistancing(room):
    graph = [[0] * 5 for _ in range(5)]

    # 대기실 초기화
    for i in range(5):
        for j in range(5):
            if room[i][j] == "P":
                graph[i][j] = 1
            elif room[i][j] == "X":
                graph[i][j] = -1
    
    for i in range(5):
        for j in range(5):
            if graph[i][j] == 1:
                visited = [[False] * 5 for _ in range(5)]
                startRow, startCol = i, j

                visited[i][j] = True
                q = deque()
                q.append((i, j, 0))

                while q:
                    row, col, step = q.popleft()

                    for dx, dy in d:
                        nextRow, nextCol = row + dy, col + dx

                        if nextRow < 0 or nextCol < 0 or nextRow > 4 or nextCol > 4 or graph[nextRow][nextCol] == -1: continue

                        if not visited[nextRow][nextCol]:
                            visited[nextRow][nextCol] = True
                            q.append((nextRow, nextCol, step + 1))

                            if graph[nextRow][nextCol] == 1:
                                dist = getDistance(startRow, startCol, nextRow, nextCol)

                                # 파티션을 사이에 두는 경우를 고려해야하므로 step수를 확인
                                if dist <= 2 and step <= 1:
                                    return 0
    return 1


def solution(places):
    answer = []

    for i in range(5):
        answer.append(checkDistancing(places[i]))

    return answer


print(solution([["POOOP", "OXXOX", "OPXPX", "OOXOX", "POXXP"], ["POOPX", "OXPXP", "PXXXO", "OXXXO", "OOOPP"], ["PXOPX", "OXOXP", "OXPXX", "OXXXP", "POOXX"], ["OOOXX", "XOOOX", "OOOXX", "OXOOX", "OOOOO"], ["PXPXP", "XPXPX", "PXPXP", "XPXPX", "PXPXP"]]))