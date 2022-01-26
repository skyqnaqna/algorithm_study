# 백준 9252 LCS 2
# 22.01.26
# https://github.com/skyqnaqna/algorithm_study

import sys, heapq
from collections import deque, defaultdict
rd = sys.stdin.readline
# sys.setrecursionlimit(50000)

A = rd().strip()
B = rd().strip()

lcs = [[0] * (len(A) + 1) for _ in range(len(B) + 1)]

for i in range(1, len(B) + 1):
	for j in range(1, len(A) + 1):
		if B[i - 1] != A[j - 1]:
			lcs[i][j] = max(lcs[i - 1][j], lcs[i][j - 1])
		else:
			lcs[i][j] = lcs[i - 1][j - 1] + 1


if lcs[len(B)][len(A)] == 0:
	print(0)
else:
	print(lcs[len(B)][len(A)])

	res = ''
	i, j = len(B), len(A)
	while lcs[i][j] > 0:
		if lcs[i - 1][j] == lcs[i][j]:
			i -= 1
		elif lcs[i][j - 1] == lcs[i][j]:
			j -= 1
		else:
			res += A[j - 1]
			i -= 1
			j -= 1
	
	print(res[::-1])

