// 백준 3098 소셜네트워크
// 21.03.16
#include <iostream>
#include <algorithm>
#include <queue>
#include <vector>
#include <string>
#include <cmath>
#include <set>
#include <stack>
#include <tuple>

#define INF 1e9
#define endl "\n"

typedef long long ll;
typedef double dd;
typedef std::pair<int, int> pii;
typedef std::pair<ll, ll> pll;

using namespace std;

int graph[51][51];
int days[51] = { 0 };

int main()
{
    int n, m; scanf("%d %d", &n, &m);
    fill(&graph[1][1], &graph[n][n + 1], INF);
    int cnt = m;
    int day = 1;
    for (int i = 0; i < m; ++i)
    {
        int a, b; scanf("%d %d", &a, &b);
        graph[a][b] = graph[b][a] = 0;
    }

    while (cnt < n*(n-1)/2)
    {
        for (int k = 1; k <= n; ++k)
        {
            for (int i = 1; i <= n; ++i)
            {
                for (int j = 1; j <= n; ++j)
                {
                    if (i == j || i == k || j == k) continue;
                    if (graph[i][j] == INF && graph[i][k] < day && graph[k][j] < day)
                    {
                        graph[i][j] = graph[j][i] = day;
                        ++days[day];
                        ++cnt;
                    }
                }
            }
        }
        ++day;
    }
    printf("%d\n", day - 1);
    for (int i = 1; i < day; ++i)
    {
        printf("%d\n", days[i]);
    }

    return 0;
}