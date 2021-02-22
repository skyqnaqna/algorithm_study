# 백준 1932 정수 삼각형
# 21.02.22

import sys
from functools import cmp_to_key
from collections import deque
from itertools import combinations
from itertools import permutations
sys.setrecursionlimit(10**6)

n = int(input())
d = [[int(sys.stdin.readline())]]
for i in range(1, n):
    d.append(list(map(int, sys.stdin.readline().split())))
    for j in range(len(d[i])):
        if j == 0: d[i][j] += d[i-1][0] # 맨 앞 원소는 바로 위 원소랑 더하기
        elif j == len(d[i]) - 1: d[i][j] += d[i-1][j -1] # 맨 뒤 원소는 바로 위 원소랑 더하기
        else:
            d[i][j] += max(d[i-1][j-1], d[i-1][j])

print(max(d[n-1]))