# 카카오 인턴십 1

import sys
from collections import deque
import copy
rd = sys.stdin.readline

def solution(s):
    words = {"zero": "0",
             "one": "1",
             "two": "2",
             "three": "3",
             "four": "4",
             "five": "5",
             "six": "6",
             "seven": "7",
             "eight": "8",
             "nine": "9"}

    answer = ""
    tempStr = ""
    for char in s:
        if char > "9":
            tempStr += char
        else:
            answer += char
        
        if  tempStr in words:
            answer += words[tempStr]
            tempStr = ""
    
    return int(answer)


print(solution("one4seveneight"))
print(solution("23four5six7"))