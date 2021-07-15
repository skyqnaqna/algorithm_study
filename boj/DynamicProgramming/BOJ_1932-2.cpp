/*
 백준 1932 정수 삼각형
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

int n, tri[500][500];

int main()
{
    ios::sync_with_stdio(0); cin.tie(0);

    cin >> n;

    cin >> tri[0][0];

    int ans = 0;
    for (int i = 1; i < n; ++i) {
        for (int j = 0; j < i + 1; ++j) {
            cin >> tri[i][j];

            if (j == 0) tri[i][j] += tri[i-1][j];
            else if (j == i) tri[i][j] += tri[i-1][i-1];
            else {
                tri[i][j] = max(tri[i-1][j-1], tri[i-1][j]) + tri[i][j];
            }

            if (ans < tri[i][j]) ans = tri[i][j];
        }
    }

    cout << ans << endl;

    return 0;
}
