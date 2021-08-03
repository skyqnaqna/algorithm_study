/*
 백준 1002 터렛
 21.08.03
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

int t, x, y, r1, a, b, r2;

dd getDist(int x, int y, int a, int b) {
    return sqrt(pow(x - a, 2) + pow(y - b, 2));
}

int main() {
    ios::sync_with_stdio(0); cin.tie(0);
    freopen("input.txt", "r", stdin);

    cin >> t;

    while (t-->0) {
        cin >> x >> y >> r1 >> a >> b >> r2;

        if (x == a && y == b && r1 == r2) cout << -1 << endl;
        else {
            dd d = getDist(x, y, a, b);

            if (d < r1 + r2) {
                int big = r1 < r2 ? r2 : r1;
                int small = r1 < r2 ? r1 : r2;

                if (d + small < big) cout << 0 << endl; // 큰 원이 작은원을 포함
                else if (d + small == big) cout << 1 << endl; // 큰 원이 작은원을 포함하는데 한 점에서 겹침
                else cout << 2 << endl;
            } else if (d == r1 + r2) cout << 1 << endl;
            else cout << 0 << endl;
        }
    }

    return 0;
}
