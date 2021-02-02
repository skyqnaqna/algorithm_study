# 백준 1010 다리 놓기
# 21.01.17

t = int(input())
ans = []

combi = [[0] * 31 for _ in range(31)]
combi[1][0] = 1
combi[1][1] = 1
for i in range(2, 31):
    combi[i][0] = 1
    for j in range(1, 31):
        combi[i][j] = combi[i-1][j-1] + combi[i-1][j]

while t:
    n, m = map(int, input().split())
    ans.append(combi[m][n])

    t -= 1

for i in range(len(ans)):
    print(ans[i])