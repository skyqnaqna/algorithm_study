# 백준 14002 가장 긴 증가하는 부분 수열 4
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
lis, idx = [a[0]], 0
record = [(idx, lis[idx])]

for i in range(1, n):
    if lis[idx] < a[i]:
        lis.append(a[i])
        idx += 1
        record.append((idx, lis[idx]))
    else:
        pos = _lowerBound(0, idx + 1, lis, a[i])
        lis[pos] = a[i]
        record.append((pos, lis[pos]))

print(idx + 1)

res = []
for i in range(len(record) - 1, -1, -1):
    if idx == record[i][0]:
        res.append(record[i][1])
        idx -= 1

while res:
    print(res.pop(), end=' ')