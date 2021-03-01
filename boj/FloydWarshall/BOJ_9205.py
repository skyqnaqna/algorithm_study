# 백준 9205 맥주 마시면서 걸어가기
# 21.03.01

import sys
import heapq
from functools import cmp_to_key
from collections import deque
from itertools import combinations
from itertools import permutations
# sys.setrecursionlimit(10**6)

def getDist(a, b):
    return abs(pos[a][0] - pos[b][0]) + abs(pos[a][1] - pos[b][1])


INF = int(1e9)

t = int(input())

while t:
    t -= 1
    n = int(input())
    graph = [[INF] * (n+2) for _ in range(n+2)]
    pos = []
    for _ in range(n+2):
        x, y = map(int, sys.stdin.readline().split())
        pos.append((x, y))

    for i in range(n+2):
        for j in range(n+2):
            if i == j: continue
            elif getDist(i, j) <= 1000:
                graph[i][j] = getDist(i, j)

    for k in range(n+2):
        for i in range(n+2):
            for j in range(n+2):
                if i == j or i == k or j == k: continue
                graph[i][j] = min(graph[i][j], graph[i][k] + graph[k][j])

    if graph[0][n+1] < INF: print("happy")
    else: print("sad")