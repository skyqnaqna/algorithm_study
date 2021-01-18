# 백준 1157 단어공부
# 21.01.15

str = input().upper()

alpha = [0] * 26

for i in range(len(str)):
    alpha[ord(str[i]) - ord('A')] += 1

max = -1
ans = ''
for i in range(26):
    if alpha[i] > max:
        max = alpha[i]
        ans = chr(i + ord('A'))
    elif alpha[i] == max:
        ans = '?'

print(ans)