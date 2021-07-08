/*
 백준 10610 30
 21.07.08
 https://github.com/skyqnaqna/algorithm_study
 */

#include <bits/stdc++.h>

using namespace std;

#define INF 1e9
#define endl "\n"

typedef long long ll;
typedef double dd;
typedef pair<int, int> pii;
typedef pair<ll, ll> pll;

string s;
int sum;
int cnt[128];

int main()
{
    ios::sync_with_stdio(0); cin.tie(0);

    cin >> s;
    for (auto &c : s) {
        sum += c - '0';
        cnt[c]++;
    }

    if (sum % 3 != 0 || cnt['0'] == 0) {
        cout << -1 << endl;
        return 0;
    }

    for (int i = '9'; i >= '0'; --i) {
        for (int j = 0; j < cnt[i]; ++j) {
            cout << char(i);
        }
    }

    return 0;
}
