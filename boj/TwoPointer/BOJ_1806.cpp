/*
 백준 1806 부분합
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

int n, s;
int arr[100001];

int main()
{
    ios::sync_with_stdio(0); cin.tie(0);

    cin >> n >> s;

    for (int i = 0; i < n; ++i) cin >> arr[i];

    int l = 0, r = 0, sum = 0, ans = INF;

    while (l < n) {
        if (r == n) {
            sum -= arr[l++];
        } else if (sum < s) sum += arr[r++];
        else sum -= arr[l++];

        if (sum >= s) ans = min(ans, r - l);
    }

    if (ans < INF) cout << ans << endl;
    else cout << 0 << endl;

    return 0;
}