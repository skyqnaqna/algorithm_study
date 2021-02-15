# 프로그래머스 카펫
# 21.02.15

import sys
from functools import cmp_to_key
from collections import deque
from itertools import combinations
from itertools import permutations
sys.setrecursionlimit(10**6)

def solution(brown, yellow):
    answer = []
    b = (brown + 4) // 2
    c = brown + yellow

    answer.append((b + ((b ** 2) - 4 * c) ** 0.5) // 2)
    answer.append((b - ((b ** 2) - 4 * c) ** 0.5) // 2)

    return answer