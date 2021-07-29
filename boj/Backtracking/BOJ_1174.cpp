/*
 백준 1174 줄어드는 숫자
 21.07.29
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

const int MAX = 1000000;

int n;
bool visited[10];
vector <ll> res;
vector <int> v;

void backtracking(int digit, int r, int cnt) {
    if (cnt == r) {
        ll num = 0;
        for (int i = 0; i < v.size(); ++i) {
            num *= 10;
            num += v[i];
        }
        res.push_back(num);
        return;
    }

    for (int i = 0; i <= digit; ++i) {
        if (!visited[i]) {
            if (v.empty() || i < v.back()) {
                visited[i] = true;
                v.push_back(i);
                backtracking(i, r, cnt + 1);
                visited[i] = false;
                v.pop_back();
            }
        }
    }
}

int main()
{
    ios::sync_with_stdio(0); cin.tie(0);
//    freopen("input.txt", "r", stdin);

    cin >> n;

    if (n <= 10) {
        cout << n - 1 << endl;
        return 0;
    } else {
        for (int i = 2; i <= 10; ++i) {
            backtracking(9, i, 0);
        }

        if (n > res.size() + 10) cout << - 1 << endl;
        else cout << res[n - 11] << endl;
    }
    return 0;
}
