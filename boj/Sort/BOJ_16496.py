# 백준 16496 큰 수 만들기
# 21.04.18

import sys
import heapq
from functools import cmp_to_key
from collections import deque
from itertools import combinations
from itertools import permutations
# sys.setrecursionlimit(10**6)
rd = sys.stdin.readline
INF = int(1e9)

def str_compare(a, b):
    if a+b > b+a: return 1
    elif a+b < b+a: return -1
    else: return 0


def solution(numbers):
    answer = ''
    strNum = [str(n) for n in numbers]
    strNum = sorted(strNum, key=cmp_to_key(str_compare), reverse=True)
    if strNum[0] == '0': answer = '0'
    else:
        for s in strNum:
            answer += s
    return answer


n = int(rd())

nums = list(map(int, rd().split()))

print(solution(nums))