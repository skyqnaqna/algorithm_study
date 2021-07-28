/*
 백준 14888 연산자 끼워넣기
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

int n, arr[11], op[4];
vector <int> per;

int main()
{
    ios::sync_with_stdio(0); cin.tie(0);
    freopen("input.txt", "r", stdin);

    cin >> n;

    for (int i = 0; i < n; ++i) {
        cin >> arr[i];
    }

    for (int i = 0; i < 4; ++i) {
        cin >> op[i];
    }

    for (int i = 0; i < 4; ++i) {
        if (op[i]) {
            while (op[i]--) per.push_back(i);
        }
    }

    int maxRes = -(1e9 + 1), minRes = 1e9 + 1;

    do {
        int sum = arr[0];
        for (int i = 1; i < n; ++i) {
            if (per[i - 1] == 0) {
                sum += arr[i];
            } else if (per[i - 1] == 1) {
                sum -= arr[i];
            } else if (per[i -1] == 2) {
                sum *= arr[i];
            } else if (per[i - 1] == 3) {
                sum /= arr[i];
            }
        }

        maxRes = max(maxRes, sum);
        minRes = min(minRes, sum);
    } while (next_permutation(per.begin(), per.end()));

    cout << maxRes << endl << minRes << endl;

    return 0;
}
