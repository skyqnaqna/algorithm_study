# 백준 14921 용액 합성하기
# 21.02.15

import sys
from functools import cmp_to_key
from collections import deque
from itertools import combinations
from itertools import permutations
sys.setrecursionlimit(10**6)

n = int(input())
a = list(map(int, sys.stdin.readline().split()))
left = 0
right = len(a) - 1
ans = 2147000000
while left < right:
    temp = a[left] + a[right]
    if abs(temp) < abs(ans): ans = temp

    if temp < 0:
        left += 1
    elif temp > 0:
        right -= 1
    else:
        break

print(ans)
