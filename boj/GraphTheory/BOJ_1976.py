# 백준 1976 여행 가자
# 22.01.12
# https://github.com/skyqnaqna/algorithm_study

import sys, heapq
from collections import deque, defaultdict
rd = sys.stdin.readline
# sys.setrecursionlimit(50000)

n = int(rd())
m = int(rd())

parent = [-1] * (n + 1)
for i in range(n + 1): parent[i] = i

graph = []

def findParent(a):
	if parent[a] != a:
		parent[a] = findParent(parent[a])
	return parent[a]


def unionParent(a, b):
	x = findParent(a)
	y = findParent(b)

	if x < y: parent[y] = x
	else: parent[x] = y


def solution():

	for i in range(n):
		graph.append(list(map(int, rd().split())))
		for j in range(n):
			if graph[i][j] == 0: continue
			if findParent(i) != findParent(j):
				unionParent(i, j)

	plan = [x - 1 for x in list(map(int, rd().split()))]

	start = findParent(plan[0])
	for i in range(1, m):
		if start != findParent(plan[i]):
			print("NO")
			return
	
	print("YES")
	return


if m < 2: print("YES")
else:
	solution()