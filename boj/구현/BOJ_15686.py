# 백준 15686 치킨 배달
# 21.01.19
import sys


def getChickenDist(cnt, idx):
    global m, ans
    if cnt == m:
        tempAllDist = 0
        for i in home:
            r1, c1 = i
            tempDist = int(1e9)
            for j in range(len(check)):
                if check[j]:
                    r2, c2 = chicken[j]
                    tempDist = min(tempDist, abs(r1 - r2) + abs(c1 - c2))
            tempAllDist += tempDist
        ans = min(ans, tempAllDist)
        return
    else:
        for k in range(idx, len(chicken)):
            if not check[k]:
                check[k] = True
                getChickenDist(cnt+1, k+1)
                check[k] = False
        return


n, m = map(int, input().split())

graph = [[] for _ in range(n)]

for i in range(n):
    graph[i] = list(map(int, sys.stdin.readline().rstrip().split()))

home = []
chicken = []
ans = 2147483647

for i in range(n):
    for j in range(n):
        if graph[i][j] == 1:
            home.append((i, j))
        elif graph[i][j] == 2:
            chicken.append((i, j))

check = [False] * (len(chicken))

getChickenDist(0, 0)
print(ans)
