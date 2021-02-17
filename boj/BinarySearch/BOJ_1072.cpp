// 백준 1072 게임
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
    ll x, y; scanf("%lld %lld", &x, &y);
    ll z = (100 * y) / x;
    int l = 0;
    int r = 1000000000;
    int m = (l + r) / 2;
    int ans = INF;

    while (l <= r)
    {
        ll temp = (100 * (y + m)) / (x + m);

        if (temp > z)
        {
            ans = min(ans, m);
            r = m - 1;
        }
        else
        {
            l = m + 1;
        }

        m = (l + r) / 2;
    }
    if (ans < INF) printf("%d\n", ans);
    else printf("%d\n", -1);

    return 0;
}