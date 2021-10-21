/*
 21.10.21
 백준 19637 IF문 좀 대신 써줘
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

int n, m;
vector <pair <string, int> > title;

int getPos(int target) {
    int left = 0, right = n - 1, res = 0;

    while (left <= right) {
        int mid = (left + right) / 2;

        if (target <= title[mid].second) {
            right = mid - 1;
            res = mid;
        } else left = mid + 1;
    }

    return res;
}

int main() {
    ios::sync_with_stdio(0); cin.tie(0);

    cin >> n >> m;

    for (int i = 0; i < n; ++i) {
        string s;
        int x;
        cin >> s >> x;

        title.push_back({s, x});
    }

    for (int i = 0; i < m; ++i) {
        int x; cin >> x;
        cout << title[getPos(x)].first << endl;
    }

    return 0;
}