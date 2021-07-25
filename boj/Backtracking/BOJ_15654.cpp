/*
 백준 15654 N과 M (5)
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
vector <int> v, arr;
bool visited[8];

void backtracking(int cnt) {
    if (cnt == m) {
        for (auto &i : v) {
            cout << i << " ";
        }
        cout << endl;
    } else {
        for (int i = 0; i < n; ++i) {
            if (!visited[i]) {
                v.push_back(arr[i]);
                visited[i] = true;
                backtracking(cnt + 1);
                v.pop_back();
                visited[i] = false;
            }
        }
    }
}

int main()
{
    ios::sync_with_stdio(0); cin.tie(0);
    freopen("input.txt", "r", stdin);

    cin >> n >> m;

    for (int i = 0; i < n; ++i) {
        int x; cin >> x;
        arr.push_back(x);
    }

    sort(arr.begin(), arr.end());

    backtracking(0);

    return 0;
}