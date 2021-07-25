/*
 백준 15652 N과 M (4)
 21.07.25
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
vector <int> v;

void backtracking(int idx, int cnt) {
    if (cnt == m) {
        for (auto &i : v) {
            cout << i << " ";
        }
        cout << endl;
    } else {
        for (int i = idx; i <= n; ++i) {
            v.push_back(i);
            backtracking(i, cnt + 1);
            v.pop_back();
        }
    }
}

int main()
{
    ios::sync_with_stdio(0); cin.tie(0);
    // freopen("input.txt", "r", stdin);

    cin >> n >> m;

    backtracking(1, 0);

    return 0;
}