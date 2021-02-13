# 백준 13702 이상한 술집
# 21.02.14

import sys
from functools import cmp_to_key
from collections import deque
from itertools import combinations
from itertools import permutations
sys.setrecursionlimit(10**6)

n, k = map(int, sys.stdin.readline().split())
mak = []
for _ in range(n):
    mak.append(int(input()))
high = max(mak)
ans = low = 0
mid = (low + high) // 2

while low <= high:
    count = 0
    remain = 0

    for i in mak:
        count += i // mid
    
    if count >= k:
        ans = max(ans, mid)
        low = mid + 1
    elif count < k:
        high = mid - 1
    mid = (low + high) // 2

print(ans)