# 백준 1422 숫자의 신
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


k, n = map(int, rd().split())
r = n - k
numbers = []
for _ in range(k):
    numbers.append(int(rd()))

answer = ''
repeat = str(max(numbers))
strNum = [str(n) for n in numbers]
strNum = sorted(strNum, key=cmp_to_key(str_compare), reverse=True)

if strNum[0] == '0':
    answer = '0'
else:
    for s in strNum:
        if r and s == repeat:
            answer += repeat * r
            r = 0
        answer += s

print(answer)