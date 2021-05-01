# 프로그래머스 외벽 점검
# 21.05.01

import sys
import heapq
from functools import cmp_to_key
from collections import deque
from itertools import combinations
from itertools import permutations
# sys.setrecursionlimit(10**6)
rd = sys.stdin.readline
INF = int(1e9)

def solution(n, weak, dist):
    answer = 0
    return answer