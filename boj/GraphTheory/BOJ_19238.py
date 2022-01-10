# 백준 19238 스타트 택시
# 22.01.10
# https://github.com/skyqnaqna/algorithm_study

import sys, heapq
from collections import deque, defaultdict
rd = sys.stdin.readline
# sys.setrecursionlimit(50000)

direction = [(-1, 0), (1, 0), (0, -1), (0, 1)]

n, m, fuel = map(int, rd().split())

graph = []
for _ in range(n):
	graph.append(list(map(int, rd().split())))

taxi = [x - 1 for x in list(map(int, rd().split()))]
passenger = [[(0, 0)] * n for _ in range(n)]
for _ in range(m):
	i = [x - 1 for x in list(map(int, rd().split()))]
	passenger[i[0]][i[1]] = (i[2], i[3])
	graph[i[0]][i[1]] = 2

def inBound(r, c):
	return 0 <= r and r < n and 0 <= c and c < n and graph[r][c] != 1

def getDist(sr, sc, dr, dc):
	visited = [[False] * n for _ in range(n)]
	q = deque([(sr, sc, 0)])
	visited[sr][sc] = True

	while q:
		(r, c, d) = q.popleft()

		if r == dr and c == dc:
			return d
		
		for dy, dx in direction:
			nr = r + dy
			nc = c + dx

			if not inBound(nr, nc): continue
			if not visited[nr][nc]:
				visited[nr][nc] = True
				q.append((nr, nc, d + 1))
	return -1


def solution():
	global fuel, taxi
	visited = [[False] * n for _ in range(n)]
	pq = []
	q = deque([(taxi[0], taxi[1], 0)])
	visited[taxi[0]][taxi[1]] = True

	while q:
		(r, c, d) = q.popleft()

		if graph[r][c] == 2:
			heapq.heappush(pq, (d, r, c))

		for dy, dx in direction:
			nr = r + dy
			nc = c + dx

			if not inBound(nr, nc): continue
			if not visited[nr][nc]:
				visited[nr][nc] = True
				q.append((nr, nc, d + 1))
				
	if not pq: return False

	(findDist, sr, sc) = heapq.heappop(pq)
	dr = passenger[sr][sc][0]
	dc = passenger[sr][sc][1]
	graph[sr][sc] = 0

	destDist = getDist(sr, sc, dr, dc)

	if destDist == -1: return False
	if findDist + destDist <= fuel:
		fuel -= findDist
		fuel += destDist
		taxi = [dr, dc]
		return True
	else:
		return False


res = 0
for _ in range(m):
	if solution(): res += 1
	else: break

if res == m: print(fuel)
else: print(-1)