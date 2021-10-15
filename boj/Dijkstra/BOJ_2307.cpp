/*
 21.10.16
 백준 2307 도로검문
 https://github.com/skyqnaqna/algorithm_study
 */

#include <bits/stdc++.h>

using namespace std;
using ll = long long;
using dd = double;
using pii = pair<int, int>;
using pll = pair<ll, ll>;

#define INF (int)2e9
#define endl "\n"
#define TXTOPEN freopen("input.txt", "r", stdin)

const int MAX = 1001;

int n, m, path[MAX];
vector <vector <pii> > edges(MAX);

int dijkstra(int u, int v) {
//    int save = graph[u][v];

//    graph[u][v] = graph[v][u] = INF;
    vector <int> dist(n+1, INF);
    dist[1] = 0;
    priority_queue <pii> pq;
    pq.push({0, 1});

    while (!pq.empty()) {
        int now = pq.top().second;
        int cost = -pq.top().first;
        pq.pop();

        if (dist[now] < cost) continue;

        for (auto &edge : edges[now]) {
            int next = edge.first;
            int d = edge.second;

            if ((next == u && now == v) || (next == v && now == u)) continue;

            if (cost + d < dist[next]) {
                dist[next] = cost + d;
                pq.push({-(cost + d), next});
                path[next] = now;
            }
        }
    }

    return dist[n];
}

int main() {
    ios::sync_with_stdio(0); cin.tie(0);

    cin >> n >> m;

    for (int i = 0; i < m; ++i) {
        int a, b, t; cin >> a >> b >> t;
        edges[a].push_back({b, t});
        edges[b].push_back({a, t});
    }

    int minTime = dijkstra(0, 0);
    vector <pii> candidates;

    int pre = n;
    while (pre != 1) {
        candidates.push_back({path[pre], pre});
        pre = path[pre];
    }

    int answer = 0;
    for (auto &candidate : candidates) {
        int res = dijkstra(candidate.first, candidate.second);

        if (res == INF) {
            answer = -1;
            break;
        }

        if (minTime < res) {
            answer = max(answer, res - minTime);
        }
    }

    cout << answer << endl;

    return 0;
}