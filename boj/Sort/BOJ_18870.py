# 백준 18870 좌표 압축
# 22.02.05
# https://github.com/skyqnaqna/algorithm_study

import sys, heapq
from collections import deque, defaultdict
rd = sys.stdin.readline
# sys.setrecursionlimit(50000)

n = rd()
arr = list(map(int, rd().split()))
nSet = sorted(set(arr))
nDict = defaultdict()

for i, v in enumerate(nSet):
	nDict[v] = i

answer = ''
for v in arr:
	answer += str(nDict[v]) + ' '

print(answer)