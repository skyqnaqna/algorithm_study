# 프로그래머스 수식 최대화
# 21.05.07

import sys
from collections import deque
from itertools import permutations
import copy
rd = sys.stdin.readline

def calculate(arr, priority):
    q1 = deque()
    q2 = deque()
    q1 = copy.deepcopy(arr)
    i = 0
    while i < 3:
        while q1:
            if q2 and q2[-1] == priority[i]:
                q2.pop()
                v1 = int(q2.pop())
                v2 = int(q1.popleft())
                if priority[i] == "*":
                    q2.append(str(v1 * v2))
                elif priority[i] == "+":
                    q2.append(str(v1 + v2))
                else:
                    q2.append(str(v1 - v2))
            else:
                q2.append(q1.popleft())
        q1 = copy.deepcopy(q2)
        q2.clear()
        i += 1
    
    return int(q1[0])



def solution(expression):
    answer = 0
    exp = deque()
    operand = ""
    for s in expression:
        if s == "*" or s == "+" or s == "-":
            exp.append(operand)
            operand = ""
            exp.append(s)
        else:
            operand += s
    exp.append(operand)

    priorities = list(permutations(["*", "+", "-"], 3))

    for p in priorities:
        temp = abs(calculate(exp, p))
        if temp > answer:
            answer = temp

    return answer


print(solution("100-200*300-500+20"))
print(solution("50*6-3*2"))