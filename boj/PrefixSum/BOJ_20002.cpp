/*
 21.10.21
 백준 20002 사과나무
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

int n, graph[301][301];

int main() {
    ios::sync_with_stdio(0); cin.tie(0);

    cin >> n;

    int answer = -1001;

    for (int i = 1; i <= n; ++i) {
        for (int j = 1; j <= n; ++j) {
            cin >> graph[i][j];

            if (answer < graph[i][j]) answer = graph[i][j];

            graph[i][j] += graph[i][j-1];
        }
    }

    for (int j = 1; j <= n; ++j) {
        for (int i = 1; i <= n; ++i) {
            graph[i][j] += graph[i-1][j];
        }
    }

    for (int i = 1; i <= n; ++i) {
        for (int j = 1; j <= n; ++j) {
            for (int k = 1; k < n; ++k) {
                if (i + k > n || j + k > n) break;

                int val = graph[i+k][j+k] - graph[i-1][j+k] - graph[i+k][j-1] + graph[i-1][j-1];

                if (answer < val) answer = val;
            }
        }
    }

    cout << answer << endl;

    return 0;
}