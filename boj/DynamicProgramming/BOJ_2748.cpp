/*
 백준 2748 피보나치 수 2
 21.07.06
 https://github.com/skyqnaqna/algorithm_study/
*/

#include <bits/stdc++.h>

#define INF 1e9
#define endl "\n"

typedef long long ll;
typedef double dd;
typedef std::pair<int, int> pii;
typedef std::pair<ll, ll> pll;

using namespace std;

int n;
ll dp[91];

int main()
{
    ios::sync_with_stdio(0); cin.tie(0);

    cin >> n;

    dp[0] = 0, dp[1] = 1;

    if (n < 2) cout << dp[n] << endl;
    else {
        for (int i = 2; i <= n; ++i) {
            dp[i] = dp[i - 1] + dp[i - 2];
        }

        cout << dp[n] << endl;
    }

    return 0;
}