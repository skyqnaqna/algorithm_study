/*
 백준 1342 행운의 문자열
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

char arr[10];

int main()
{
    ios::sync_with_stdio(0); cin.tie(0);
    freopen("input.txt", "r", stdin);

    string s; cin >> s;
    int n = s.length();

    if (n == 1) {
        cout << 1 << endl;
        return 0;
    } else if (n == 2) {
        if (s[0] != s[1]) {
            cout << 2 << endl;
        } else {
            cout << 0 << endl;
        }
        return 0;
    }

    for (int i = 0; i < n; ++i) {
        arr[i] = s[i];
    }

    sort(arr, arr + n);

    int ans = 0;
    do {
        bool valid = true;
        for (int i = 1; i < n - 1; ++i) {
            if (arr[i] == arr[i-1] || arr[i] == arr[i+1]) {
                valid = false;
                break;
            }
        }
        if (valid) ++ans;
    } while (next_permutation(arr, arr + n));

    cout << ans << endl;

    return 0;
}
