/*
 백준 15664 N과 M (10)
 21.07.09
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

int n, m, a[8], ans[8];
bool visited[8];

void backtracking(int cnt) {
    if (cnt == m) {
        for (int i = 0; i < m; ++i) {
            cout << ans[i] <<  " ";
        }
        cout << endl;
    }

    int pre = 0;
    for (int i = 0; i < n; ++i) {
        if (!visited[i]) {
            if (cnt > 0 && ans[cnt - 1] > a[i]) continue;
            if (pre == a[i]) continue;

            visited[i] = true;
            ans[cnt] = a[i];
            pre = a[i];
            backtracking(cnt + 1);
            visited[i] = false;
        }
    }
}

int main()
{
    ios::sync_with_stdio(0); cin.tie(0);

    cin >> n >> m;

    for (int i = 0; i < n; ++i) {
        cin >> a[i];
    }

    sort(a, a + n);

    backtracking(0);

    return 0;
}

