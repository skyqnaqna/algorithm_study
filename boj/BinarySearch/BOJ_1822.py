# 백준 1822 차집합
# 21.02.12

import sys
from functools import cmp_to_key
from collections import deque
from itertools import combinations
from itertools import permutations
sys.setrecursionlimit(10**6)

n, m = map(int, sys.stdin.readline().split())

a = set((list(map(int, sys.stdin.readline().split()))))
b = set((list(map(int, sys.stdin.readline().split()))))

c = sorted(list(a.difference(b)))
if c:
    print(len(c))
    for i in c:
        print(i, end=' ')
else:
    print(0)