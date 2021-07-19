/*
 백준 4963 섬의 개수
 21.07.19
 https://github.com/skyqnaqna/algorithm_study
 */

#include <bits/stdc++.h>

using namespace std;

#define INF 1e9
#define endl "\n"

typedef long long ll;
typedef double dd;
typedef pair<int, int> pii;
typedef pair<ll, ll> pll;

int w, h, graph[50][50];
bool visited[50][50];
int dx[] = {0, 0, -1, 1, -1, -1, 1, 1};
int dy[] = {-1, 1, 0, 0, -1, 1, -1, 1};

void bfs(int row, int col) {
    visited[row][col] = true;
    queue<pii>q;
    q.push({row, col});

    while (!q.empty()) {
        int r = q.front().first;
        int c = q.front().second;
        q.pop();

        for (int i = 0; i < 8; ++i) {
            int nr = r + dy[i];
            int nc = c + dx[i];

            if (nr < 0 || nc < 0 || nr >= h || nc >= w) continue;

            if (!visited[nr][nc] && graph[nr][nc]) {
                visited[nr][nc] = true;
                q.push({nr, nc});
            }
        }
    }
}

int main()
{
    ios::sync_with_stdio(0); cin.tie(0);
//    freopen("input.txt", "r", stdin);

    cin >> w >> h;

    while (w != 0 && h != 0) {
        int ans = 0;
        vector <pii> islands;
        fill(&graph[0][0], &graph[49][50], 0);
        fill(&visited[0][0], &visited[49][50], false);

        for (int i = 0; i < h; ++i) {
            for (int j = 0; j < w; ++j) {
                cin >> graph[i][j];
                if (graph[i][j]) islands.push_back({i, j});
            }
        }

        for (auto &i : islands) {
            int r = i.first, c = i.second;

            if (!visited[r][c]) {
                bfs(r, c);
                ++ans;
            }
        }

        cout << ans << endl;

        cin >> w >> h;
    }

    return 0;
}























