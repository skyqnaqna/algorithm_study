/*
 백준 2110 공유기 설치
 21.07.31
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

int n, c;
vector <int> house;

int main()
{
    ios::sync_with_stdio(0); cin.tie(0);
    freopen("input.txt", "r", stdin);

    cin >> n >> c;

    for (int i = 0; i < n; ++i) {
        int x; cin >> x;
        house.push_back(x);
    }

    sort(house.begin(), house.end());

    int mid, l = 0, r = house[n-1], ans = 0;

    while (l <= r) {
        mid = (l + r) / 2;

        int cnt = 1, pre = house[0];
        for (auto &now : house) {
            if (now - pre >= mid) {
                ++cnt;
                pre = now;
            }
        }

        if (cnt >= c) {
            ans = max(ans, mid);
            l = mid + 1;
        } else {
            r = mid - 1;
        }
    }

    cout << ans << endl;

    return 0;
}
