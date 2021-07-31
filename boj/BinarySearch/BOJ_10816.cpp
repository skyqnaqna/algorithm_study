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

int getLower(int target) {
    int mid, l = 0, r = n - 1;

    while (l <= r) {
        mid = (l + r) / 2;

        if (arr[mid] < target) l = mid + 1;
        else if (arr[mid] >= target) r = mid - 1;
    }

    return l;
}

int getUpper(int target) {
    int mid, l = 0, r = n - 1;

    while (l <= r) {
        mid = (l + r) / 2;

        if (arr[mid] <= target) l = mid + 1;
        else if (arr[mid] > target) r = mid - 1;
    }

    return l;
}

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
        int p1 = getLower(x), p2 = getUpper(x);

        cout << p2 - p1 << " ";
    }

    return 0;
}
