/*
 21.10.24
 백준 16916 부분 문자열
 https://github.com/skyqnaqna/algorithm_study
 */

#include <bits/stdc++.h>

using namespace std;
using ll = long long;
using dd = double;
using pii = pair<int, int>;
using pll = pair<ll, ll>;

#define INF (ll)2e12
#define endl "\n"

void input() {
    freopen("input.txt", "r", stdin);
}

vector <int> getPi(string p) {
    int m = (int)p.length(), j = 0;
    vector <int> pi(m, 0);
    for (int i = 1; i < m; ++i) {
        while (j > 0 && p[i] != p[j]) j = pi[j - 1];
        if (p[i] == p[j]) pi[i] = ++j;
    }

    return pi;
}

bool kmp(string s, string p) {
    auto pi = getPi(p);

    int n = (int)s.length(), m = (int)p.length(), j = 0;
    for (int i = 0; i < n; ++i) {
        while (j > 0 && s[i] != p[j]) j = pi[j - 1];
        if (s[i] == p[j]) {
            if (j == m - 1) {
                return true;
            } else {
                ++j;
            }
        }
    }

    return false;
}

int main() {
    ios::sync_with_stdio(0); cin.tie(0);

    string s, p; cin >> s >> p;

    if (kmp(s, p)) cout << 1 << endl;
    else cout << 0 << endl;


    return 0;
}