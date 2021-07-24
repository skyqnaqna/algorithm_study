# 백준 15651 N과 M (3)
# 21.07.24

import sys
from collections import deque
rd = sys.stdin.readline

n, m = map(int, rd().split())
permutation = []

def backtracking(cnt):
    if cnt == m:
        print(' '.join(map(str, permutation)))
    else:
        for i in range(1, n + 1):
            permutation.append(i)
            backtracking(cnt + 1)
            permutation.pop()


backtracking(0)
