/*
 백준 9944 NxM 보드 완주하기
 21.08.01
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

int n, m, ans, t = 1;
int dy[] = { -1, 1, 0, 0 };
int dx[] = { 0, 0, -1, 1 };
char graph[30][30];
bool isMove, visited[30][30];

bool in(int r, int c) { return 0 <= r && r < n && 0 <= c && c < m && graph[r][c] == '.' && !visited[r][c]; }
bool check() {
    for (int i = 0; i < n; ++i) {
        for (int j = 0; j < m; ++j) {
            if (!visited[i][j]) return false;
        }
    }
    return true;
}

void backtracking(int r, int c, int d, int cnt) {
    if (cnt >= ans) return;

    int nr = r + dy[d];
    int nc = c + dx[d];

    // 같은 방향으로 계속 진행
    if (in(nr, nc)) {
        isMove = true;
        visited[nr][nc] = true;
        backtracking(nr, nc, d, cnt);
        visited[nr][nc] = false;
    } else { // 방향 전환하기
        bool isLast = true; // 마지막 위치 판별

        for (int i = 0; i < 4; ++i) {
            nr = r + dy[i];
            nc = c + dx[i];

            if (in(nr, nc)) {
                isMove = true;
                isLast = false;
                visited[nr][nc] = true;
                backtracking(nr, nc, i, cnt + 1);
                visited[nr][nc] = false;
            }
        }

        if (isLast && check()) {
            if (isMove) ans = min(ans, cnt);
            else ans = 0;
        }
    }
}

int main()
{
    ios::sync_with_stdio(0); cin.tie(0);
    freopen("input.txt", "r", stdin);

    while (1) {
        cin >> n >> m;
        if (cin.eof()) break;

        // 방문 배열과 최소거리 초기화
        fill(&visited[0][0], &visited[29][30], false);
        ans = INF;
        
        for (int i = 0; i < n; ++i) {
            string s;
            cin >> s;

            for (int j = 0; j < m; ++j) {
                graph[i][j] = s[j];
                if (s[j] == '*')
                    visited[i][j] = true;
            }
        }

        for (int i = 0; i < n; ++i) {
            for (int j = 0; j < m; ++j) {
                if (graph[i][j] == '.') {
                    for (int k = 0; k < 4; ++k) {
                        isMove = false; // 시작점에서 이동했는지 판별
                        visited[i][j] = true;
                        backtracking(i, j, k, 1);
                        visited[i][j] = false;
                    }
                }
            }
        }

        cout << "Case " << t++ << ": ";
        if (ans < INF) cout << ans << endl;
        else cout << -1 << endl;
    }

    return 0;
}