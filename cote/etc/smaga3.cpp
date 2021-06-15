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

int bfs ()
{

    int breakCount = 0;

    bool visited[2][102][102] = { false };

    queue <tuple<int, int, int, int> > q; // row, col, breakCount, researcher

    q.push({researcher[0].first, researcher[0].second, 0, 0});
    visited[0][researcher[0].first][researcher[0].second] = true;

    q.push({researcher[1].first, researcher[1].second, 0, 1});
    visited[1][researcher[1].first][researcher[1].second] = true;

    while (!q.empty())
    {
        int nowRow, nowCol, nowCost, person;
        tie(nowRow, nowCol, nowCost, person) = q.front();
        q.pop();

        if (nowRow < 1 || nowCol < 1 || nowRow > n || nowCol > m)
        {
            breakCount += nowCost;
            continue;
        } // 연구소 탈출

        for (int i = 0; i < 4; ++i)
        {
            int row = nowRow + dy[i];
            int col = nowCol + dx[i];

            if (row < 0 || col < 0 || row > n + 1 || col > m + 1 || graph[row][col] == -1 || visited[person][row][col]) { continue; }
            else if (graph[row][col] == 0)
            {
                q.push({row, col, nowCost, person});
                visited[person][row][col] = true;
            }
            else if (graph[row][col] == 1)
            {
                q.push({row, col, nowCost + 1, person});
                visited[person][row][col] = true;
                graph[row][col] = 0;

                printf("break: (%d, %d), cost: %d\n", row, col, nowCost + 1);
            }
        }
    }

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

    int result = bfs();
    printf("%d\n", result);

    return 0;
}