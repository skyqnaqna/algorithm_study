# 프로그래머스 H-Index
# 21.02.03


def solution(citations):
    answer = 0
    citations.sort(reverse=True)
    
    for i in range(len(citations)):
        if citations[i] >= i + 1: answer = max(answer, i + 1)
    
    if citations[0] == 0: return 0
    return answer