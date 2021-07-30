/*
 백준 14939 불 끄기
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

int cnt, ans = INF;
int dy[] = {-1, 1, 0, 0, 0};
int dx[] = {0, 0, -1, 1, 0};
char graph[10][10], temp[10][10];

bool in(int r, int c) { return 0 <= r && r < 10 && 0 <= c && c < 10; }
bool check() {
    for (int i = 0; i < 10; ++i) {
        for (int j = 0; j < 10; ++j) {
            if (temp[i][j] == 'O') return false;
        }
    }
    return true;
}

void turn(int r, int c) {
    ++cnt;
    for (int i = 0; i < 5; ++i) {
        int nr = r + dy[i];
        int nc = c + dx[i];

        if (!in(nr, nc)) continue;
        temp[nr][nc] = temp[nr][nc] == '#' ? 'O' : '#';
    }
}

int main()
{
    ios::sync_with_stdio(0); cin.tie(0);
    freopen("input.txt", "r", stdin);

    for (int i = 0; i < 10; ++i) {
        string s; cin >> s;

        for (int j = 0; j < 10; ++j) {
            graph[i][j] = s[j];
        }
    }

    for (int caseOfFirstRow = 0; caseOfFirstRow < (1<<10); ++caseOfFirstRow) {
        for (int i = 0; i < 10; ++i) {
            for (int j = 0; j < 10; ++j) {
                temp[i][j] = graph[i][j];
            }
        }

        cnt = 0;

        for (int i = 0; i < 10; ++i) {
            if (caseOfFirstRow & (1 << i)) turn(0, i);
        }

        for (int i = 1; i < 10; ++i) {
            for (int j = 0; j < 10; ++j) {
                if (temp[i-1][j] == 'O') turn(i, j);
            }
        }

        if (check()) ans = min(ans, cnt);
    }

    if (ans < INF) cout << ans << endl;
    else cout << -1 << endl;

    return 0;
}
