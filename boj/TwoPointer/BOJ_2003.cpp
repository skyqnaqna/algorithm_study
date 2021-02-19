// 백준 2003 수들의 합 2
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
    vector <int> v;
    for (int i = 0; i < n; ++i)
    {
        int temp; scanf("%d", &temp);
        v.push_back(temp);
    }

    int p1 = 0, p2 = 0, ans = 0, a = 0;

    while (p1 < n)
    {
        if (p2 == n) a -= v[p1++];
        else if (a < m) a += v[p2++];
        else a -= v[p1++];

        if (a == m) ++ans;
    }

    printf("%d\n", ans);

    return 0;
}