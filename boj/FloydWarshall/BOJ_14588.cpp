// 백준 14588 Line Friends (Small)
// 21.02.27
#include <iostream>
#include <algorithm>
#include <queue>
#include <vector>
#include <string>
#include <cmath>
#include <set>
#include <stack>

#define INF 1e9
#define endl "\n"

typedef long long ll;
typedef double dd;
typedef std::pair<int, int> pii;
typedef std::pair<ll, ll> pll;

using namespace std;

int dist[301][301];
pii edges[301];

int main()
{
    int n; scanf("%d", &n);
    for (int i = 1; i <= n; ++i)
    {
        scanf("%d %d", &edges[i].first, &edges[i].second);
    }
    fill(&dist[0][0], &dist[300][301], INF);

    for (int i = 1; i <= n; ++i)
    {
        int l1 = edges[i].first;
        int r1 = edges[i].second;
        for (int j = 1; j <= n; ++j)
        {
            if (i == j) continue;
            int l2 = edges[j].first;
            int r2 = edges[j].second;

            // 1번이 왼쪽에 있을 때 기준 / 1번이 오른쪽에 있을 때 기준
            if ((l1 <= l2 && r1 >= l2) || (r1 >= r2 && l1 <= r2))
            {
                dist[i][j] = dist[j][i] = 1;
            }
        }
    }

    for (int k = 1; k <= n; ++k)
    {
        for (int i = 1; i <= n; ++i)
        {
            for (int j = 1; j <= n; ++j)
            {
                if (i == j || i == k || j == k) continue;
                dist[i][j] = min(dist[i][j], dist[i][k] + dist[k][j]);
            }
        }
    }

    int q; scanf("%d", &q);
    for (int i = 0; i < q; ++i)
    {
        int a, b; scanf("%d %d", &a, &b);
        if (dist[a][b] < INF) printf("%d\n", dist[a][b]);
        else printf("%d\n", -1);
    }

    return 0;
}