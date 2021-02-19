import copy
def solution(n, lost, reserve):
    answer = n
    students = [1] * (n + 1)
    for i in lost:
        students[i] -= 1
    for i in reserve:
        students[i] += 1
    
    for i in lost:
        if students[i] == 0:
            if i - 1 > 0 and students[i - 1] > 1:
                students[i -  1] -= 1
            elif i + 1 <= n and students[i + 1] > 1:
                students[i + 1] -= 1
            else:
                answer -= 1
    
    return answer
