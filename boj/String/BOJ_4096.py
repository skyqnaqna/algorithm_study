# 백준 4096 팰린드로미터
# 21.10.08

import sys
from collections import deque, defaultdict
rd = sys.stdin.readline

# sys.setrecursionlimit(50000)

answer = ''

while True:
    n = input()

    if n == '0': break
    if n == "".join(reversed(n)):
        answer += '0\n'
        continue

    num = int(n)
    while True:
        num += 1
        s = str(num)

        if len(s) != len(n):
            arr = ['0'] * (len(n) - len(s))
            temp = "".join(arr) + s
            if temp == "".join(reversed(temp)): break
        elif s == "".join(reversed(s)): break
    

    answer += str(num - int(n)) + '\n'


print(answer)