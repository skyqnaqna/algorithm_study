/*
 백준 16953 A -> B
 21.08.18
 https://github.com/skyqnaqna/algorithm_study
 */

#include <bits/stdc++.h>

using namespace std;
using ll = long long;
using dd = double;
using pii = pair<int, int>;
using pll = pair<ll, ll>;

#define INF 2e9
#define endl "\n"

ll a, b;

int main() {
    ios::sync_with_stdio(0); cin.tie(0);
    freopen("input.txt", "r", stdin);

    cin >> a >> b;

    queue<pll>q;
    q.push({a, 0});

    while (!q.empty()) {
        ll now = q.front().first;
        ll cnt = q.front().second;
        q.pop();

        if (now == b) {
            cout << cnt + 1 << endl;
            return 0;
        }

        if (now * 2 <= b) {
            q.push({now * 2, cnt + 1});
        }

        if (now * 10 + 1 <= b) {
            q.push({now * 10 + 1, cnt + 1});
        }
    }

    cout << -1 << endl;

    return 0;
}