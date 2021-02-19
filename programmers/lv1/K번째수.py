# 프로그래머스 K번째수
# 21.02.01

def solution(array, commands):
    answer = []
    for i in commands:
        answer.append(list(sorted(array[i[0]-1:i[1]]))[i[2]-1])
    return answer