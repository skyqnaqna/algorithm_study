# 백준 1316 그룹 단어 체커
# 21.01.17

n = int(input())

ans = 0
while n:
    word = input()
    check = [-1] * 26
    flag = True

    for i in range(len(word)):
        temp = ord(word[i]) - ord('a')
        if check[temp] == -1:
            check[temp] = i
        elif i - check[temp] == 1:
            check[temp] = i
        else:
            flag = False
            break

    if flag:
        ans += 1
    n -= 1

print(ans)