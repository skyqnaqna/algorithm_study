# 프로그래머스 키패드 누르기
# 21.05.06

import sys
from collections import deque
rd = sys.stdin.readline

keypad = [[1,2,3],[4,5,6],[7,8,9],[10,0,11]]
d= [(0, -1), (0, 1), (-1, 0), (1, 0)]

def getDistance(startRow, startCol, target):
    visited = [False] * 12
    q = deque()

    visited[keypad[startRow][startCol]] = True
    q.append((startRow, startCol, 0))

    while q:
        row, col, dist = q.popleft()

        if keypad[row][col] == target:
            return (row, col, dist)
        
        for dx, dy in d:
            nextRow = row + dy
            nextCol = col + dx

            if nextRow < 0 or nextCol < 0 or nextRow > 3 or nextCol > 2: continue

            if not visited[keypad[nextRow][nextCol]]:
                visited[keypad[nextRow][nextCol]] = True
                q.append((nextRow, nextCol, dist + 1))
    # return (0,0,0)


def solution(numbers, hand):
    answer = ''
    left = {1, 4, 7}
    right = {3, 6, 9}
    leftRow, leftCol = 3, 0
    rightRow, rightCol = 3, 2

    for num in numbers:
        if num in left:
            answer += "L"
            leftRow = (num - 1) // 3
            leftCol = (num - 1) % 3
        elif num in right:
            answer += "R"
            rightRow = (num - 1) // 3
            rightCol = (num - 1) % 3
        else:
            lr, lc, ld = getDistance(leftRow, leftCol, num)
            rr, rc, rd = getDistance(rightRow, rightCol, num)

            if ld < rd or (ld == rd and hand == "left"):
                answer += "L"
                leftRow, leftCol = lr, lc
            elif ld > rd or (ld == rd and hand == "right"):
                answer += "R"
                rightRow, rightCol = rr, rc

    return answer


print(solution([1, 3, 4, 5, 8, 2, 1, 4, 5, 9, 5], "right"))
print(solution([7, 0, 8, 2, 8, 3, 1, 5, 7, 6, 2], "left"))