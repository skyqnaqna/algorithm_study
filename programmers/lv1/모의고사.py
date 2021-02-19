# 프로그래머스 모의고사
# 21.02.10

import sys
from functools import cmp_to_key
from collections import deque
sys.setrecursionlimit(10**6)


def solution(answers):
    answer = []
    a = [1, 2, 3, 4, 5]
    b = [2, 1, 2, 3, 2, 4, 2, 5]
    c = [3, 3, 1, 1, 2, 2, 4, 4, 5, 5]
    score = [0] * 3

    for i in range(len(answers)):
        if a[i%len(a)] == answers[i]: score[0] += 1
        if b[i%len(b)] == answers[i]: score[1] += 1
        if c[i%len(c)] == answers[i]: score[2] += 1
    
    maxScore = max(score)

    for i in range(3):
        if score[i] == maxScore: answer.append(i+1)
    
    return answer