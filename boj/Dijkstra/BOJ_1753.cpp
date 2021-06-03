/*
 백준 1753 최단경로
 21.06.03
 https://github.com/skyqnaqna/algorithm_study
 */

#include <iostream>
#include <cstdio>
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

vector<vector<pii> >edges;
int dist[20001];

int main()
{
    int v, e, k; scanf("%d %d", &v, &e);
    scanf("%d", &k);

    fill(dist, dist + v + 1, INF);
    edges.resize(v + 1);

    for (int i = 0; i < e; ++i)
    {
        int u, v, w; scanf("%d %d %d", &u, &v, &w);
        edges[u].push_back({-w, v});
    }

    priority_queue<pii> pq;
    dist[k] = 0;
    pq.push({0, k});

    while (!pq.empty())
    {
        int now = pq.top().second;
        int cost = -pq.top().first;
        pq.pop();

        if (dist[now] < cost) continue;

        for (auto & edge : edges[now])
        {
            int next = edge.second;
            int weight = -edge.first;

            if (cost + weight < dist[next])
            {
                dist[next] = cost + weight;
                pq.push({-dist[next], next});
            }
        }
    }

    for (int i = 1; i <= v; ++i)
    {
        if (dist[i] < INF) printf("%d\n", dist[i]);
        else printf("INF\n");
    }

    return 0;
}