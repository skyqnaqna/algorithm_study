# 백준 1520 내리막 길
# 22.01.09
# https://github.com/skyqnaqna/algorithm_study

import sys
from collections import deque, defaultdict
rd = sys.stdin.readline

sys.setrecursionlimit(50000)

direction = [(-1, 0), (1, 0), (0, -1), (0, 1)]

n, m = map(int, rd().split())

graph = []
dp = [[-1] * m for _ in range(n)]

for _ in range(n):
	graph.append(list(map(int, rd().split())))

def inBound(r, c):
	return 0 <= r and r < n and 0 <= c and c < m


def dfs(r, c):
	if (r, c) == (n - 1, m - 1): return 1
	if dp[r][c] != -1: return dp[r][c]

	dp[r][c] = 0
	for dy, dx in direction:
		nr = r + dy
		nc = c + dx
		if not inBound(nr, nc): continue
		if graph[nr][nc] < graph[r][c]: dp[r][c] += dfs(nr, nc)
	
	return dp[r][c]


print(dfs(0, 0))