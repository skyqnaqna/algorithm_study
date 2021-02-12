# 백준 1789 수들의 합
# 21.02.12

import sys
from functools import cmp_to_key
from collections import deque
from itertools import combinations
from itertools import permutations
sys.setrecursionlimit(10**6)

s = int(input())
left = 1
right = s
mid = (left + right) // 2

while left < mid and mid < right:

    if mid ** 2 + mid > 2*s:
        right = mid
    else:
        left = mid
    mid = (left + right) // 2

print(mid)