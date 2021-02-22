# 백준 1463 1, 2, 3 더하기
# 21.02.22

import sys
from functools import cmp_to_key
from collections import deque
from itertools import combinations
from itertools import permutations
sys.setrecursionlimit(10**6)

t = int(input())

d = [0] * 11
d[1] = 1
d[2] = 2
d[3] = 4
for i in range(4, 11):
    d[i] = d[i - 1] + d[i - 2] + d[i - 3]

while t:
    t -= 1

    n = int(sys.stdin.readline().rstrip())
    print(d[n])

