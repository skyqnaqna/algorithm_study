/*----------------------
|백준 1012 유기농 배추
|21.01.27
----------------------*/

#include <iostream>
#include <algorithm>
#include <queue>
#include <vector>

using namespace std;

int graph[50][50];
int dx[4] = {0, 0, -1, 1};
int dy[4] = {-1, 1, 0, 0};
int n, m, k;

void DFS(int r, int c)
{
    // 그래프 값이 0인 곳은 배추가 없는 곳이거나 방문했던 곳
    if (graph[r][c] == 0) return;

    graph[r][c] = 0;

    for (int i = 0; i < 4; ++i)
    {
        int nr = r + dy[i];
        int nc = c + dx[i];

        if (nr < 0 || nr >= n || nc < 0 || nc >= m) continue;
        if (graph[nr][nc]) DFS(nr, nc);
    }
    return;
}

int main()
{
    int t; scanf("%d", &t);
    vector <int> ans;

    while(t)
    {
        --t;
        fill(&graph[0][0], &graph[49][50], 0);
        scanf("%d %d %d", &m, &n, &k);
        vector <pair <int, int> > cabbages;

        for (int i = 0; i < k; ++i)
        {
            int x, y; scanf("%d %d", &x, &y);
            ++graph[y][x];
            cabbages.push_back({y, x});
        }

        int cnt = 0;
        for (int i = 0; i < cabbages.size(); ++i)
        {
            int r = cabbages[i].first;
            int c = cabbages[i].second;

            if (graph[r][c])
            {
                DFS(r, c);
                ++cnt;
            }
        }

        ans.push_back(cnt);
    }

    for (int i = 0; i < ans.size(); ++i)
        printf("%d\n", ans[i]);


    return 0;
}