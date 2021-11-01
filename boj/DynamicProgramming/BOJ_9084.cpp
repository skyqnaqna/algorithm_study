/*
 21.11.01
 백준 9084 동전
 https://github.com/skyqnaqna/algorithm_study
 */

#include <bits/stdc++.h>

using namespace std;
using ll = long long;
using dd = double;
using pii = pair<int, int>;
using pll = pair<ll, ll>;

#define INF (ll)2e12
#define endl "\n"

void input() {
    freopen("input.txt", "r", stdin);
}

int t, n, m, coins[20];

int main() {
    ios::sync_with_stdio(0); cin.tie(0);

    cin >> t;
    while (t-->0) {
        cin >> n;
        for (int i = 0; i < n; ++i) {
            cin >> coins[i];
        }

        cin >> m;

        vector <int> dp(m + 1, 0);
        dp[0] = 1;

        for (int i = 0; i < n; ++i) {
            for (int j = coins[i]; j <= m; ++j) {
                dp[j] += dp[j - coins[i]];
            }
        }

        cout << dp[m] << endl;
    }

    return 0;
}