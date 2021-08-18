/*
 백준 7562 나이트의 이동
 21.08.18
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

int dy[] = {-2, -2, -1, -1, 1, 1, 2, 2};
int dx[] = {-1, 1, -2, 2, -2, 2, -1, 1};
int t, n;
bool graph[300][300];

bool in(int r, int c) { return 0 <= r && r < n && 0 <= c && c < n; }

int bfs(int row, int col, int targetRow, int targetCol) {
    fill(&graph[0][0], &graph[299][300], false);
    graph[row][col] = true;
    queue<pair <pii, int> >q;
    q.push({{row, col}, 0});

    while (!q.empty()) {
        int r = q.front().first.first;
        int c = q.front().first.second;
        int dist = q.front().second;
        q.pop();

        if (r == targetRow && c == targetCol) {
            return dist;
        }

        for (int i = 0; i < 8; ++i) {
            int nr = r + dy[i];
            int nc = c + dx[i];

            if (in(nr, nc) && !graph[nr][nc]) {
                graph[nr][nc] = true;
                q.push({{nr, nc}, dist + 1});
            }
        }
    }
}

int main() {
    ios::sync_with_stdio(0); cin.tie(0);
    freopen("input.txt", "r", stdin);

    cin >> t;

    while (t-->0) {
        cin >> n;
        int r, c, tr, tc;
        cin >> r >> c >> tr >> tc;
        cout << bfs(r, c, tr, tc) << endl;
    }

    return 0;
}