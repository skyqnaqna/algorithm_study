# 프로그래머스 타겟 넘버
# 21.01.19

def solution(numbers, target):
    answer = DFS(numbers, target, 0, 0)
    return answer


def DFS(numbers, target, idx, sum):
    if idx == len(numbers):
        if sum == target:
            return 1
        else:
            return 0
    else:
        return DFS(numbers, target, idx + 1, sum+numbers[idx]) + DFS(numbers, target, idx + 1, sum-numbers[idx])