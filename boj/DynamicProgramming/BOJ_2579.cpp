/*
 백준 2579 계단 오르기
 21.07.15
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

int n, stair[301],dp[301][2];

int main()
{
    ios::sync_with_stdio(0); cin.tie(0);

    cin >> n;

    for (int i = 1; i <= n; ++i) {
        cin >> stair[i];
    }

    dp[1][0] = dp[1][1] = stair[1];

    for (int i = 2; i <= n; ++i) {
        dp[i][0] = dp[i-1][1] + stair[i];
        dp[i][1] = (max(dp[i-2][0], dp[i-2][1])) + stair[i];
    }

    cout << max(dp[n][0], dp[n][1]) << endl;

    return 0;
}
