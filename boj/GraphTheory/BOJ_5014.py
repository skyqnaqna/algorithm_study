# 백준 5014 스타트링크
# 22.01.12
# https://github.com/skyqnaqna/algorithm_study

import sys, heapq
from collections import deque, defaultdict
rd = sys.stdin.readline
# sys.setrecursionlimit(50000)

F, S, G, U, D = map(int, rd().split())

dist = [-1] * (F + 1)

q = deque()
dist[S] = 0
q.append((S, 0))

while q:
	now, d = q.popleft()

	if now + U <= F and dist[now + U] == -1:
		dist[now + U] = d + 1
		q.append((now + U, d + 1))
	
	if now - D > 0 and dist[now - D] == -1:
		dist[now - D] = d + 1
		q.append((now - D, d + 1))

if dist[G] == -1: print("use the stairs")
else: print(dist[G])