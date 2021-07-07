/*
 백준 2143 두 배열의 합
 21.07.07
 https://github.com/skyqnaqna/algorithm_study/
*/

#include <bits/stdc++.h>

#define INF 2147000000
#define endl "\n"

typedef long long ll;
typedef double dd;
typedef std::pair<int, int> pii;
typedef std::pair<ll, ll> pll;

using namespace std;

int t, n, m;
int a[1001];
int b[1001];
vector<int>sumA, sumB;

int main()
{
    ios::sync_with_stdio(0); cin.tie(0);

    cin >> t;
    cin >> n;
    for (int i = 0; i < n; ++i) cin >> a[i];

    cin >> m;
    for (int i = 0; i < m; ++i) cin >> b[i];

    for (int k = 1; k <= n; ++k) {
        for (int i = 0; i < n - k + 1; ++i) {
            int sum = 0;
            for (int j = i; j < i + k; ++j) {
                sum += a[j];
            }
            sumA.push_back(sum);
        }
    }


    for (int k = 1; k <= m; ++k) {
        for (int i = 0; i < m - k + 1; ++i) {
            int sum = 0;
            for (int j = i; j < i + k; ++j) {
                sum += b[j];
            }
            sumB.push_back(sum);
        }
    }

    // for (auto &i : sumA) cout << i << " ";
    // cout << endl;
    // for (auto &i : sumB) cout << i << " ";

    sort(sumA.begin(), sumA.end());
    sort(sumB.begin(), sumB.end());

    int ans = 0, cnt = 0, j = sumB.size() - 1;

    for (int i = 0; i < sumA.size() && j >= 0; ++i) {
        if (i > 0 && sumA[i] == sumA[i - 1]) ans += cnt;
        else {
            cnt = 0;

            if (sumA[i] + sumB[j] < t) continue;
            while (j >= 0 && sumA[i] + sumB[j] > t) --j;
            while (j >= 0 && sumA[i] + sumB[j] == t) {
                ++cnt;
                --j;
            }

            ans += cnt;
        }
    }

    cout << ans << endl;

    return 0;
}


































