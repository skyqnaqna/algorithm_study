/*
 21.10.22
 백준 5972 택배 배송
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

int n, m;
vector <vector <pii> > edges(50001);
vector <int> dist(50001, INF);

int main() {
    ios::sync_with_stdio(0); cin.tie(0);

    cin >> n >> m;

    for (int i = 0; i < m; ++i) {
        int a, b, c; cin >> a >> b >> c;
        edges[a].emplace_back(b, c);
        edges[b].emplace_back(a, c);
    }

    dist[1] = 0;
    priority_queue <pii> pq;
    pq.push({0, 1});

    while (!pq.empty()) {
        int cost = -pq.top().first;
        int now = pq.top().second;
        pq.pop();

        if (dist[now] < cost) continue;

        for (auto &edge : edges[now]) {
            int next = edge.first;
            int d = edge.second;

            if (cost + d < dist[next]) {
                dist[next] = cost + d;
                pq.push({-(cost + d), next});
            }
        }
    }

    cout << dist[n] << endl;

    return 0;
}