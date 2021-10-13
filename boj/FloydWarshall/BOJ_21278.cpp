/*
 백준 21278 호석이 두 마리 치킨
 21.10.13
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

int n, m, graph[101][101];

int main() {
    ios::sync_with_stdio(0); cin.tie(0);
//    freopen("input.txt", "r", stdin);

    cin >> n >> m;

    fill(&graph[0][0], &graph[n][n+1], INF);

    for (int i = 0; i < m; ++i) {
        int a, b;
        cin >> a >> b;

        graph[a][b] = graph[b][a] = 1;
    }

    for (int k = 1; k <= n; ++k) {
        for (int i = 1; i <= n; ++i) {
            for (int j = 1; j <= n; ++j) {
                if (i == j) {
                    graph[i][j] = 0;
                    continue;
                }

                if (graph[i][k] + graph[k][j] < graph[i][j]) {
                    graph[i][j] = graph[i][k] + graph[k][j];
                }
            }
        }
    }

    int dist = INF, first = -1, second = -1;

    for (int i = 1; i < n; ++i) {
        for (int j = i + 1; j <= n; ++j) {
            int tempDist = 0;

            for (int k = 1; k <= n; ++k) {
                if (k == i || k == j) continue;

                tempDist += min(graph[k][i], graph[k][j]);
            }

            if (tempDist < dist) {
                dist = tempDist;
                first = i;
                second = j;
            }
        }
    }

    cout << first << " " << second << " " << dist * 2 << endl;

    return 0;
}