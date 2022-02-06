# 백준 9024 두 수의 합
# 22.02.06
# https://github.com/skyqnaqna/algorithm_study

import sys, heapq
from collections import deque, defaultdict
rd = sys.stdin.readline
# sys.setrecursionlimit(50000)

t = int(rd())
answer = ''

for _ in range(t):
	n, k = map(int, rd().split())
	arr = sorted(list(map(int, rd().split())))
	
	val, cnt = int(2e9), 0
	l, r = 0, n - 1

	while l < r:
		sum = abs(arr[l] + arr[r] - k)

		if sum < val:
			val, cnt = sum, 1
		elif sum == val:
			cnt += 1
		
		if arr[l] + arr[r] - k < 0: l += 1
		else: r -= 1
	
	answer += str(cnt) + '\n'

print(answer)

