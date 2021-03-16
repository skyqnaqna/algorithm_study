# 백준 3098 소셜네트워크
# 21.03.16
import sys
from functools import cmp_to_key
from collections import deque
from itertools import combinations
from itertools import permutations
rd = sys.stdin.readline
INF = int(1e9)

n, m = map(int, input().split())
graph = [[INF] * (n + 1) for _ in range(n + 1)]
cnt = m
days = [0] * (n + 1)
day = 1
for _ in range(m):
    a, b = map(int, rd().split())
    graph[a][b] = graph[b][a] = 0

while cnt < n*(n-1)//2:
    for k in range(1, n + 1):
        for i in range(1, n + 1):
            for j in range(1, n + 1):
                if i == j or i == k or j == k: continue
                if graph[i][j] == INF and graph[i][k] < day and graph[k][j] < day:
                    graph[i][j] = graph[j][i] = day
                    cnt += 1
                    days[day] += 1
    day += 1

print(day - 1)
for i in range(1, day):
    print(days[i])