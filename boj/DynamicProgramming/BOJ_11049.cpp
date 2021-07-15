/*
 백준 11049 행렬 곱셈 순서
 21.07.16
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

int n, matrix[500][2], dp[500][500];

int main() {
    ios::sync_with_stdio(0); cin.tie(0);
    freopen("input.txt", "r", stdin);

    cin >> n;

    for (int i = 0; i < n; ++i) {
        cin >> matrix[i][0] >> matrix[i][1];
    }

    for (int i = 0; i < n - 1; ++i) {
        dp[i][i + 1] = matrix[i][0] * matrix[i][1] * matrix[i + 1][1];
    }

    for (int r = 2; r < n; ++r) {
        for (int i = 0; i < n - r; ++i) {
            int j = i + r;
            for (int k = i; k < j; ++k) {
                int res = dp[i][k] + dp[k + 1][j] + matrix[i][0] * matrix[k][1] * matrix[j][1];
                if (dp[i][j] == 0 || dp[i][j] > res) dp[i][j] = res;
            }
        }
    }

    cout << dp[0][n-1] << endl;

    return 0;
}
