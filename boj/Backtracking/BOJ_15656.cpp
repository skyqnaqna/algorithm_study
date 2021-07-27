/*
 백준 15656 N과 M (7)
 21.07.27
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
vector <int> v, res;

void backtracking(int cnt) {
    if (cnt == m) {
        for (auto &i : res) {
            cout << i << " ";
        }
        cout << endl;
        return;
    }

    for (int i = 0; i < n; ++i) {
        res.push_back(v[i]);
        backtracking(cnt + 1);
        res.pop_back();
    }
}

int main()
{
    ios::sync_with_stdio(0); cin.tie(0);
    freopen("input.txt", "r", stdin);

    cin >> n >> m;

    for (int i = 0; i < n; ++i) {
        int x; cin >> x;
        v.push_back(x);
    }

    sort(v.begin(), v.end());

    backtracking(0);

    return 0;
}