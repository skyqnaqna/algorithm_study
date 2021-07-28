/*
 백준 10974 모든 순열
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

int n;
bool visited[10];
vector <int> v;

void backtracking(int idx, int cnt) {
    if (cnt == n) {
        for (auto &i : v) cout << i << " ";
        cout << endl;
        return;
    }

    for (int i = 0; i < n; ++i) {
        if (!visited[i]) {
            visited[i] = true;
            v.push_back(i + 1);
            backtracking(idx + 1, cnt + 1);
            visited[i] = false;
            v.pop_back();
        }
    }
}

int main()
{
    ios::sync_with_stdio(0); cin.tie(0);
    freopen("input.txt", "r", stdin);

    cin >> n;

    backtracking(0, 0);

    return 0;
}
