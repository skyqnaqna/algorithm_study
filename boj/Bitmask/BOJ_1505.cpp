/*
 백준 1505 불 켜기
 21.07.30
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

int n, m, cnt, ans = INF;
char graph[8][8], temp[8][8];

/*
 * 첫 행과 첫 열의 전구들을 반전시켜보는 모든 경우의 수에 대해서
 * 반전시켜야 하는 경우[ (i-1, j-1)을 반전시키려면 (i, j)를 turn 한다 ]의 최솟값을 구한다
 * 같은 자리를 두 번 바꾸는 것은 최소가 아니므로 현재 위치에서 왼쪽 상단(i-1, j-1)을 확인해서 반전시킨다
 */

bool in(int r, int c) { return 0 <= r && r < n && 0 <= c && c < m; }
bool check() {
    for (int i = 0; i < n; ++i) {
        for (int j = 0; j < m; ++j) {
            if (temp[i][j] == '.') return false;
        }
    }
    return true;
}

void turn(int r, int c) {
    ++cnt;
    for (int i = -1; i < 2; ++i) {
        for (int j = -1; j < 2; ++j) {
            int nr = r + i;
            int nc = c + j;

            if (!in(nr, nc)) continue;

            temp[nr][nc] = temp[nr][nc] == '*' ? '.' : '*';
        }
    }
}

int main()
{
    ios::sync_with_stdio(0); cin.tie(0);
    freopen("input.txt", "r", stdin);

    cin >> n >> m;

    for (int i = 0; i < n; ++i) {
        string s; cin >> s;
        for (int j = 0; j < m; ++j) {
            graph[i][j] = s[j];
        }
    }

    // 첫 번째 행에서 전구를 조작하는 모든 경우의 수 = 2^m
    // 첫 번째 열에서 전구를 조작하는 모든 경우의 수 = 2^n
    for (int caseOfFirstRow = 0; caseOfFirstRow < (1 << m); ++caseOfFirstRow) {
        for (int caseOfFirstCol = 0; caseOfFirstCol < (1 << n); ++caseOfFirstCol) {
            // temp 초기화
            for (int i = 0; i < n; ++i) {
                for (int j = 0; j < m; ++j) {
                    temp[i][j] = graph[i][j];
                }
            }

            cnt = 0; // turn 횟수 초기화

            for (int i = 0; i < n; ++i) {
                // i번째 전구가 1 이라면 반전시키기
                if (caseOfFirstCol & (1<<i)) turn(i, 0);
            }

            for (int i = 0; i < m; ++i) {
                if (caseOfFirstRow & (1<<i)) turn(0, i);
            }

            for (int i = 1; i < n; ++i) {
                for (int j = 1; j < m; ++j) {
                    if (temp[i-1][j-1] == '.') turn(i, j);
                }
            }

            if (check()) ans = min(ans, cnt);
        }
    }

    if (ans < INF) cout << ans << endl;
    else cout << -1 << endl;

    return 0;
}
