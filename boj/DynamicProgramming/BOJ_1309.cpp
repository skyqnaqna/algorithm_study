// 백준 1309 동물원
// 21.02.20
#include <iostream>
#include <algorithm>
#include <queue>
#include <vector>
#include <string>
#include <cmath>
#include <set>
#define INF 2147000000
#define endl "\n"

typedef long long ll;
typedef double dd;

using namespace std;

int d[100001][3];

int main()
{
    int n; scanf("%d", &n);
    d[1][0] = d[1][1] = d[1][2] = 1;

    for (int i = 2; i <= n; ++i)
    {
        d[i][0] = (d[i-1][0] + d[i-1][1] + d[i-1][2])%9901;
        d[i][1] = (d[i-1][0] + d[i-1][2])%9901;
        d[i][2] = (d[i-1][0] + d[i-1][1])%9901;
    }

    int ans = (d[n][0] + d[n][1] + d[n][2]) % 9901;
    printf("%d\n", ans);

    return 0;
}