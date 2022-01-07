# 백준 16235 나무 재테크
# 22.01.08
# https://github.com/skyqnaqna/algorithm_study

import sys
from collections import deque, defaultdict
rd = sys.stdin.readline

# sys.setrecursionlimit(50000)

direction = [(-1, 0), (1, 0), (0, -1), (0, 1), (-1, -1), (-1, 1), (1, -1), (1, 1)]
n, m, k = map(int, rd().split())
graph = [[5] * n for _ in range(n)]
A = []

def inBound(r, c):
	return 0 <= r and r < n and 0 <= c and c < n

for _ in range(n):
	A.append(list(map(int, rd().split())))

trees = [[defaultdict(int) for _ in range(n)] for _ in range(n)]
for _ in range(m):
	x, y, z = map(int, rd().split())
	trees[x - 1][y - 1][z] += 1


# for i in range(n):
# 	for j in range(n):
# 		print(trees[i][j], end='')
# 	print()

for _ in range(k):
	deadTrees = []
	breedingTrees = []

	# Spring
	for i in range(n):
		for j in range(n):
			if trees[i][j]:
				agingTrees = defaultdict(int)

				for age in sorted(trees[i][j].keys()):
					cnt = trees[i][j][age]

					if age * cnt <= graph[i][j]:
						graph[i][j] -= age * cnt
						agingTrees[age + 1] = cnt

						if (age + 1) % 5 == 0:
							breedingTrees.append((cnt, i, j))
					elif age <= graph[i][j]:
						agingCnt = graph[i][j] // age
						graph[i][j] -= age * agingCnt
						agingTrees[age + 1] = agingCnt

						if (age + 1) % 5 == 0:
							breedingTrees.append((agingCnt, i, j))

						deadTrees.append(((age // 2) * (cnt - agingCnt), i, j))
					else:
						deadTrees.append(((age // 2) * cnt, i, j))
					
				trees[i][j] = agingTrees

	# Summer
	for (nutrient, r, c) in deadTrees:
		graph[r][c] += nutrient

	# Fall
	for (cnt, r, c) in breedingTrees:
		for (dy, dx) in direction:
			nr = r + dy
			nc = c + dx
			if not inBound(nr, nc): continue
			trees[nr][nc][1] += cnt

	# Winter
	answer = 0
	for i in range(n):
		for j in range(n):
			graph[i][j] += A[i][j]
			answer += len(trees[i][j])


answer = 0
for i in range(n):
	for j in range(n):
		if trees[i][j]:
			for cnt in trees[i][j].values():
				answer += cnt

print(answer)