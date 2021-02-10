# 프로그래머스 소수 찾기
# 21.02.10

import sys
from functools import cmp_to_key
from collections import deque
from itertools import combinations
from itertools import permutations
sys.setrecursionlimit(10**6)

limit = 10000000

def solution(numbers):
    answer = 0

    isPrime = [True] * limit
    isPrime[0] = False
    isPrime[1] = False

    # 소수 구하기
    for i in range(2, int(limit ** 0.5) + 1):
        if isPrime[i]:
            for j in range(2, limit // i):
                isPrime[i * j] = False
    
    temp = set()
    for i in range(1, len(numbers) + 1):
        temp.update(list(map(int, (map(''.join, permutations(numbers, i))))))
    
    for i in temp:
        if isPrime[i]: answer += 1

    return answer


print(solution("011"))