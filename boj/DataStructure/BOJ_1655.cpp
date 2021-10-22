/*
 21.10.22
 백준 1655 가운데를 말해요
 https://github.com/skyqnaqna/algorithm_study
 */

#include <bits/stdc++.h>

using namespace std;
using ll = long long;
using dd = double;
using pii = pair<int, int>;
using pll = pair<ll, ll>;

#define INF (int)3e9
#define endl "\n"
#define TXTOPEN freopen("input.txt", "r", stdin)

int n;
priority_queue <int> smallNumMaxPq, bigNumMinPq;

int main() {
    ios::sync_with_stdio(0); cin.tie(0);

    cin >> n;

    for (int i = 0; i < n; ++i) {
        int x; cin >> x;
        if (i % 2 == 0) {
            smallNumMaxPq.push(x);
        } else {
            bigNumMinPq.push(-x);
        }

        if (!bigNumMinPq.empty() && !smallNumMaxPq.empty()) {
            if (-bigNumMinPq.top() < smallNumMaxPq.top()) {
                bigNumMinPq.push(-smallNumMaxPq.top());
                smallNumMaxPq.pop();
                smallNumMaxPq.push(-bigNumMinPq.top());
                bigNumMinPq.pop();
            }
        }


        cout << smallNumMaxPq.top() << endl;
    }

    return 0;
}