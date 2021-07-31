/*
 백준 12101 1, 2, 3 더하기 2
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

int n, k, cnt;
vector <int> v, ans;

void backtracking(int sum) {
    if (sum > n) return;
    if (sum == n) {
        ++cnt;

        if(cnt == k) {
            ans = v;
        }

        return;
    }

    for (int i = 1; i < 4; ++i) {
        v.push_back(i);
        backtracking(sum + i);
        v.pop_back();
    }
}

int main()
{
    ios::sync_with_stdio(0); cin.tie(0);
//    freopen("input.txt", "r", stdin);

    cin >> n >> k;

    backtracking(0);

    if (ans.empty()) cout << -1 << endl;
    else {
        cout << ans[0];
        for (int i = 1; i < ans.size(); ++i) {
            cout << "+" << ans[i];
        }
    }

    return 0;
}
