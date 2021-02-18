// 백준 2670 연속부분최대곱
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
typedef double dd;

using namespace std;

int main()
{
    int n; scanf("%d", &n);
    vector <dd> v;
    vector <dd> dp(n);
    for (int i = 0; i < n; ++i)
    {
        dd a; scanf("%lf", &a);
        v.push_back(a);
    }

    for (int i = 0; i < n; ++i)
    {
        dp[i] = v[i];
        dd temp = v[i];
        for (int j = i + 1; j < n; ++j)
        {
            temp *= v[j];
            dp[i] = max(dp[i], temp);
        }
    }

    dd ans = *max_element(dp.begin(), dp.end());

    printf("%.3f\n", ans);

    return 0;
}