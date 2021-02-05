# 백준 1931 회의실 배정
# 21.02.05

import sys

n = int(input())
times = []
for i in range(n):
    a, b = map(int, sys.stdin.readline().split())
    times.append((a, b))

times.sort(key=lambda x: (x[1], x[0]))

preEnd = times[0][1]
ans = 1
for i in range(1, n):
    nowStart = times[i][0]
    if nowStart < preEnd: continue
    else:
        preEnd = times[i][1]
        ans += 1

print(ans)
