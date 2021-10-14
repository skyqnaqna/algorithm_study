/*
 백준 5549 행성 탐사
 21.10.15
 https://github.com/skyqnaqna/algorithm_study
 */

#include <bits/stdc++.h>

using namespace std;
using ll = long long;
using dd = double;
using pii = pair<int, int>;
using pll = pair<ll, ll>;

#define INF (int)1e9
#define endl "\n"

int n, m, k, graph[3][1002][1002];

int main() {
    ios::sync_with_stdio(0); cin.tie(0);
//    freopen("input.txt", "r", stdin);

    cin >> m >> n >> k;

    for (int i = 1; i <= m; ++i) {
        string s; cin >> s;

        for (int j = 0; j < n; ++j) {
            if (s[j] == 'J') {
                graph[0][i][j+1] = 1;
            } else if (s[j] == 'O') {
                graph[1][i][j+1] = 1;
            } else {
                graph[2][i][j+1] = 1;
            }
            graph[0][i][j+1] += graph[0][i][j];
            graph[1][i][j+1] += graph[1][i][j];
            graph[2][i][j+1] += graph[2][i][j];
        }
    }

    for (int i = 1; i <= n; ++i) {
        for (int j = 1; j <= m; ++j) {
            graph[0][j][i] += graph[0][j-1][i];
            graph[1][j][i] += graph[1][j-1][i];
            graph[2][j][i] += graph[2][j-1][i];
        }
    }

    for (int i = 0; i < k; ++i) {
        int a, b, c, d; cin >> a >> b >> c >> d;

        cout << graph[0][c][d] - graph[0][a-1][d] - graph[0][c][b-1] + graph[0][a-1][b-1] << " ";
        cout << graph[1][c][d] - graph[1][a-1][d] - graph[1][c][b-1] + graph[1][a-1][b-1] << " ";
        cout << graph[2][c][d] - graph[2][a-1][d] - graph[2][c][b-1] + graph[2][a-1][b-1] << endl;
    }

    return 0;
}