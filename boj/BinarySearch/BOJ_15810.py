# 백준 15810 풍선 공장
# 21.02.14

import sys
from functools import cmp_to_key
from collections import deque
from itertools import combinations
from itertools import permutations
sys.setrecursionlimit(10**6)

n, m = map(int, sys.stdin.readline().split())

times = list(map(int, sys.stdin.readline().split()))
ans = right = min(times) * m
left = 0
mid = (left + right) // 2

while left <= right:
    balloons = 0
    for i in times:
        balloons += mid // i
    
    if balloons >= m:
        right = mid - 1
        ans = min(ans, mid)
    else: left = mid + 1
    mid = (left + right) // 2

print(ans)