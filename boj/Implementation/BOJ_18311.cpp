/*
 21.10.17
 백준 18311 왕복
 https://github.com/skyqnaqna/algorithm_study
 */

#include <bits/stdc++.h>

using namespace std;
using ll = long long;
using dd = double;
using pii = pair<int, int>;
using pll = pair<ll, ll>;

#define INF (int)2e9
#define endl "\n"
#define TXTOPEN freopen("input.txt", "r", stdin)

int n;
ll k;
vector <ll> len;

int main() {
    ios::sync_with_stdio(0); cin.tie(0);

    cin >> n >> k;

    for (int i = 0; i < n; ++i) {
        ll x; cin >> x;
        len.push_back(x);
    }

    ll now = 0;
    for (int i = 0; i < n; ++i) {
        now += len[i];

        if (k < now) {
            cout << i + 1 << endl;
            return 0;
        }
    }

    for (int i = n - 1; i >= 0; --i) {
        now += len[i];

        if (k < now) {
            cout << i + 1 << endl;
            return 0;
        }
    }

    return 0;
}