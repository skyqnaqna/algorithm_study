# 백준 16500 문자열 판별
# 21.02.22

import sys
from functools import cmp_to_key
from collections import deque
from itertools import combinations
from itertools import permutations
sys.setrecursionlimit(10**6)

s = sys.stdin.readline().rstrip()

n = int(sys.stdin.readline().rstrip())
words = []

for _ in range(n):
    words.append(sys.stdin.readline().rstrip())

d = [0] * (len(s) + 1)
d[-1] = 1

for i in range(len(s) - 1, -1, -1):
    for j in range(n):
        l = len(words[j])
        if words[j] == s[i:i+l] and d[i+l] == 1:
            d[i] = 1
            break

print(d[0])