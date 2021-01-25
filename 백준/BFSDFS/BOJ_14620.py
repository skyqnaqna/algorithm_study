# 백준 14620 꽃길
# 21.01.25
from itertools import combinations
import sys

n = int(input())
graph = [[] for _ in range(n)]
for i in range(n):
    graph[i] = list(map(int, sys.stdin.readline().split()))

# 꽃의 중심이 될 수 있는 칸의 개수
centerList = []
for i in range((n-2)**2):
    centerList.append(i)

dx = [0, 0, -1, 1]
dy = [-1, 1, 0, 0]
# centerList에서 3가지 뽑는 조합 구하기
combi = list(combinations(centerList, 3))
ans = []
while combi:
    candidates = list(combi.pop())
    visit = [[False] * n for _ in range(n)]
    cost = 0
    flag = True # 꽃 3개가 안겹치면 true
    for i in candidates:
        # 번호에 해당하는 행과 열 구하기
        r = i // (n-2) + 1
        c = i % (n-2) + 1
        if not visit[r][c]:
            visit[r][c] = True
            cost += graph[r][c]

            for i in range(4):
                nr = r + dy[i]
                nc = c + dx[i]
                if not visit[nr][nc]:
                    visit[nr][nc] = True
                    cost += graph[nr][nc]
                else:
                    flag = False
                    break
        else:
            flag = False
            break
    if flag:
        ans.append(cost)
    visit.clear()

print(min(ans))