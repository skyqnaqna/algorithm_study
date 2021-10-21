/*
 21.10.21
 백준 1561 놀이 공원
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

int n, m, times[10000];

int main() {
    ios::sync_with_stdio(0); cin.tie(0);

    cin >> n >> m;


    ll left = 1, right = 0;

    for (int i = 0; i < m; ++i) {
        cin >> times[i];

        if (right < times[i]) right = times[i];
    }

    if (n <= m) {
        cout << n << endl;
        return 0;
    }

    right *= n;

    ll totalTime = right;

    while (left <= right) {
        ll mid = (left + right) / 2;

        ll cnt = m;
        for (int i = 0; i < m; ++i) {
            cnt += mid / times[i];
        }

        if (cnt >= n) {
            right = mid - 1;
            totalTime = min(totalTime, mid);
        }
        else left = mid + 1;
    }

    ll person = m;
    for (int i = 0; i < m; ++i) {
        person += (totalTime - 1) / times[i];
    }

    for (int i = 0; i < m; ++i) {
        if (totalTime % times[i] == 0 && ++person == n) {
            cout << i + 1 << endl;
            break;
        }
    }

    return 0;
}