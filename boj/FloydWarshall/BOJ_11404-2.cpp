/*
 백준 11404 플로이드
 21.07.13
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

const int MAX = 101;

int n, m, graph[MAX][MAX];

int main()
{
    ios::sync_with_stdio(0); cin.tie(0);

    cin >> n >> m;

    fill(&graph[0][0], &graph[MAX-1][MAX], INF);

    for (int i = 0; i < m; ++i) {
        int a, b, c;
        cin >> a >> b >> c;

        graph[a][b] = min(graph[a][b], c);
    }

    for (int k = 1; k <= n; ++k) {
        for (int i = 1; i <= n; ++i) {
            if (k == i) continue;
            for (int j = 1; j <= n; ++j) {
                if (k == j || i == j) continue;
                if (graph[i][k] == INF || graph[k][j] == INF) continue;

                if (graph[i][k] + graph[k][j] < graph[i][j]) {
                    graph[i][j] = graph[i][k] + graph[k][j];
                }
            }
        }
    }

    for (int i = 1; i <= n; ++i) {
        for (int j = 1; j <= n; ++j) {
            if (graph[i][j] == INF) cout << 0 << " ";
            else cout << graph[i][j] << " ";
        }
        cout << endl;
    }


    return 0;
}
