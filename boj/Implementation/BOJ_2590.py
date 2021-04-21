# 백준 2590 색종이
# 21.04.21

import sys
import heapq
from functools import cmp_to_key
from collections import deque
from itertools import combinations
from itertools import permutations
# sys.setrecursionlimit(10**6)
rd = sys.stdin.readline
INF = int(1e9)

papers = [0] * 7

for i in range(1, 7):
    papers[i] = int(rd())

ans = papers[6]

if papers[5] > 0:
    ans += papers[5]
    papers[1] -= papers[5] * 11

if papers[4] > 0:
    while papers[4] > 0:
        if papers[2] >= 5:
            papers[2] -= 5
        elif papers[2] > 0:
            temp = 20 - 4 * papers[2]
            papers[2] = 0
            papers[1] -= temp
        elif papers[1] > 0:
            papers[1] -= 20
        
        ans += 1
        papers[4] -= 1

if papers[3] > 0:
    ans += papers[3] // 4
    papers[3] = papers[3] % 4

    if papers[3] == 1:
        temp = 27
        if 0 < papers[2] < 5:
            temp -= papers[2] * 4
            papers[2] = 0
            papers[1] -= temp
        elif papers[2] >= 5:
            papers[2] -= 5
            papers[1] -= 7
        elif papers[1] > 0:
            papers[1] -= temp
        ans += 1
    elif papers[3] == 2:
        temp = 18
        if 0 < papers[2] < 3:
            temp -= papers[2] * 4
            papers[2] = 0
            papers[1] -= temp
        elif papers[2] >= 3:
            papers[2] -= 3
            papers[1] -= 6
        elif papers[1] > 0:
            papers[1] -= 18
        ans += 1
    elif papers[3] == 3:
        temp = 9
        if papers[2] > 0:
            papers[2] -= 1
            papers[1] -= 5
        elif papers[1] > 0:
            papers[1] -= 9
        ans += 1

if papers[2] > 0:
    ans += papers[2] // 9
    papers[2] = papers[2] % 9

    if papers[2] > 0:
        ans += 1
        temp = 36 - papers[2] * 4
        papers[1] -= temp

if papers[1] > 0:
    ans += papers[1] // 36
    papers[1] = papers[1] % 36

    if papers[1] > 0:
        ans += 1

print(ans)