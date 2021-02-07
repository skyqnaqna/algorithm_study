# 백준 1431 시리얼 번호
# 21.02.07

import sys
from functools import cmp_to_key


def compare(a, b):
    if len(a) == len(b):
        sumA = 0
        sumB = 0
        for i in range(len(a)):
            if '0' <= a[i] <= '9':
                sumA += ord(a[i]) - ord('0')
        for j in range(len(b)):
            if '0' <= b[j] <= '9':
                sumB += ord(b[j]) - ord('0')
        
        if sumA == sumB:
            if a > b: return 1
            else: return -1
        elif sumA > sumB: return 1
        else: return -1
    elif len(a) > len(b): return 1
    else: return -1


n = int(input())

s = []
for i in range(n):
    s.append(sys.stdin.readline().rstrip())

s.sort(key=cmp_to_key(compare))

for i in s:
    print(i)