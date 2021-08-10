/*
 백준 2473 세 용액
 21.08.10
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

ll minSum = INF * 2;
vector <ll> v;
int n, first, second, third;

int main() {
    ios::sync_with_stdio(0); cin.tie(0);
    freopen("input.txt", "r", stdin);

    cin >> n;

    for (int i = 0; i < n; ++i) {
        ll x; cin >> x;
        v.push_back(x);
    }

    sort(v.begin(), v.end());

    // 용액 하나를 고정시키고 진행
    for (int i = 0; i < n - 2; ++i) {
        int l = i + 1, r = n - 1;

        while (l < r) {
            ll sum = v[i] + v[l] + v[r];

            if (abs(sum) < minSum) {
                minSum = abs(sum);
                first = i, second = l, third = r;
            }

            if (sum > 0) {
                --r;
            } else {
                ++l;
            }
        }
    }

    cout << v[first] << " " << v[second] << " " << v[third] << endl;

    return 0;
}