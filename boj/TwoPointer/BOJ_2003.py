# 백준 2003 수들의 합 2
# 21.02.13

import sys
from functools import cmp_to_key
from collections import deque
from itertools import combinations
from itertools import permutations
sys.setrecursionlimit(10**6)

n, m = map(int, sys.stdin.readline().split())
a = list(map(int, sys.stdin.readline().split()))
ans = 0

l = r = 0
temp = 0
while l < n:
    if r == n:
        temp -= a[l]
        l += 1
    elif temp < m:
        temp += a[r]
        r += 1
    elif temp >= m:
        temp -= a[l]
        l += 1
    
    if temp == m: ans += 1

print(ans)