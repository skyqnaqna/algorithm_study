// 백준 1854 K번째 최단경로 찾기
// 21.03.03
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

int n, m, k;
vector < priority_queue<int> > dist (1001);
vector < vector <pii> > edges;

int main()
{
    scanf("%d %d %d", &n, &m, &k);
    edges.resize(n + 1);
    for (int i = 0; i < m; ++i)
    {
        int u, v, w; scanf("%d %d %d", &u, &v, &w);
        edges[u].push_back({v, w});
    }

    priority_queue<pii, vector<pii>, greater<> > q;
    q.push({0, 1}); // 비용, 정점
    dist[1].push(0);
    while (!q.empty())
    {
        int now = q.top().second;
        int cost = q.top().first;
        q.pop();

        for (int i = 0; i < edges[now].size(); ++i)
        {
            int next = edges[now][i].first;
            int nextCost = edges[now][i].second;

            if (dist[next].size() < k)
            {
                dist[next].push(cost + nextCost);
                q.push({cost + nextCost, next});
            }
            else if (dist[next].top() > cost + nextCost)
            {
                dist[next].pop();
                dist[next].push(cost + nextCost);
                // K 번째 최단 경로가 새로 갱신되면 다른 노드들의 최단 경로에도 영향을 주기 때문에
                // 큐에 넣고 최신화할 것
                q.push({cost + nextCost, next});
            }
        }
    }

    for (int i = 1; i <= n; ++i)
    {
        if (dist[i].size() < k) printf("%d\n", -1);
        else printf("%d\n", dist[i].top());
    }

    return 0;
}