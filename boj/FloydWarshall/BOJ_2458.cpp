/*
 백준 2458 키 순서
 21.07.12
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

int graph[501][501];
int n, m;

int main()
{
    ios::sync_with_stdio(0); cin.tie(0);

    cin >> n >> m;

    fill(&graph[0][0], &graph[500][501], INF);

    for (int i = 0; i < m; ++i) {
        int a, b;
        cin >> a >> b;

        graph[a][b] = 1; // a -> b : a에서 b로 갈 수 있음 (키 비교 가능)
        graph[b][a] = -1; // a -> b : b보다 a가 작다는 것
    }

    for (int k = 1; k <= n; ++k) {
        for (int i = 1; i <= n; ++i) {
            graph[i][i] = 0;
            for (int j = 1; j <= n; ++j) {
                if (i == j || i == k || j == k) continue;
                if (graph[i][k] > 0 && graph[k][j] > 0 && graph[i][k] + graph[k][j] < graph[i][j]) {
                    graph[i][j] = graph[i][k] + graph[k][j];
                    graph[j][i] = -graph[i][j];
                }
            }
        }
    }

    // 키를 비교할 수 있는 경우는 그래프요소의 값들이 INF가 아닌 경우임
    // INF인 값은 키를 비교할 수 없는 경우
    int ans = 0;
    for (int i = 1; i <= n; ++i) {
        bool valid = true;
        for (int j = 1; j <= n; ++j) {
            if (graph[i][j] == INF) {
                valid = false;
                break;
            }
        }
        if (valid) ans++;
    }

    cout << ans << endl;

    return 0;
}
