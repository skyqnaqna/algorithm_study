# 백준 2098 외판원 순회
# 22.01.26
# https://github.com/skyqnaqna/algorithm_study

import sys, heapq
from collections import deque, defaultdict
rd = sys.stdin.readline
# sys.setrecursionlimit(50000)

INF = int(2e9)

n = int(rd())
graph = [list(map(int, rd().split())) for _ in range(n)]
dp = [[-1] * (1 << n) for _ in range(n)]

def traveling(now, visited):
	if dp[now][visited] != -1:
		return dp[now][visited]
	if visited == (1 << n) - 1:
		if graph[now][0] == 0: return INF
		else: return graph[now][0]
	
	res = INF
	for next in range(n):
		if (visited & (1 << next)) != 0 or graph[now][next] == 0: continue

		res = min(res, graph[now][next] + traveling(next, visited | (1 << next)))
	
	dp[now][visited] = res
	return res


print(traveling(0, 1 << 0))