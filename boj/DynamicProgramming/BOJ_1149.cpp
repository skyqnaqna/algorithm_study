// 백준 1149 RGB거리
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

int house[1001][3];
int d[1001][3];

int main()
{
    int n; scanf("%d", &n);

    for (int i = 1; i <= n; ++i)
    {
        scanf("%d %d %d", &house[i][0], &house[i][1], &house[i][2]);
    }

    fill(&d[0][0], &d[1000][3], 0);
    d[1][0] = house[1][0]; d[1][1] = house[1][1]; d[1][2] = house[1][2];

    for (int i = 2; i <= n; ++i)
    {
        d[i][0] = min(d[i-1][1], d[i-1][2]) + house[i][0];
        d[i][1] = min(d[i-1][0], d[i-1][2]) + house[i][1];
        d[i][2] = min(d[i-1][0], d[i-1][1]) + house[i][2];
    }

    printf("%d\n", min(min(d[n][0], d[n][1]), d[n][2]));

    return 0;
}