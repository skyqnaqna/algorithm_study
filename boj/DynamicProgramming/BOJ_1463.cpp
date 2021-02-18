// 백준 1463 1로 만들기
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

int dp[1000001];

int main()
{
    int n; scanf("%d", &n);

    fill_n(dp, 1000001, INF);
    dp[1] = 0; dp[2] = 1; dp[3] = 1;

    for (int i = 4; i <= n; ++i)
    {
        if (i % 3 == 0) dp[i] = min(dp[i / 3] + 1, dp[i]);
        if (i % 2 == 0) dp[i] = min(dp[i / 2] + 1, dp[i]);
        dp[i] = min(dp[i], dp[i - 1] + 1);
    }

    printf("%d\n", dp[n]);

    return 0;
}