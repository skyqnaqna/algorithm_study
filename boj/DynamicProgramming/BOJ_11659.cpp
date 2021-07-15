/*
 백준 11659 구간 합 구하기 4
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

int n, m, arr[100001], dp[100001];

int main() {
    ios::sync_with_stdio(0); cin.tie(0);

    cin >> n >> m;

    for (int i = 1; i <= n; ++i) {
        cin >> arr[i];
    }

    for (int i = 1; i <= n; ++i) {
        dp[i] = dp[i - 1] + arr[i];
    } 

    for (int i = 0; i < m; ++i) {
        int l, r;
        cin >> l >> r;

        cout << dp[r] - dp[l - 1] << endl;
    }

    return 0;
}
