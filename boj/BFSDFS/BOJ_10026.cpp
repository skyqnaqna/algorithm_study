/*----------------------
|백준 10026 적록색약(Cow Art)
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

int n;
char graph[100][100];
bool visit[100][100] = {false};
int dx[4] = {0, 0, -1, 1};
int dy[4] = {-1, 1, 0, 0};

void BFS(int r, int c)
{
    queue <pair <int, int> > q;
    q.push({r, c});
    visit[r][c] = true;
    char color = graph[r][c];
    bool isGreen = false;
    if (color == 'G') isGreen = true;

    while (!q.empty())
    {
        int r = q.front().first;
        int c = q.front().second;
        q.pop();

        if (isGreen) graph[r][c] = 'R';

        for (int i = 0; i < 4; ++i)
        {
            int nr = r + dy[i];
            int nc = c + dx[i];

            if (nr < 0 || nr >= n || nc < 0 || nc >= n)
                continue;
            if (graph[nr][nc] == color && !visit[nr][nc])
            {
                q.push({nr, nc});
                visit[nr][nc] = true;
            }
        }
    }
}

int main()
{
    ios_base::sync_with_stdio(false); cin.tie(NULL);
    cin >> n;

    for (int i = 0; i < n; ++i)
    {
        string s; cin >> s;
        for (int j = 0; j < n; ++j)
        {
            graph[i][j] = s[j];
        }
    }
    

    int human(0), cow(0);

    for (int i = 0; i < n; ++i)
    {
        for (int j = 0; j < n; ++j)
        {
            if (!visit[i][j])
            {
                BFS(i, j);
                ++human;
            }
        }
    }

    fill(&visit[0][0], &visit[99][100], false);
    for (int i = 0; i < n; ++i)
    {
        for (int j = 0; j < n; ++j)
        {
            if (!visit[i][j])
            {
                BFS(i, j);
                ++cow;
            }
        }
    }

    cout << human << " " << cow << "\n";

    return 0;
}