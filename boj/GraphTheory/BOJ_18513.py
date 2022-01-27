# 백준 18513 샘터
# 22.01.28
# https://github.com/skyqnaqna/algorithm_study

import sys, heapq
from collections import deque, defaultdict
rd = sys.stdin.readline
# sys.setrecursionlimit(50000)

q = deque()
visited = set()

n, k = map(int, rd().split())
water = list(map(int, rd().split()))

for x in water:
	q.append((x, 0))
	visited.add(x)

answer, cnt = 0, 0

while q:
	now, dist = q.popleft()

	if now + 1 not in visited:
		q.append((now + 1, dist + 1))
		answer += dist + 1
		cnt += 1
		visited.add(now +1)
	
	if cnt == k: break

	if now - 1 not in visited:
		q.append((now - 1, dist + 1))
		answer += dist + 1
		cnt += 1
		visited.add(now - 1)

	if cnt == k: break

print(answer)