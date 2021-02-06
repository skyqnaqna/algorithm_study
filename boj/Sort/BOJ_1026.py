# 백준 1026 보물
# 21.02.07

import sys

n = int(input())

a = [int(x) for x in sys.stdin.readline().split()]
b = [int(x) for x in sys.stdin.readline().split()]

a.sort()
b.sort(reverse=True)

ans = 0
for i in range(n):
    ans += a[i] * b[i]

print(ans)