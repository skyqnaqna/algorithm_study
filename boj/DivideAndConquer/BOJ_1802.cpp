/*
 백준 1802 종이 접기
 21.08.20
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

bool checkFold(string s, int left, int right) {
    if (left == right) return true;

    int mid = (left + right) / 2;
    int l = left, r = right;

    while (l < mid && mid < r) {
        if (s[l] == s[r]) return false;
        ++l; --r;
    }
    return checkFold(s, left, mid - 1) && checkFold(s, mid + 1, right);
}

int main() {
    ios::sync_with_stdio(0); cin.tie(0);
    freopen("input.txt", "r", stdin);

    int t; cin >> t;

    while (t-->0) {
        string paper;
        cin >> paper;

        if (checkFold(paper, 0, paper.length() - 1)) cout << "YES\n";
        else cout << "NO\n";
    }

    return 0;
}