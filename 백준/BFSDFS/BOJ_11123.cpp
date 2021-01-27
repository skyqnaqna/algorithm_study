/*----------------------
|백준 11123 Counting Sheep
|21.01.27
----------------------*/

#include <iostream>
#include <algorithm>
#include <queue>
#include <vector>
#include <string>

using namespace std;

int n, m;
int graph[101][101];
int dx[4] = {0, 0, -1, 1};
int dy[4] = {-1, 1, 0, 0};

void DFS(int r, int c)
{
    if (graph[r][c] == 0) return;

    graph[r][c] = 0;

    for (int i = 0; i < 4; ++i)
    {
        int nr = r + dy[i];
        int nc = c + dx[i];

        if (nr < 0 || nr >= n || nc < 0 || nc >= m) continue;

        if (graph[nr][nc] == 1) DFS(nr, nc);
    }
    return;
}

int main()
{
    ios_base::sync_with_stdio(false); cin.tie(0);
    int t; cin >> t;

    vector <int> ans;

    while (t)
    {
        --t;

        cin >> n >> m;
        fill(&graph[0][0], &graph[100][101], 0);
        queue <pair <int, int> > q; // 양이 있는 위치
        int cnt = 0;

        for (int i = 0; i < n; ++i)
        {
            string s; cin >> s;

            for (int j = 0; j < s.length(); ++j)
            {
                if (s[j] == '#')
                {
                    graph[i][j] = 1;
                    q.push({i, j});
                }
            }
        }

        while (!q.empty())
        {
            int r = q.front().first;
            int c = q.front().second;
            q.pop();

            if (graph[r][c])
            {
                DFS(r, c);
                ++cnt;
            }
        }

        ans.push_back(cnt);
    }

    for (int i = 0; i < ans.size(); ++i)
        cout << ans[i] << "\n";

    return 0;
}