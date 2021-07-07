/*
 백준 7453 합이 0인 네 정수
 21.07.07
 https://github.com/skyqnaqna/algorithm_study
 */

#include <bits/stdc++.h>

#define INF 1e9
#define endl "\n"

typedef long long ll;
typedef double dd;
typedef std::pair<int, int> pii;
typedef std::pair<ll, ll> pll;

using namespace std;

int n;
int a[4001], b[4001], c[4001], d[4001];
vector <int> ab, cd;

int main()
{
    ios::sync_with_stdio(0); cin.tie(0);

    cin >> n;

    for (int i = 0; i < n; ++i) {
        cin >> a[i] >> b[i] >> c[i] >> d[i];
    }

    // a, b로 만들수 있는 합의 조합 : ab
    for (int i = 0; i < n; ++i) {
        for (int j = 0; j < n; ++j) {
            ab.push_back(a[i] + b[j]);
            cd.push_back(c[i] + d[j]);
        }
    }

    // 전략 1. 정렬 없이 바로 map 사용
    // 전략 2. 정렬

    sort(ab.begin(), ab.end());
    sort(cd.begin(), cd.end());

    // 전략 2 - 1. lower_bound, upper_bound
    // 전략 2 - 2. 포인터 두 개 사용

    int len = ab.size();
    int j = len - 1;
    ll ans = 0, cnt = 0;

    for (int i = 0; i < len; ++i) {
        if (i > 0 && ab[i] == ab[i - 1]) {
            ans += cnt;
        } else {
            cnt = 0;
            while (j >= 0 && ab[i] + cd[j] > 0) --j;
            while (j >= 0 && ab[i] + cd[j] == 0) {
                ++cnt;
                --j;
            }
            ans += cnt;
        }
    }

    cout << ans << endl;

    return 0;
}


