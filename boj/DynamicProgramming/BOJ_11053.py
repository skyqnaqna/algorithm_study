# 백준 11053 가장 긴 증가하는 부분 수열
# 21.02.22

import sys
from functools import cmp_to_key
from collections import deque
from itertools import combinations
from itertools import permutations
sys.setrecursionlimit(10**6)

def _lowerBound(start, end, arr, target):
    while start < end:
        mid = (start + end) // 2

        if arr[mid] < target:
            start = mid + 1
        else:
            end = mid

    return end


n = int(input())
a = list(map(int, sys.stdin.readline().split()))
lis = []
lis.append(a[0])
idx = 0

for i in range(1, n):
    if lis[idx] < a[i]:
        lis.append(a[i])
        idx += 1
    else:
        pos = _lowerBound(0, idx + 1, lis, a[i])
        lis[pos] = a[i]

print(idx + 1)