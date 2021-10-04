# 백준 2900 프로그램
# 21.10.04

import sys
from collections import deque, defaultdict
rd = sys.stdin.readline

# sys.setrecursionlimit(50000)

# 입력.
n, k = map(int, rd().split())
cnt = defaultdict(int)
x = list(map(int, rd().split()))

for i in x:
    cnt[i] += 1

arr = [0] * n
prefixSum = [0] * (n + 1)

for key, val in cnt.items():
    idx = 0

    while key * idx < n:
        arr[key * idx] += val
        idx += 1

prefixSum[1] = arr[0]

for i in range(2, n + 1):
    prefixSum[i] = prefixSum[i - 1] + arr[i - 1]

q = int(rd())
ans = ''

while q > 0:
    q -= 1

    l, r = map(int, rd().split())
    ans += str(prefixSum[r + 1] - prefixSum[l]) + '\n'

print(ans)