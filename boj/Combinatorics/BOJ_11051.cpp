/*
 백준 11051 이항 계수 2
 21.07.09
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

int n, k, combi[1001][1001];

int main()
{
    ios::sync_with_stdio(0); cin.tie(0);

    cin >> n >> k;

    combi[0][0] = 1;
    for (int i = 1; i <= n; ++i) {
        combi[i][0] = 1;
        for (int j = 1; j <= i; ++j) {
            combi[i][j] = (combi[i-1][j] + combi[i-1][j-1]) % 10007;
        }
    }

    cout << combi[n][k] << endl;

    return 0;
}
