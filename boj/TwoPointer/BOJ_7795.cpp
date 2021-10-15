/*
 21.10.15
 백준 7795 먹을 것인가 먹힐 것인가
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

int t, n, m;

int main() {
    ios::sync_with_stdio(0); cin.tie(0);
//    freopen("input.txt", "r", stdin);

    cin >> t;

    while (t-->0) {
        cin >> n >> m;

        vector <int> a, b;

        for (int i = 0; i < n; ++i) {
            int x; cin >> x;
            a.push_back(x);
        }

        for (int i = 0; i < m; ++i) {
            int x; cin >> x;
            b.push_back(x);
        }

        sort(a.begin(), a.end());
        sort(b.begin(), b.end());

        int answer = 0, pa = 0, pb = 0;

        while (pa < n && pb < m) {
            if (a[pa] <= b[pb]) {
                while (a[pa] <= b[pb]) { ++pa; }
                continue;
            }

            answer += n - pa;
            ++pb;
        }

        cout << answer << endl;
    }

    return 0;
}