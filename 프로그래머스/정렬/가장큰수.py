# 프로그래머스 가장 큰 수
# 21.02.01
from functools import cmp_to_key


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