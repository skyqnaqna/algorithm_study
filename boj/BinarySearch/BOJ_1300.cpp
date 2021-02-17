// 백준 1300 K번째 수
// 21.02.18
#include <iostream>
#include <algorithm>
#include <queue>
#include <vector>
#include <string>
#include <cmath>
#include <set>
#define INF 2147000000

typedef long long ll;

using namespace std;

int main()
{
    ll n; scanf("%lld", &n);
    ll k; scanf("%lld", &k);

    ll l = 1, r = k;
    ll m = (l + r) / 2;
    ll ans = pow(n, 2);

    while (l <= r)
    {
        ll cnt = 0;
        for (ll i = 1; i <= n; ++i)
            cnt += min(n, m / i);

        if (cnt >= k) 
        {
            ans = min(ans, m);
            r = m - 1;
        }
        else l = m + 1;
        m = (l + r) / 2;
    }

    printf("%lld\n", ans);

    return 0;
}