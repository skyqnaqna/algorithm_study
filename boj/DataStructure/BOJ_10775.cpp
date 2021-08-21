/*
 백준 10775 공항
 21.08.22
 https://github.com/skyqnaqna/algorithm_study
 */

#include <bits/stdc++.h>

using namespace std;
using ll = long long;
using dd = double;
using pii = pair<int, int>;
using pll = pair<ll, ll>;

#define INF (int)2e9
#define endl "\n"

int g, p, gate[100001];

// 도킹하지않은 가장 오른쪽 게이트를 찾아야한다
int findGate(int idx) {
    if (gate[idx] == idx) {
        gate[idx]--;
        return idx;
    } else return gate[idx] = findGate(gate[idx]);
}

int main() {
    ios::sync_with_stdio(0); cin.tie(0);
    freopen("input.txt", "r", stdin);

    cin >> g >> p;
    for (int i = 0; i <= g; ++i) gate[i] = i;

    int ans = 0;
    while (p-->0) {
        int gi; cin >> gi;

        if (findGate(gi) != 0) {
            ++ans;
        } else {
            break;
        }
    }

    cout << ans << endl;

    return 0;
}