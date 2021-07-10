/*
 백준 5569 출근 경로
 21.07.10
 https://github.com/skyqnaqna/algorithm_study
 */

#include <bits/stdc++.h>

using namespace std;

#define INF 2147483647
#define endl "\n"

typedef long long ll;
typedef double dd;
typedef pair<int, int> pii;
typedef pair<ll, ll> pll;

int w, h, dp[101][101][2][2];
const int MOD = 100000;

int main() {
    ios::sync_with_stdio(0); cin.tie(0);

    cin >> w >> h;

    for (int i = 2; i <= h; ++i) dp[i][1][0][0] = 1;
    for (int i = 2; i <= w; ++i) dp[1][i][1][0] = 1;

    for (int j = 2; j <= h; ++j) {
        for (int i = 2; i <= w; ++i) {
            dp[j][i][0][0] = (dp[j-1][i][0][0] + dp[j-1][i][0][1]) % MOD;
            dp[j][i][1][0] = (dp[j][i-1][1][0] + dp[j][i-1][1][1]) % MOD;
            dp[j][i][0][1] = (dp[j-1][i][1][0]) % MOD;
            dp[j][i][1][1] = (dp[j][i-1][0][0]) % MOD;
        }
    }

    int ans = 0;
    for (int i = 0; i < 2; ++i) {
        for (int j = 0; j < 2; ++j) {
            ans += dp[h][w][i][j];
            ans %= MOD;
        }
    }

    cout << ans << endl;


    // for (int i = 1; i <= h; ++i) {
    //     for (int j = 1; j <= w; ++j) {
    //         cout << (dp[i][j][0][0] + dp[i][j][0][1] + dp[i][j][1][0] + dp[i][j][1][1]) % MOD << " ";
    //     }
    //     cout << endl;
    // }

    return 0;
}
