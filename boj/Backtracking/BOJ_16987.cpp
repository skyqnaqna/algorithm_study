/*
 백준 16987 계란으로 계란치기
 21.07.22
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

int n, ans = 0;
int egg[8][2]; // [0] : 내구도, [1] : 무게
bool broken[8];

void backtracking(int idx) {
    if (idx == n) {
        int cnt = 0;
        for (int i = 0; i < n; ++i) {
            if (broken[i]) ++cnt;
        }

        ans = max(ans, cnt);
        return;
    }
    if (broken[idx]) backtracking(idx + 1);
    else {
        bool nothing = true;
        for (int i = 0; i < n; ++i) {
            if (idx == i) continue;
            if (!broken[i]) {
                nothing = false;
                egg[i][0] -= egg[idx][1];
                egg[idx][0] -= egg[i][1];

                if (egg[i][0] <= 0) broken[i] = true;
                if (egg[idx][0] <= 0) broken[idx] = true;

                backtracking(idx + 1);

                egg[i][0] += egg[idx][1];
                egg[idx][0] += egg[i][1];

                if (egg[i][0] > 0) broken[i] = false;
                if (egg[idx][0] > 0) broken[idx] = false;
            }
        }
        if (nothing) backtracking(idx + 1);
    }
}

int main()
{
    ios::sync_with_stdio(0); cin.tie(0);
    freopen("input.txt", "r", stdin);

    cin >> n;
    for (int i = 0; i < n; ++i) {
        cin >> egg[i][0] >> egg[i][1];
    }

    backtracking(0);

    cout << ans << endl;

    return 0;
}
