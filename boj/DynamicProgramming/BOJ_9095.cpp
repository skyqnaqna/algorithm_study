// 백준 9095 1, 2, 3 더하기
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
    int t; scanf("%d", &t);

    int dp[20] = { 0 };
    dp[1] = 1, dp[2] = 2, dp[3] = 4;
    for (int i = 4; i < 11; ++i)
        dp[i] = dp[i-1] + dp[i-2] + dp[i-3];

    while (t-->0)
    {
        int x; scanf("%d", &x);
        printf("%d\n", dp[x]);
    }

    return 0;
}