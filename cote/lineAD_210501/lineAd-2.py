# 라인AD 인턴 2번
# 21.05.04

import sys
import heapq
from functools import cmp_to_key
from collections import deque
from itertools import combinations
from itertools import permutations
# sys.setrecursionlimit(10**6)
rd = sys.stdin.readline
INF = int(1e9)


def solution(array):
    result = [-1] * len(array)
    stack = []

    for i in range(len(array)):
        while stack and array[stack[-1]] <= array[i]:
            if array[stack[-1]] == array[i]:
                if result[stack[-1]] > -1:
                    stack.pop()
                elif result[stack[-1]] == -1:
                    break
            elif array[stack[-1]] < array[i]:
                if result[stack[-1]] == -1 or stack[-1] - result[stack[-1]] > i - stack[-1]:
                    result[stack[-1]] = i
                stack.pop()
        if stack and array[stack[-1]] > array[i]:
            result[i] = stack[-1]
        stack.append(i)
    
    return result


print(solution([1,1,1,1,1]))
print(solution([1,1,4,1,1]))
print(solution([5,4,2,1,3]))
print(solution([3,5,4,1,2]))