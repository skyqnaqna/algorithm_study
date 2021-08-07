/*
 백준 1261 알고스팟
 21.08.07
 https://github.com/skyqnaqna/algorithm_study
 */

#include <bits/stdc++.h>

using namespace std;
using ll = long long;
using dd = double;
using pii = pair<int, int>;
using pll = pair<ll, ll>;

#define INF 2e9
#define endl "\n"

int n, m, dist[100][100];
char graph[100][100];
int dy[] = {-1, 1, 0, 0};
int dx[] = {0, 0, -1, 1};

bool in(int r, int c) { return 0 <= r && r < n && 0 <= c && c < m; }

int solution() {
    queue<pii>q;
    dist[0][0] = 0;
    q.push({0, 0});

    while (!q.empty()) {
        int r = q.front().first;
        int c = q.front().second;
        q.pop();

        for (int i = 0; i < 4; ++i) {
            int nr = r + dy[i];
            int nc = c + dx[i];

            if (in(nr, nc)) {
                if (graph[nr][nc] == '0') {
                    if (dist[nr][nc] > dist[r][c]) {
                        dist[nr][nc] = dist[r][c];
                        q.push({nr, nc});
                    }
                } else {
                    if (dist[nr][nc] > dist[r][c] + 1) {
                        dist[nr][nc] = dist[r][c] + 1;
                        q.push({nr, nc});
                    }
                }
            }
        }
    }

    return dist[n-1][m-1];
}

int main() {
    ios::sync_with_stdio(0); cin.tie(0);
    freopen("input.txt", "r", stdin);

    cin >> m >> n;

    for (int i = 0; i < n; ++i) {
        string s; cin >> s;
        for (int j = 0; j < m; ++j) {
            graph[i][j] = s[j];
        }
    }

    fill(&dist[0][0], &dist[99][100], INF);

    cout << solution() << endl;

    return 0;
}
