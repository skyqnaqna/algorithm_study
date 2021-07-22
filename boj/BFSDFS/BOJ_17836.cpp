/*
 백준 17836 공주님을 구해라!
 21.07.22
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

int n, m, t, gr, gc, graph[100][100], dist[100][100];
bool visited[100][100];
int dy[] = {-1, 1, 0, 0};
int dx[] = {0, 0, -1, 1};

void bfs() {
    visited[0][0] = true;
    dist[0][0] = 0;
    queue<pair<int, pii> >q;
    q.push({0, {0, 0}});

    while (!q.empty()) {
        int d = q.front().first;
        int r = q.front().second.first;
        int c = q.front().second.second;
        q.pop();

        for (int i = 0; i < 4; ++i) {
            int nr = r + dy[i];
            int nc = c + dx[i];

            if (nr < 0 || nc < 0 || nr >= n || nc >= m) continue;

            if (!visited[nr][nc] && graph[nr][nc] != 1) {
                visited[nr][nc] = true;
                dist[nr][nc] = d + 1;
                q.push({d + 1, {nr, nc}});
            }
        }
    }
}

int main()
{
    ios::sync_with_stdio(0); cin.tie(0);
    freopen("input.txt", "r", stdin);

    cin >> n >> m >> t;

    int fromGram = 0;
    fill(&dist[0][0], &dist[99][100], INF);

    for (int i = 0; i < n; ++i) {
        for (int j = 0; j < m; ++j) {
            cin >> graph[i][j];

            if (graph[i][j] == 2) {
                fromGram = n - i + m - j - 2;
                gr = i, gc = j;
            }
        }
    }

    bfs();

    int res = min(dist[n-1][m-1], dist[gr][gc] + fromGram);

    if (res <= t && res > 0) cout << res << endl;
    else cout << "Fail\n";

    return 0;
}
