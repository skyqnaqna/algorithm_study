# 백준 5648 역원소 정렬
# 21.02.06

import sys

nums = list(map(int, sys.stdin.readline().split()))

while nums[0] + 1 > len(nums):
    nums += (map(int, sys.stdin.readline().split()))

ans = []
for i in range(1, len(nums)):
    ans.append(int(''.join(reversed(str(nums[i])))))

ans.sort()
for i in ans:
    print(i)