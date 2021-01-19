# 백준 1439 뒤집기
# 21.01.20

s = input()

zero = []
one = []
cnt0 = 0
cnt1 = 0

for i in range(len(s)):
    if s[i] == '0':
        if one:
            cnt1 += 1
            one.clear()
        zero.append(s[i])
    else:
        if zero:
            cnt0 += 1
            zero.clear()
        one.append(s[i])

if one:
    cnt1 += 1
if zero:
    cnt0 += 1

print(min(cnt0, cnt1))