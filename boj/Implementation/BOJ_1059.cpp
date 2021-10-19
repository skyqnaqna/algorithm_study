/*
 21.10.19
 백준 1059 좋은 구간
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

int l, n;
set <int> s;

int main() {
    ios::sync_with_stdio(0); cin.tie(0);

    cin >> l;

    for (int i = 0; i < l; ++i) {
        int x; cin >> x;
        s.insert(x);
    }

    cin >> n;

    if (s.find(n) != s.end()) {
        cout << 0 << endl;
        return 0;
    }

    int left = n, right = n;

    while (true) {
        if (left ==  1) break;
        if (s.find(left - 1) == s.end()) {
            --left;
        } else break;
    }

    while (true) {
        if (right == 1000) break;
        if (s.find(right + 1) == s.end()) {
            ++right;
        } else break;
    }

    cout << (n - left + 1) * (right - n + 1) - 1 << endl;

    return 0;
}