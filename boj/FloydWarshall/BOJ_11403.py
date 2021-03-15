# 백준 11430 경로 찾기
# 21.03.15
import sys
from functools import cmp_to_key
from collections import deque
from itertools import combinations
from itertools import permutations
rd = sys.stdin.readline
INF = int(1e9)

n = int(input())
graph = []
for _ in range(n):
    graph.append(list(map(int, rd().split())))

for k in range(n):
    for i in range(n):
        for j in range(n):
            if graph[i][k] and graph[k][j] : graph[i][j] = 1

for i in range(n):
    for j in range(n):
        print(graph[i][j], end=' ')
    print()