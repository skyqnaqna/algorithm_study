/*
 백준 1915 가장 큰 정사각형
 21.07.15
 https://github.com/skyqnaqna/algorithm_study
 */

#include <bits/stdc++.h>

using namespace std;

#define INF 2e9
#define endl "\n"

typedef long long ll;
typedef double dd;
typedef pair<int, int> pii;
typedef pair<ll, ll> pll;

const int MAX = 1001;
int n, m, graph[MAX][MAX], dp[MAX][MAX];

int main() {
    ios::sync_with_stdio(0); cin.tie(0);
    freopen("input.txt", "r", stdin);

    cin >> n >> m;

    for (int i = 1; i <= n; ++i) {
        string s;
        cin >> s;
        for (int j = 1; j <= m; ++j) {
            graph[i][j] = s[j - 1] - '0';
        }
    }

    int ans = 0;
    for (int i = 1; i <= n; ++i) {
        for (int j = 1; j <= m; ++j) {
            if (graph[i][j] == 0) continue;

            int x = 0;
            if (dp[i][j-1] > 0 && dp[i-1][j] > 0 && dp[i-1][j-1] > 0) {
                x = min(dp[i-1][j-1], min(dp[i - 1][j], dp[i][j - 1]));
            } 
            dp[i][j] = x + 1;
            if (ans < dp[i][j]) ans = dp[i][j];
        }
    }

    cout << ans * ans << endl;

    return 0;
}
