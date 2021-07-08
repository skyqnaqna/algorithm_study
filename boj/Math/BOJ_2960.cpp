/*
 백준 2960 에라토스테네스의 체
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

int n, k;
bool nums[1001];

int main() {
    ios::sync_with_stdio(0); cin.tie(0);

    cin >> n >> k;

    int cnt = 0;

    for (int i = 2; i <= n; ++i) {
        if (!nums[i]) {
            nums[i] = true;
            ++cnt;
        }

        if (cnt == k) {
            cout << i << endl;
            return 0;
        } else {
            for (int j = 2 * i; j <= n; j += i) {
                if (!nums[j]) {
                    nums[j] = true;
                    ++cnt;
                }

                if (cnt == k) {
                    cout << j << endl;
                    return 0;
                }
            }
        }
    }


    return 0;
}