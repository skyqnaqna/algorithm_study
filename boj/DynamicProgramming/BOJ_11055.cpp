// 백준 11055 가장 큰 증가 부분 수열
// 21.02.21
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

int arr[1001];
int d[1001];

int main()
{
    int n; scanf("%d", &n);
    for (int i = 0; i < n; ++i)
    {
        scanf("%d", &arr[i]);
    }

    fill(d, d + 1001, 0);

    d[0] = arr[0];
    for (int i = 1; i < n; ++i)
    {
        int m = 0;
        for (int j = i - 1; j >= 0; --j)
        {
            if (arr[j] < arr[i]) m = max(m, d[j]);
        }
        d[i] = arr[i] + m;
    }

    int ans = 0;
    for (int i = 0; i < n; ++i)
    {
        ans = max(ans, d[i]);
    }

    printf("%d\n", ans);

    return 0;
}