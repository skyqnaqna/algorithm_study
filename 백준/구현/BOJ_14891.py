# 백준 14891 톱니바퀴
# 21.01.16
import sys


def rightTurn(arr, r):
    temp = arr[r].pop()
    arr[r].insert(0, temp)


def leftTurn(arr, r):
    temp = arr[r][0]
    del arr[r][0]
    arr[r].append(temp)


wheels = [[] for _ in range(4)]

for i in range(4):
    wheels[i] = list(map(int, sys.stdin.readline().rstrip()))

cnt = int(input())
while cnt:
    row, turn = map(int, input().split())
    row -= 1
    check = [False] * 4
    check[row] = True
    for i in range(row, 3):
        if wheels[i][2] != wheels[i+1][6]:
            check[i+1] = True
        else:
            break
    for i in range(row, 0, -1):
        if wheels[i][6] != wheels[i-1][2]:
            check[i-1] = True
        else:
            break

    for i in range(4):
        if check[i]:
            if turn > 0:
                if (i + row) % 2 == 0:
                    rightTurn(wheels, i)
                else:
                    leftTurn(wheels, i)
            else:
                if (i + row) % 2 == 0:
                    leftTurn(wheels, i)
                else:
                    rightTurn(wheels, i)

    cnt -= 1

ans = 0
for i in range(4):
    if wheels[i][0] == 1:
        ans += 2 ** i

print(ans)

