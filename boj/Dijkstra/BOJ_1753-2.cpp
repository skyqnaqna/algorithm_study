/*
 백준 1753 최단경로
 21.07.13
 https://github.com/skyqnaqna/algorithm_study
 */

#include <bits/stdc++.h>

using namespace std;

#define INF 1e9
#define endl "\n"

typedef long long ll;
typedef double dd;
typedef pair<int, int> pii;
typedef pair<ll, ll> pll;

const int MAX = 20001;

int n, m, k, dist[MAX];
vector <vector <pii> > edges(MAX);

int main()
{
    ios::sync_with_stdio(0); cin.tie(0);

    cin >> n >> m;
    cin >> k;

    for (int i = 0; i < m; ++i) {
        int u, v, w;
        cin >> u >> v >> w;

        edges[u].push_back({v, w});
    }

    fill(dist, dist + n + 1, INF);

    priority_queue<pii>pq;
    dist[k] = 0;
    pq.push({0, k});

    while (!pq.empty()) {
        int now = pq.top().second;
        int nowDist = -pq.top().first;
        pq.pop();

        if (dist[now] < nowDist) continue;

        for (auto &i: edges[now]) {
            int next = i.first;
            int cost = i.second;

            if (nowDist + cost < dist[next]) {
                dist[next] = nowDist + cost;
                pq.push({-dist[next], next});
            }
        }
    }

    for (int i = 1; i <= n; ++i) {
        if (dist[i] == INF) cout << "INF\n";
        else cout << dist[i] << endl;
    }

    return 0;
}
