/*
 백준 1051 숫자 정사각형
 21.07.28
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

int n, m;
char graph[50][50];

bool isSquare(int row, int col, int len) {
    char now = graph[row][col];

    if (now != graph[row][col+len]) return false;
    if (now != graph[row+len][col]) return false;
    if (now != graph[row+len][col+len]) return false;

    return true;
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

    int ans = 0;
    for (int i = 0; i < n; ++i) {
        for (int j = 0; j < m; ++j) {
            for (int k = 0; k <= 50; ++k) {
                if (i + k >= n || j + k >= m) continue;
                if (isSquare(i, j, k)) {
                    ans = max(ans, (k + 1) * (k + 1));
                }
            }
        }
    }

    cout << ans << endl;

    return 0;
}
