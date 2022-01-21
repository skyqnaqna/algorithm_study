# 백준 14503 로봇 청소기
# 22.01.21
# https://github.com/skyqnaqna/algorithm_study

import sys, heapq
from collections import deque, defaultdict
rd = sys.stdin.readline
# sys.setrecursionlimit(50000)

direction = [(-1, 0), (0, 1), (1, 0), (0, -1)]

n, m = map(int, rd().split())
row, col, dir = map(int, rd().split())
graph = [list(map(int, rd().split())) for _ in range(n)]
cleared = [[False] * m for _ in range(n)]
answer = 0

while 1:
	if not cleared[row][col]:
		cleared[row][col] = True
		answer += 1
	
	goBack = True

	for i in range(1, 5):
		left = (dir + 3 * i) % 4
		nr = row + direction[left][0]
		nc = col + direction[left][1]

		if graph[nr][nc] == 0 and not cleared[nr][nc]:
			row, col = nr, nc
			dir = left
			goBack = False
			break
	
	if goBack:
		nr = row + direction[(dir + 2) % 4][0]
		nc = col + direction[(dir + 2) % 4][1]

		if graph[nr][nc] == 0:
			row, col = nr, nc
		else:
			break

print(answer)