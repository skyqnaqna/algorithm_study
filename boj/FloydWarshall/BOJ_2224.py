# 백준 2224 명제 증명
# 21.02.28

import sys
import heapq
from functools import cmp_to_key
from collections import deque
from itertools import combinations
from itertools import permutations
sys.setrecursionlimit(10**6)

def getIndex(c):
    return ord(c) - ord('A')


INF = int(1e9)

graph = [[False] * 58 for _ in range(58)]

n = int(input())

for _ in range(n):
    line = sys.stdin.readline().split()
    graph[getIndex(line[0])][getIndex(line[2])] = True

for k in range(58):
    for i in range(58):
        for j in range(58):
            if graph[i][k] and graph[k][j]: graph[i][j] = True

cnt = 0
for i in range(58):
    for j in range(58):
        if i == j: continue
        if graph[i][j]: cnt += 1

print(cnt)
for i in range(58):
    for j in range(58):
        if graph[i][j]:
            print(chr(i + ord('A')),"=>",chr(j + ord('A')))