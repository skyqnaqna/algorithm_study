# 백준 2075 N번째 큰수
# 21.04.22

import sys
import heapq
from functools import cmp_to_key
from collections import deque
from itertools import combinations
from itertools import permutations
# sys.setrecursionlimit(10**6)
rd = sys.stdin.readline
INF = int(1e9)

n = int(rd())

pq = []

for _ in range(n):
    temp = list(map(int, rd().split()))

    # 실행속도를 위해 len(pq) -> if not pq로 고침
    # N 번째 수를 구하는거니까 처음에 N개로 초기화하면 됨
    if not pq:
        for i in temp:
            heapq.heappush(pq, i)
    else:
        for i in temp:
            if i > pq[0]:
                heapq.heappop(pq)
                heapq.heappush(pq, i)

print(pq[0])
