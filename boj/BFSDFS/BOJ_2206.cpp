/*----------------------
|백준 2206 벽 부수고 이동하기
|21.01.30
----------------------*/

#include <iostream>
#include <algorithm>
#include <queue>
#include <vector>
#include <string>
#include <cmath>
#define INF 2147000000

using namespace std;

int n, m;
int graph[1001][1001];
int dist1[1001][1001] = { 0 };
int dist2[1001][1001] = { 0 };
int dx[4] = {0, 0, -1, 1};
int dy[4] = {-1, 1, 0, 0};

int BFS(int r, int c)
{
    queue <pair <int, pair <int, int> > > q;
    q.push({0, {r, c}});
    dist1[r][c] = 1; // 벽을 안부수고 간 경우
    dist2[r][c] = 1;

    while (!q.empty())
    {
        int r = q.front().second.first;
        int c = q.front().second.second;
        int skill = q.front().first; // 벽을 부순 횟수
        q.pop();

        if (r == n - 1 && c == m - 1)
        {
            if (dist1[r][c] && dist2[r][c]) return min(dist1[r][c], dist2[r][c]);
            else if (dist1[r][c]) return dist1[r][c];
            else return dist2[r][c];
        }

        for (int i = 0; i < 4; ++i)
        {
            int nr = r + dy[i];
            int nc = c + dx[i];

            if (nr < 0 || nr >= n || nc < 0 || nc >= m) continue;

            if (skill == 0)
            {
                if (graph[nr][nc] == 0 && dist1[nr][nc] == 0)
                {
                    q.push({skill, {nr, nc}});
                    dist1[nr][nc] = dist1[r][c] + 1;
                }
                else if (graph[nr][nc] == 1 && dist1[nr][nc] == 0)
                {
                    q.push({skill + 1, {nr, nc}});
                    dist2[nr][nc] = dist1[r][c] + 1;
                }
            }
            else
            {
                if (graph[nr][nc] == 0 && dist2[nr][nc] == 0)
                {
                    q.push({skill, {nr, nc}});
                    dist2[nr][nc] = dist2[r][c] + 1;
                }
            }
        }
    }

    return -1;
}

int main()
{
    scanf("%d %d", &n, &m);
    for (int i = 0; i < n; ++i)
    {
        for (int j = 0; j < m; ++j)
        {
            scanf("%1d", &graph[i][j]);
        }
    }

    printf("%d\n", BFS(0,0));

    return 0;
}