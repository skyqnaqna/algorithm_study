# 백준 1072 게임
# 21.02.14

import sys
from functools import cmp_to_key
from collections import deque
from itertools import combinations
from itertools import permutations
sys.setrecursionlimit(10**6)

x, y = map(int, sys.stdin.readline().split())

z = y * 100 // x 

left = 0
right = 1000000000
mid = (left + right) // 2
ans = 2147000000

while left <= right:
    if z < (y + mid) * 100 // (x + mid):
        ans = min(ans, mid)
        right = mid - 1
    else:
        left = mid + 1
    
    mid = (left + right) // 2

if ans < 2147000000:
    print(ans)
else:
    print(-1)