/*
 백준 2467 용액
 21.08.27
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

int n, res = INF, arr[100001];
pii ans;

int main() {
    ios::sync_with_stdio(0); cin.tie(0);
    freopen("input.txt", "r", stdin);

    cin >> n;

    for (int i = 0; i < n; ++i) {
        cin >> arr[i];
    }

    int l = 0, r = n - 1;

    while (l < r) {
        int val = arr[l] + arr[r];

        if (abs(val) < res) {
            res = abs(val);
            ans = {arr[l], arr[r]};
        }

        if (val < 0) ++l;
        else --r;
    }

    cout << ans.first << " " << ans.second << endl;

    return 0;
}