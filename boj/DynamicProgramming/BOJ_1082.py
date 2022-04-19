# 백준 1082 방 번호
# 22.04.19
# https://github.com/skyqnaqna/algorithm_study

import sys, heapq
from collections import deque, defaultdict
rd = sys.stdin.readline
# sys.setrecursionlimit(50000)

n = int(rd())
p = list(map(int, rd().split()))
m = int(rd())

dp = [''] * (m + 1)

for i in range(1, m + 1):
    for j in range(n - 1, 0, -1):
        if i < p[j]: continue
        if len(dp[i]) < len(dp[i - p[j]]) + 1:
            dp[i] = str(j) + dp[i - p[j]]
    
    
    if len(dp[i]) == 0 and i >= p[0]:
        dp[i] = '0'
    elif i >= p[0] and len(dp[i]) < len(dp[i - p[0]]) + 1 and dp[i - p[0]] != '0':
        dp[i] = dp[i - p[0]] + '0'
    elif i >= p[0] and len(dp[i]) == len(dp[i - p[0]]) + 1 and dp[i - p[0]] != '0':
        dp[i] = max(dp[i], dp[i - p[0]] + '0')

print(dp[m])