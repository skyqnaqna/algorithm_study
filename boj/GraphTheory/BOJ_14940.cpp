/*
 21.10.19
 백준 14940 쉬운 최단거리
 https://github.com/skyqnaqna/algorithm_study
 */

#include <bits/stdc++.h>

using namespace std;
using ll = long long;
using dd = double;
using pii = pair<int, int>;
using pll = pair<ll, ll>;

#define INF (int)2e9
#define endl "\n"
#define TXTOPEN freopen("input.txt", "r", stdin)

int n, m, s, e, graph[1000][1000];
vector <vector <int> > dist (1000, vector <int> (1000, -1));
int dy[] = {-1, 1, 0, 0};
int dx[] = {0, 0, -1, 1};

bool inBound(int r, int c) {
    return 0 <= r && r < n && 0 <= c && c < m;
}

int main() {
    ios::sync_with_stdio(0); cin.tie(0);

    cin >> n >> m;

    for (int i = 0; i < n; ++i) {
        for (int j = 0; j < m; ++j) {
            cin >> graph[i][j];
            if (graph[i][j] == 2) {
                s = i;
                e = j;
            } else if (graph[i][j] == 0) dist[i][j] = 0;
        }
    }

    dist[s][e] = 0;

    queue <pii> q;
    q.push({s, e});
    while (!q.empty()) {
        int r = q.front().first;
        int c = q.front().second;
        q.pop();

        for (int i = 0; i < 4; ++i) {
            int nr = r + dy[i];
            int nc = c + dx[i];

            if (inBound(nr, nc) && graph[nr][nc] > 0 && dist[nr][nc] == -1) {
                dist[nr][nc] = dist[r][c] + 1;
                q.push({nr, nc});
            }
        }
    }

    for (int i = 0; i < n; ++i) {
        for (int j = 0; j < m; ++j) {
            cout << dist[i][j] << " ";
        }
        cout << endl;
    }

    return 0;
}