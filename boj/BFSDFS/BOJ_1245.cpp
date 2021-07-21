/*
 백준 1245 농장 관리
 21.07.21
 https://github.com/skyqnaqna/algorithm_study
 */

#include <bits/stdc++.h>

using namespace std;
using ll = long long;
using dd = double;
using pii = pair<int, int>;
using pll = pair<ll, ll>;

#define INF 1e9
#define endl "\n"

int n, m, graph[100][70];
int dy[] = {-1, 1, 0, 0, -1, 1, -1, 1};
int dx[] = {0, 0, -1, 1, -1, -1, 1, 1};
bool visited[100][70];

bool bfs(int row, int col) {
    visited[row][col] = true;
    bool valid = true;
    queue<pii>q;
    q.push({row, col});

    while (!q.empty()) {
        int r = q.front().first;
        int c = q.front().second;
        q.pop();

        int now = graph[r][c];

        for (int i = 0; i < 8; ++i) {
            int nr = r + dy[i];
            int nc = c + dx[i];

            if (nr < 0 || nc < 0 || nr >= n || nc >= m) continue;

            if (now < graph[nr][nc]) {
                valid = false;
            } else if (now == graph[nr][nc] && !visited[nr][nc]) {
                visited[nr][nc] = true;
                q.push({nr, nc});
            }
        }
    }

    return valid;
}

int main()
{
    ios::sync_with_stdio(0); cin.tie(0);
    freopen("input.txt", "r", stdin);

    cin >> n >> m;

    for (int i = 0; i < n; ++i) {
        for (int j = 0; j < m; ++j) {
            cin >> graph[i][j];
        }
    }

    int ans = 0;

    for (int i = 0; i < n; ++i) {
        for (int j = 0; j < m; ++j) {
            if (!visited[i][j] && bfs(i, j)) ++ans;
        }
    }

    cout << ans << endl;

    return 0;
}
