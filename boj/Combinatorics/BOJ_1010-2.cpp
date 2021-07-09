/*
 백준 1010 다리놓기
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

int t, n, m, combi[31][31];

int main()
{
    ios::sync_with_stdio(0); cin.tie(0);

    cin >> t;

    while (t-->0) {
        cin >> n >> m;

        combi[0][0] = 1;
        for (int i = 1; i <= m; ++i) {
            combi[i][0] = 1;
            for (int j = 1; j <= i; ++j) {
                combi[i][j] = combi[i-1][j] + combi[i-1][j-1];
            }
        }

        cout << combi[m][n] << endl;
    }

    return 0;
}
