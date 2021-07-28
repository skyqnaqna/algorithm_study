/*
 백준 1182 부분수열의 합
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

int n, s, ans, arr[20];

void dfs(int idx, int sum) {
    if (idx == n) return;
    if (sum + arr[idx] == s) ++ans;

    dfs(idx + 1, sum + arr[idx]);
    dfs(idx + 1, sum);
}

int main()
{
    ios::sync_with_stdio(0); cin.tie(0);
    freopen("input.txt", "r", stdin);

    cin >> n >> s;

    for (int i = 0; i < n; ++i) {
        cin >> arr[i];
    }

    dfs(0, 0);

    cout << ans << endl;

    return 0;
}
