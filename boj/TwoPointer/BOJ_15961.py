# 백준 15961 회전 초밥
# 22.02.07
# https://github.com/skyqnaqna/algorithm_study

import sys, heapq
from collections import deque, defaultdict
rd = sys.stdin.readline
# sys.setrecursionlimit(50000)

n, d, k, c = map(int, rd().split())
sushi = [int(rd()) for _ in range(n)]
used, cnt = [0] * (d + 1), 0

for i in range(k):
	if used[sushi[i]] == 0:
		cnt += 1
	used[sushi[i]] += 1

l, r = 0, k % n
answer = cnt + 1 if used[c] == 0 else cnt

while l < n:
	used[sushi[l]] -= 1
	if used[sushi[l]] == 0: cnt -= 1
	l += 1

	if used[sushi[r]] == 0: cnt += 1
	used[sushi[r]] += 1
	r = (r + 1) % n

	answer = max(answer, cnt)

	if used[c] == 0:
		answer = max(answer, cnt + 1)
	
print(answer)