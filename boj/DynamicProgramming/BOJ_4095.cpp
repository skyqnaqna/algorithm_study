/*
 21.10.19
 백준 4095 최대 정사각형
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

int n, m, graph[1000][1000];

int main() {
    ios::sync_with_stdio(0); cin.tie(0);

    while (true) {
        cin >> n >> m;
        if (n == 0 && m == 0) break;
        int answer = 0;

        for (int i = 0; i < n; ++i) {
            for (int j = 0; j < m; ++j) {
                cin >> graph[i][j];

                if (graph[i][j] == 1) answer = 1;
            }
        }


        for (int i = 1; i < n; ++i) {
            for (int j = 1; j < m; ++j) {
                if (graph[i][j] > 0 && graph[i-1][j-1] > 0 && graph[i][j-1] > 0 && graph[i-1][j] > 0) {
                    graph[i][j] = min(graph[i-1][j-1], min(graph[i][j-1], graph[i-1][j])) + 1;
                    answer = max(answer, graph[i][j]);
                }
            }
        }

        cout << answer << endl;

    }

    return 0;
}