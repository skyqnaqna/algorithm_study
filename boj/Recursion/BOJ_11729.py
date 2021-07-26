# 백준 11729 하노이 탑 이동 순서
# 21.07.26

import sys
from collections import deque
rd = sys.stdin.readline

n = int(rd())

print((1<<n) - 1)

def hanoi(a, b, k):
    if k == 1:
        print(a, b)
        return
    else:
        hanoi(a, 6 - a - b, k - 1)
        print(a, b)
        hanoi(6 - a - b, b, k - 1)


hanoi(1, 3, n)