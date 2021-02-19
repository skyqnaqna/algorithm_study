def solution(s):
    answer = 0
    length = len(s)
    maxLen = length // 2 # 전체길이의 절반이 패턴의 최대길이

    while maxLen:
        start = 0 # 비교할 기준점
        tempLen = len(s)
        while start+maxLen <= len(s):
            target = s[start:start+maxLen] # 기준 패턴
            idx = start + maxLen
            cnt = 0
            while idx + maxLen <= len(s):
                next = s[idx:idx+maxLen] # 비교할 패턴
                if next == target:
                    cnt += 1
                    idx += maxLen
                else:
                    break
            if cnt:
                tempLen -= maxLen * cnt
                if 0 < cnt < 9:
                    tempLen += 1
                elif 9 <= cnt < 99:
                    tempLen += 2
                elif 99 <= cnt < 999:
                    tempLen += 3
                else:
                    tempLen += 4
            start = idx
        length = min(length, tempLen)
        maxLen -= 1

    answer = length

    return answer


