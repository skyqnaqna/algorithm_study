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

int dist[10001];
bool check[10001];
vector < vector <pair <int, int> > > graph;

int main()
{
    int n, m; scanf("%d %d", &n, &m);
    fill(dist, dist + 10001, -1);
    fill(check, check + 10001, false);

    graph.resize(n + 1);

    for (int i = 0; i < m; ++i)
    {
        int u, v, w;
        scanf("%d %d %d", &u, &v, &w);
        graph[u].push_back({v, w});
        graph[v].push_back({u, w});
    }

    dist[1] = 0;
    queue <int> q;
    q.push(1);
    while (!q.empty())
    {
        int now = q.front();
        q.pop();
        check[now] = true;

        for(int i = 0; i < graph[now].size(); ++i)
        {
            int mid = graph[now][i].first;
            int cost = graph[now][i].second + dist[now];

            if (check[mid]) continue;
            check[mid] = true;

            for (int j = 0; j < graph[mid].size(); ++j)
            {
                int next = graph[mid][j].first;
                int cost2 = cost + graph[mid][j].second;
                if (next == now) continue;
                if (check[next]) continue;
                check[next] = true;

                int real = pow(cost2, 2);

                if (dist[next] == -1)
                {
                    q.push(next);
                    dist[next] = real;
                }
                else if (dist[next] > real)
                {
                    q.push(next);
                    dist[next] = real;
                }
                check[next] = false;
            }
            check[mid] = false;
        }
        check[now] = false;

    }

    for (int i = 1; i <= n; ++i)
    {
        printf("%d ", dist[i]);
    }

    return 0;
}