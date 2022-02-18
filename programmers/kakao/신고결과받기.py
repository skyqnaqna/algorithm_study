# 프로그래머스 신고 결과 받기
# 22.02.18
# https://github.com/skyqnaqna/algorithm_study

import sys, heapq
from collections import deque, defaultdict
rd = sys.stdin.readline
# sys.setrecursionlimit(50000)

def solution(id_list, report, k):
	answer = [0] * len(id_list)
	reported = defaultdict(int)
	reporting = {name : [] for name in id_list}

	for info in set(report):
		_from, _to = map(str, info.split())
		reporting[_from].append(_to)
		reported[_to] += 1

	for i, (_, target) in enumerate(reporting.items()):
		for name in target:
			if reported[name] >= k:
				answer[i] += 1

	return answer


print(solution(["muzi", "frodo", "apeach", "neo"]	,["muzi frodo","apeach frodo","frodo neo","muzi neo","apeach muzi"]	,2))