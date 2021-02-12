// 백준 1789 수들의 합
// 21.02.12
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
    ll s; scanf("%lld", &s);
    ll left = 1, right = s;
    ll mid = (left + right) / 2;

    while (left < mid && mid < right)
    {
        if (pow(mid, 2) + mid > 2*s) right = mid;
        else left = mid;

        mid = (left + right) / 2;
    }

    printf("%lld\n", mid);

    return 0;
}