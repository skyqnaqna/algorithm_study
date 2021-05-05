# 백준 11003 최솟값 찾기
# 21.05.05

import sys
from collections import deque
rd = sys.stdin.readline

def solution():
    _, l = map(int, rd().split())
    array = list(map(int, rd().split()))
    result = []
    q = deque()

    for index, value in enumerate(array):
        while q and q[-1][0] >= value:
            q.pop()
        if q and index - q[0][1] >= l:
            q.popleft()
        q.append((value, index))
        result.append(q[0][0])
    print(*result)


solution()