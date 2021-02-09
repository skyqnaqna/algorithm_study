# 백준 1517 버블 소트
# 21.02.09

import sys
from functools import cmp_to_key
from collections import deque
sys.setrecursionlimit(10**6)


def mergeSort(left, right):
    global ans

    if left < right:
        mid = (left + right) // 2

        mergeSort(left, mid)
        mergeSort(mid + 1, right)
        
        temp = []
        l, r = left, mid + 1
        while l <= mid and r <= right:
            if nums[l] > nums[r]:
                temp.append(nums[r])
                r += 1
                ans += mid - l + 1
            else:
                temp.append(nums[l])
                l += 1
        
        while l <= mid:
            temp.append(nums[l])
            l += 1
        while r <= right:
            temp.append(nums[r])
            r += 1
        
        for i in range(len(temp)):
            nums[i + left] = temp[i]


n = int(input())

nums = [int(x) for x in sys.stdin.readline().split()]

ans = 0
mergeSort(0, n - 1)

print(ans)
