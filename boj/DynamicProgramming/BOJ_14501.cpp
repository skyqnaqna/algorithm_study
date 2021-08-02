/*
 백준 14501 퇴사
 21.08.02
 https://github.com/skyqnaqna/algorithm_study
 */

#include <bits/stdc++.h>

using namespace std;
using ll = long long;
using dd = double;
using pii = pair<int, int>;
using pll = pair<ll, ll>;

#define INF 2e9
#define endl "\n"

int n, t[15], p[15], dp[15];

int main()
{
    ios::sync_with_stdio(0); cin.tie(0);
    freopen("input.txt", "r", stdin);

    cin >> n;
    for (int i = 0; i < n; ++i) {
        cin >> t[i] >> p[i];
    }

    int maxProfit = 0;
    for (int i = n - 1; i >= 0; --i) {
        if (t[i] + i <= n) {
            dp[i] = max(p[i] + dp[t[i] + i], maxProfit);
            maxProfit = dp[i];
        } else {
            dp[i] = maxProfit;
        }
    }

    cout << dp[0] << endl;

    return 0;
}
