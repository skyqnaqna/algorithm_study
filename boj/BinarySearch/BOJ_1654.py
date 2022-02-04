# 백준 1654 랜선 자르기
# 22.02.04
# https://github.com/skyqnaqna/algorithm_study

import sys, heapq
from collections import deque, defaultdict
rd = sys.stdin.readline
# sys.setrecursionlimit(50000)

k, n = map(int, rd().split())

lanCable = [int(rd()) for _ in range(k)]

answer = 0
l, r = 1, max(lanCable)

while l <= r:
	m = (l + r) // 2

	cnt = 0
	for cable in lanCable:
		cnt += cable // m
	
	if n <= cnt:
		answer = max(answer, m)
		l = m + 1
	else:
		r = m - 1

print(answer)