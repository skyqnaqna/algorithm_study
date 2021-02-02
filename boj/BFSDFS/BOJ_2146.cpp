/*----------------------
|백준 2146 다리 만들기
|21.01.28
----------------------*/

#include <iostream>
#include <algorithm>
#include <queue>
#include <vector>
#include <string>
#define INF 2147000000

using namespace std;

int n;
int dx[4] = {0, 0, -1, 1};
int dy[4] = {-1, 1, 0, 0};
int graph[100][100];
bool visit[100][100];
vector <pair <int, int> > land;
vector <pair <int ,int> > boundary;

void groupIsland(int y, int x, int &num)
{
    queue <pair <int, int> > q;
    q.push({y, x});
    visit[y][x] = true;

    while (!q.empty())
    {
        int r = q.front().first;
        int c = q.front().second;
        q.pop();
        graph[r][c] = num;

        bool isBoundary = false;

        for (int i = 0; i < 4; ++i)
        {
            int nr = r + dy[i];
            int nc = c + dx[i];

            // 항상 경계를 먼저 체크해주자
            if (nr < 0 || nr >= n || nc < 0 || nc >= n)
                continue;

            if (graph[nr][nc] == 1 && !visit[nr][nc])
            {
                graph[nr][nc] = num;
                q.push({nr, nc});
                visit[nr][nc] = true;
            }
            else if (graph[nr][nc] == 0) isBoundary = true;
        }

        if (isBoundary) boundary.push_back({r, c}); // 육지와 바다의 경계부분

    }
}

int getDistance(int y, int x)
{
    queue <pair <int, pair <int, int> > > q;
    int island = graph[y][x]; // 시작점이 어떤 섬인지 알고있어야함
    visit[y][x] = true;
    q.push({0, {y, x}});

    while(!q.empty())
    {
        int r = q.front().second.first;
        int c = q.front().second.second;
        int cost = q.front().first;
        q.pop();

        for (int i = 0; i < 4; ++i)
        {
            int nr = r + dy[i];
            int nc = c + dx[i];
            if (nr < 0 || nr >= n || nc < 0 || nc >= n)
                continue;
            if (graph[nr][nc] != island && graph[nr][nc] > 0)
            {
                return cost;
            }
            if (graph[nr][nc] == 0 && !visit[nr][nc])
            {
                q.push({cost + 1, {nr, nc}});
                visit[nr][nc] = true;
            }
        }
    }
    return INF;
}

int main()
{
    scanf("%d", &n);

    for (int i = 0; i < n; ++i)
    {
        for (int j = 0; j < n; ++j)
        {
            int m; scanf("%d", &m);
            if (m == 1)
            {
                land.push_back({i, j});
            }
            graph[i][j] = m;
        }
    }

    fill(&visit[0][0], &visit[99][100], false);

    int num = 1; // 섬의 번호
    for (int i = 0; i < land.size(); ++i)
    {
        int y = land[i].first;
        int x = land[i].second;
        if (!visit[y][x])
        {
            groupIsland(y, x, num);
            ++num;
        }
    }

    int ans = INF;
    for (int i = 0; i < boundary.size(); ++i)
    {
        fill(&visit[0][0], &visit[99][100], false);
        int y = boundary[i].first;
        int x = boundary[i].second;

        int dist = getDistance(y, x);
        ans = min(ans, dist);
    }

    printf("%d\n", ans);

    return 0;
}