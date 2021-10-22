/*
 21.10.22
 백준 17845 수강 과목
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

int n, k, dp[10001];
vector <pii> info;

int main() {
    ios::sync_with_stdio(0); cin.tie(0);

    cin >> n >> k;

    for (int i = 0; i < k; ++i) {
        int l, t; cin >> l >> t;
        info.emplace_back(t, l);
    }

    sort(info.begin(), info.end());

    for (auto &it : info) {
        int times = it.first;
        int score = it.second;

        for (int i = n; i >= times; --i) {
            dp[i] = max(dp[i], dp[i - times] + score);
        }
    }

    cout << dp[n] << endl;

    return 0;
}