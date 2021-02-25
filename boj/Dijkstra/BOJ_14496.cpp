// 백준 14496 그대, 그머가 되어
// 21.02.26
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

int dist[1001];
bool visited[1001];

int main()
{
    int a, b; scanf("%d %d", &a, &b);
    int n, m; scanf("%d %d", &n, &m);

    vector < vector <int> > edges (n + 1);
    fill(dist, dist + 1001, INF);
    fill(visited, visited + 1001, false);

    for (int i = 0; i < m; ++i)
    {
        int u, v; scanf("%d %d", &u, &v);
        edges[u].push_back(v);
        edges[v].push_back(u);
    }

    priority_queue <int> pq;
    pq.push(a);
    dist[a] = 0;

    while (!pq.empty())
    {
        int now = pq.top();
        pq.pop();
        visited[now] = true;

        for (int i = 0; i < edges[now].size(); ++i)
        {
            int next = edges[now][i];
            if (dist[now] + 1 < dist[next])
            {
                dist[next] = dist[now] + 1;
                if (!visited[next]) pq.push(next);
            }
        }
    }

    if (dist[b] < INF) printf("%d\n", dist[b]);
    else printf("%d\n", -1);

    return 0;
}