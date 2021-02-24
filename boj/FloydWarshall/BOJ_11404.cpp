// 백준 11404 플로이드
// 21.02.24
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
int n, m;
int graph[101][101];

int main()
{
    scanf("%d\n%d", &n, &m);

    fill(&graph[0][0], &graph[100][101], INF);

    for (int i = 0; i < m; ++i)
    {
        int u, v, w; scanf("%d %d %d", &u, &v, &w);
        graph[u][v] = min(graph[u][v], w);
    }

    for (int i = 1; i <= n; ++i)
    {
        for (int a = 1; a <= n; ++a)
        {
            for (int b = 1; b <= n; ++ b)
            {
                if (a == b || a == i || b == i) continue;
                graph[a][b] = min(graph[a][b], graph[a][i] + graph[i][b]);
            }
        }
    }

    for (int i = 1; i <= n; ++i)
    {
        for (int j = 1; j <= n; ++j)
        {
            if (graph[i][j] >= INF) printf("%d ", 0);
            else printf("%d ", graph[i][j]);
        }
        printf("\n");
    }

    return 0;
}