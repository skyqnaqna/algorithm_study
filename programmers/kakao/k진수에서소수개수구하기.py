# 프로그래머스 k진수에서 소수 개수 구하기
# 22.02.18
# https://github.com/skyqnaqna/algorithm_study

import sys, heapq
from collections import deque, defaultdict
rd = sys.stdin.readline
# sys.setrecursionlimit(50000)

def convert(n, base):
	res = ''
	while n > 0:
		res += str(n % base)
		n //= base
	
	return res[::-1]


def isPrime(n):
	if n < 2: return False

	for i in range(2, int(n ** 0.5) + 1):
		if n % i == 0:
			return False
	
	return True


def solution(n, k):
	answer = 0

	converted = convert(n, k)

	for num in converted.split('0'):
		if not num: continue
		if isPrime(int(num)):
			answer += 1

	return answer


# print(solution(437674, 3))
print(solution(110011, 10))