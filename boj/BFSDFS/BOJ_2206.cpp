/*
 백준 2206 벽 부수고 이동하기
 21.08.19
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

int n, m, dist[2][1000][1000];
char graph[1000][1000];
int dy[] = {-1, 1, 0, 0};
int dx[] = {0, 0, -1, 1};

bool in(int r, int c) { return 0 <= r && r < n && 0 <= c && c < m; }

int bfs() {
    dist[0][0][0] = 1;
    queue<pair <pii, int> >q;
    q.push({{0, 0}, 0});

    while (!q.empty()) {
        int r = q.front().first.first;
        int c = q.front().first.second;
        int breakWall = q.front().second;
        q.pop();

        for (int i = 0; i < 4; ++i) {
            int nr = r + dy[i];
            int nc = c + dx[i];

            if (in(nr, nc)) {
                if (graph[nr][nc] == '1' && breakWall == 0 && dist[1][nr][nc] == 0) {
                    dist[1][nr][nc] = dist[0][r][c] + 1;
                    q.push({{nr, nc}, 1});
                } else if (graph[nr][nc] == '0' && dist[breakWall][nr][nc] == 0){
                    dist[breakWall][nr][nc] = dist[breakWall][r][c] + 1;
                    q.push({{nr, nc}, breakWall});
                }
            }
        }
    }

    if (dist[0][n-1][m-1] == 0 && dist[1][n-1][m-1] == 0) {
        return -1;
    } else if (dist[0][n-1][m-1] == 0) {
        return dist[1][n-1][m-1];
    } else if (dist[1][n-1][m-1] == 0) {
        return dist[0][n-1][m-1];
    } else {
        return min(dist[0][n-1][m-1], dist[1][n-1][m-1]);
    }
}

int main() {
    ios::sync_with_stdio(0); cin.tie(0);
    freopen("input.txt", "r", stdin);

    cin >> n >> m;

    for (int i = 0; i < n; ++i) {
        string s; cin >> s;
        for (int j = 0; j < m; ++j) {
            graph[i][j] = s[j];
        }
    }

    cout << bfs() << endl;

    return 0;
}