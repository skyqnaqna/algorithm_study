// 백준 15810 풍선 공장
// 21.02.17
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
    int n, m; scanf("%d %d", &n, &m);
    vector <ll> times;
    for (int i = 0; i < n; ++i)
    {
        ll a; scanf("%lld", &a);
        times.push_back(a);
    }

    ll l = 0, r = *min_element(times.begin(), times.end()) * m;
    ll mid = (l + r) / 2;
    ll ans = r;

    while (l <= r)
    {
        ll cnt = 0;
        for (auto &t : times)
            cnt += mid / t;
        
        if (cnt >= m)
        {
            ans = min(ans, mid);
            r = mid - 1;
        }
        else l = mid + 1;
        mid = (l + r) / 2;
    }

    printf("%lld\n", ans);

    return 0;
}