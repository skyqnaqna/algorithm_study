# 백준 2156 포도주 시식
# 22.02.02
# https://github.com/skyqnaqna/algorithm_study

import sys, heapq
from collections import deque, defaultdict
rd = sys.stdin.readline
# sys.setrecursionlimit(50000)

n = int(rd())

dp = [0] * (n + 1)
wine = [0]
for _ in range(n):
	wine.append(int(rd()))

dp[1] = wine[1]
if n > 1:
	dp[2] = wine[1] + wine[2]
if n > 2:
	for i in range(3, n + 1):
		dp[i] = dp[i - 1]
		dp[i] = max(dp[i], dp[i - 2] + wine[i])
		dp[i] = max(dp[i], dp[i - 3] + wine[i - 1] + wine[i])

print(dp[n])