// 백준 1006 습격자 초라기
// 21.02.22
#include <iostream>
#include <algorithm>
#include <queue>
#include <vector>
#include <string>
#include <cmath>
#include <set>
#include <stack>

#define INF 2147000000
#define endl "\n"

typedef long long ll;
typedef double dd;
typedef std::pair<int ,int> pii;

using namespace std;

int e[10000][2], a[10001], b[10000], c[10000];
int n, w;

void solve(int start)
{
    for (int i = start; i < n; ++i)
    {
        a[i + 1] = min(b[i] + 1, c[i] + 1);
        if (e[i][0] + e[i][1] <= w)
            a[i + 1] = min(a[i + 1], a[i] + 1);
        if (i > 0 && e[i - 1][0] + e[i][0] <= w && e[i - 1][1] + e[i][1] <= w)
            a[i + 1] = min(a[i + 1], a[i - 1] + 2);
        if (i < n - 1)
        {
            b[i + 1] = a[i + 1] + 1;
            if (e[i][0] + e[i + 1][0] <= w)
                b[i + 1] = min(b[i + 1], c[i] + 1);
            c[i + 1] = a[i + 1] + 1;
            if (e[i][1] + e[i + 1][1] <= w)
                c[i + 1] = min(c[i + 1], b[i] + 1);
        }
    }
}

int main()
{
    int t; scanf("%d", &t);

    while (t-->0)
    {
        scanf("%d %d", &n, &w);
        for (int i = 0; i < n; ++i)
            scanf("%d", &e[i][0]);
        for (int i = 0; i < n; ++i)
            scanf("%d", &e[i][1]);

        a[0] = 0;
        b[0] = c[0] = 1;
        solve(0);
        int ans = 2*n;
        ans = min(ans, a[n]);

        if (n > 1 && e[0][0] + e[n - 1][0] <= w)
        {
            a[1] = 1;
            b[1] = 2;
            c[1] = e[0][1] + e[1][1] <= w ? 1 : 2;
            solve(1);
            ans = min(ans, c[n - 1] + 1);
        }
        if (n > 1 && e[0][1] + e[n - 1][1] <= w)
        {
            a[1] = 1;
            b[1] = e[0][0] + e[1][0] <= w ? 1 : 2;
            c[1] = 2;
            solve(1);
            ans = min(ans, b[n - 1] + 1);
        }
        if (n > 1 && e[0][0] + e[n - 1][0] <= w && e[0][1] + e[n - 1][1] <= w)
        {
            a[1] = 0;
            b[1] = c[1] = 1;
            solve(1);
            ans = min(ans, a[n - 1] + 2);
        }

        printf("%d\n", ans);
    }

    return 0;
}