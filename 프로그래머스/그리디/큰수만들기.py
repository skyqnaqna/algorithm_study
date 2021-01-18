# 큰 수 만들기

def solution(number, k):
    answer = ''
    candidates = []
    for i in range(len(number)):
        candidates.append((number[i], i))

    candidates.sort(key=lambda x: (x[0], -x[1]), reverse=True)
    length = len(number) - k
    maxPos = len(number) - 1
    ansList = []

    if len(number) == k:
        return answer
    while length > 0:
        for i in range(len(candidates)):
            nowPos = candidates[i][1]
            nowNum = (candidates[i][0])

            if maxPos - nowPos >= length - 1:
                if not ansList:
                    ansList.append((nowNum, nowPos))
                    length -= 1
                    candidates.pop(i)
                    answer += nowNum
                    break
                elif ansList[-1][1] < nowPos:
                    ansList.append((nowNum, nowPos))
                    length -= 1
                    candidates.pop(i)
                    answer += nowNum
                    break



    return answer

