/*
 백준 5582 공통 부분 문자열
 21.07.16
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

int dp[4001][4001];

int main()
{
    ios::sync_with_stdio(0); cin.tie(0);
    freopen("input.txt", "r", stdin);

    string a, b;
    cin >> a >> b;

    int ans = 0;

    for (int i = 0; i < a.length(); ++i) {
        if (b[0] == a[i]) {
            dp[i][0] = 1;
            ans = 1;
        }
    }

    for (int i = 1; i < b.length(); ++i) {
        if (a[0] == b[i]) {
            dp[0][i] = 1;
            ans = 1;
        }
    }

    for (int i = 1; i < a.length(); ++i) {
        for (int j = 1; j < b.length(); ++j) {
            if (a[i] == b[j]) {
                dp[i][j] = dp[i - 1][j - 1] + 1;
                if (ans < dp[i][j]) ans = dp[i][j];
            }
        }
    }

    cout << ans << endl;

    return 0;
}