# 백준 2910 빈도 정렬(SORT)
# 21.02.06

import sys

n, c = map(int, sys.stdin.readline().split())

nums = []
temp = list(map(int, sys.stdin.readline().split()))
nums.append([temp[0]])
for i in range(1, n):
    isExist = False
    for j in range(len(nums)):
        if temp[i] == nums[j][0]:
            nums[j].append(temp[i])
            isExist = True
            break
    if not isExist:
        nums.append([temp[i]])

nums.sort(key=len, reverse=True)

for i in range(len(nums)):
    for j in range(len(nums[i])):
        print(nums[i][j], end=' ')