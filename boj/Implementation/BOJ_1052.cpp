/*
 백준 1052 물병
 21.07.19
 https://github.com/skyqnaqna/algorithm_study
 */

#include <bits/stdc++.h>

using namespace std;

#define INF 1e9
#define endl "\n"

typedef long long ll;
typedef double dd;
typedef pair<int, int> pii;
typedef pair<ll, ll> pll;

int n, k;

int main()
{
    ios::sync_with_stdio(0); cin.tie(0);
    freopen("input.txt", "r", stdin);

    cin >> n >> k;

    if (n <= k) {
        cout << 0 << endl;
        return 0;
    }

    int a, b = 0, ans = 0;
    while (1) {
        a = n + ans, b = 0;
        while (a > 1) {
            if (a % 2 != 0) ++b;
            a >>= 1;
        }

        if (a + b <= k) {
            cout << ans << endl;
            break;
        } else {
            ++ans;
        }
    }

    return 0;
}
