/*
 스마게 연구원 탈출
 21.06.15
 https://github.com/skyqnaqna/algorithm_study
 */

#include <iostream>
#include <cstdio>
#include <algorithm>
#include <queue>
#include <vector>
#include <string>
#include <cmath>
#include <set>
#include <stack>

#define INF 1e9
#define endl "\n"

typedef long long ll;
typedef double dd;
typedef std::pair<int, int> pii;
typedef std::pair<ll, ll> pll;

using namespace std;

int n, m;
vector <vector <int> > graph (102, vector<int>(102, 0));
int dx[4] = {0, 1, 0, -1};
int dy[4] = {-1, 0, 1, 0};

vector <pii> researcher; // 연구원 위치

int bfs (pii start)
{
    int startRow = start.first;
    int startCol = start.second;
    int breakCount = 0;

    bool visited[102][102] = { false };
    queue <pii> blockList; // 차단로 위치 저장해두기

    queue <pii> q;
    q.push({startRow, startCol});
    visited[startRow][startCol] = true;

    while (!q.empty())
    {
        int nowRow = q.front().first;
        int nowCol = q.front().second;
        q.pop();

        if (nowRow < 1 || nowCol < 1 || nowRow > n || nowCol > m) { break; } // 연구소 탈출

        for (int i = 0; i < 4; ++i)
        {
            int row = nowRow + dy[i];
            int col = nowCol + dx[i];

            if (row < 0 || col < 0 || row > n + 1 || col > m + 1 || graph[row][col] == -1 || visited[row][col]) { continue; }
            else if (graph[row][col] == 0)
            {
                q.push({row, col});
                visited[row][col] = true;
            }
            else if (graph[row][col] == 1) // 차단로는 일단 차단로 목록에 저장
            {
                blockList.push({row, col});
            }
        }

        // 더 이상 갈 곳이 없으면 벽 하나 부수고 진행
        if (q.empty())
        {
            int nextRow = blockList.front().first;
            int nextCol = blockList.front().second;
            blockList.pop();

            q.push({nextRow, nextCol});
            visited[nextRow][nextCol] = true;

            breakCount++;
            graph[nextRow][nextCol] = 0;
//            printf("break: %d %d\n", nextRow, nextCol);
        }
    }

//    printf("%d\n", breakCount);
    return breakCount;
}


int main()
{
    scanf("%d %d", &n, &m);

    for (int i = 1; i <= n; ++i)
    {
        char str[101]; scanf("%s", str);

        for (int j = 1; j <= m; ++j)
        {
            if (str[j-1] == '#') { graph[i][j] = -1; }
            else if (str[j-1] == '@') { graph[i][j] = 1; }
            else if (str[j-1] == 'R')
            {
                researcher.push_back({i, j});
            }
        }
    }

    int result = bfs(researcher[0]) + bfs(researcher[1]);
    printf("%d\n", result);

    return 0;
}
