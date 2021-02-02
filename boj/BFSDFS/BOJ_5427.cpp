/*----------------------
|백준 5427 Fire
|21.01.28
----------------------*/

#include <iostream>
#include <algorithm>
#include <queue>
#include <vector>
#include <string>

using namespace std;

int graph[1000][1000];
int runner[1000][1000];
int dx[4] = {0, 0, -1, 1};
int dy[4] = {-1, 1, 0, 0};
int n, m;

int BFS(int r, int c)
{
    queue <pair <int, int> > q;
    q.push({r, c});

    while (!q.empty())
    {
        int r = q.front().first;
        int c = q.front().second;

        q.pop();
        
        for (int i = 0; i < 4; ++i)
        {
            int nr = r + dy[i];
            int nc = c + dx[i];
            int ndist = runner[r][c] + 1;

            if (nr < 0 || nr >= n || nc < 0 || nc >= m)
            {
                return runner[r][c];
            }

            if (runner[nr][nc] == 0 && (ndist < graph[nr][nc] || graph[nr][nc] == 0))
            {
                runner[nr][nc] = ndist;
                q.push({nr, nc});
            }
        }
    }
    return -1;
}

int main()
{
    ios_base::sync_with_stdio(false); cin.tie(0);
    int t;
    cin >> t;

    vector <int> answer;

    while (t)
    {
        --t;
        cin >> m >> n;
        int sr, sc; // 러너 시작위치
        queue <pair <int ,int > > qfire;

        for (int i = 0; i < n; ++i)
        {
            string s; cin >> s;
            for (int j = 0; j < m; ++j)
            {
                char c;
                c = s[j];
                if (c == '#')
                {
                    graph[i][j] = -1;
                    runner[i][j] = -1;
                }
                else if (c == '*')
                {
                    graph[i][j] = 1;
                    runner[i][j] = -1;
                    qfire.push({i, j});
                }
                else if (c == '@')
                {
                    graph[i][j] = 0;
                    runner[i][j] = 1;
                    sr = i;
                    sc = j;
                }
                else
                {
                    graph[i][j] = 0;
                    runner[i][j] = 0;
                }
            }
        }

        // 불이 퍼지는 시간 먼저 구하기
        while (!qfire.empty())
        {
            int r = qfire.front().first;
            int c = qfire.front().second;
            qfire.pop();

            for (int i = 0; i < 4; ++i)
            {
                int nr = r + dy[i];
                int nc = c + dx[i];

                if (nr < 0 || nr >= n || nc < 0 || nc >= m) continue;

                if (graph[nr][nc] == 0)
                {
                    graph[nr][nc] = graph[r][c] + 1;
                    qfire.push({nr, nc});
                }
            }
        }

        answer.push_back(BFS(sr, sc));
    }

    for (int i = 0; i < answer.size(); ++i)
    {
        int a = answer[i];
        if (a != -1) cout << a << "\n";
        else cout << "IMPOSSIBLE\n";
    }

    return 0;
}