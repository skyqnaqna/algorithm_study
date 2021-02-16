# 백준 1300 K번째 수
# 21.02.16

import sys
from functools import cmp_to_key
from collections import deque
from itertools import combinations
from itertools import permutations
sys.setrecursionlimit(10**6)

n = int(input())
k = int(input())

low = 1
ans = high = n ** 2
mid = (low + high) // 2

while low <= high:
    count = 0
    for i in range(1, n + 1):
        count += min(n, mid // i)
    
    if count >= k:
        high = mid - 1
        ans = min(ans, mid)
    elif count < k:
        low = mid + 1
    
    mid = (low + high) // 2

print(ans)