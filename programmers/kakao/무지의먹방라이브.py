# 프로그래머스 무지의 먹방 라이브
# 21.04.27

import sys
import heapq
from functools import cmp_to_key
from collections import deque
from itertools import combinations
from itertools import permutations
# sys.setrecursionlimit(10**6)
rd = sys.stdin.readline
INF = int(1e9)

def solution(food_times, k):
    n = len(food_times)
    total = sum(food_times)

    if total <= k:
        return -1
    else:
        time = k
        q = []
        for i in range(n):
            heapq.heappush(q, (food_times[i], i + 1))
        
        pre = 0
        while True:
            now = q[0]
            if time - (now[0] - pre) * n > 0:
                time -= (now[0] - pre) * n
                pre = now[0]
                n -= 1
                heapq.heappop(q)
            else:
                break
        
        q.sort(key=lambda x: (x[1]))
        print(q)

        return q[time % len(q)][1]


print(solution([3, 1, 2], 5))