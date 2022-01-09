# 백준 15988 1, 2, 3 더하기 3
# 22.01.10
# https://github.com/skyqnaqna/algorithm_study

import sys
from collections import deque, defaultdict
rd = sys.stdin.readline

sys.setrecursionlimit(50000)

t = int(rd())
MOD = 1_000_000_009

dp = [0] * 1_000_001
dp[1] = 1
dp[2] = 2
dp[3] = 4

for i in range(4, 1_000_001):
	dp[i] = (dp[i - 3] + dp[i - 2] + dp[i - 1]) % MOD

for _ in range(t):
	n = int(rd())
	print(dp[n])