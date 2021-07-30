/*
 백준 1182 부분수열의 합
 21.07.29
 https://github.com/skyqnaqna/algorithm_study
 */

#include <bits/stdc++.h>

using namespace std;
using ll = long long;
using dd = double;
using pii = pair<int, int>;
using pll = pair<ll, ll>;

#define INF 1e9
#define endl "\n"

int n, s, arr[20], x;

int main()
{
    ios::sync_with_stdio(0); cin.tie(0);

    cin >> n >> s;

    for (int i = 0; i < n; ++i) {
        cin >> arr[i];
    }

    int ans = 0;

    for (int i = 1; i < (1<<n); ++i, x = 0) {
        for (int j = 0; j < n; ++j) {
            if (i & (1<<j)) {
                x += arr[j];
            }
        }
        if (x == s) ++ans;
    }

    cout << ans << endl;

    return 0;
}
