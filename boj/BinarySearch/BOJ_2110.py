# 백준 2110 공유기 설치
# 21.02.16

import sys
from functools import cmp_to_key
from collections import deque
from itertools import combinations
from itertools import permutations
sys.setrecursionlimit(10**6)

n, c = map(int, sys.stdin.readline().split())
house = []
for _ in range(n):
    house.append(int(input()))

house.sort()

left = 1
right = house[-1] - house[0]
mid = (left + right) // 2

while left <= right:
    temp = [house[0]]
    for i in range(1, n):
        if house[i] - temp[-1] >= mid:
            temp.append(house[i])
    
    if len(temp) >= c:
        left = mid + 1
    else:
        right = mid - 1
    
    mid = (left + right) // 2

print(mid)

