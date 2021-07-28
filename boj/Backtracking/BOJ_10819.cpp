/*
 백준 10819 차이를 최대로
 21.07.28
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

int n, arr[8];

int main()
{
    ios::sync_with_stdio(0); cin.tie(0);
    freopen("input.txt", "r", stdin);

    cin >> n;

    for (int i = 0; i < n; ++i) {
        cin >> arr[i];
    }

    sort(arr, arr + n);

    int ans = 0;

    do {
        int sum = 0;
        for (int i = 1; i < n; ++i) {
            sum += abs(arr[i - 1] - arr[i]);
        }
        ans = max(ans, sum);
    } while (next_permutation(arr, arr + n));

    cout << ans << endl;

    return 0;
}
