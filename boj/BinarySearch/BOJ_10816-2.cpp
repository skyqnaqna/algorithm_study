/*
 백준 10816 숫자 카드 2
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

int n, m;
vector <int> arr;

int main()
{
    ios::sync_with_stdio(0); cin.tie(0);
    freopen("input.txt", "r", stdin);

    cin >> n;
    for (int i = 0; i < n; ++i) {
        int x; cin >> x;
        arr.push_back(x);
    }

    sort(arr.begin(), arr.end());

    cin >> m;

    for (int i = 0; i < m; ++i) {
        int x; cin >> x;

        cout << upper_bound(arr.begin(), arr.end(), x) - lower_bound(arr.begin(), arr.end(), x) << " ";
    }

    return 0;
}
