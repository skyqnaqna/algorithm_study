/*
 21.10.19
 백준 2211 네트워크 복구
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
vector <pii> answer;
vector <int> dist(1001, INF);
vector <vector <int> > path(1001);
vector <vector <pii> > edges(1001);

int main() {
    ios::sync_with_stdio(0); cin.tie(0);

    cin >> n >> m;

    for (int i = 0; i < m; ++i) {
        int a, b, c; cin >> a >> b >> c;
        edges[a].push_back({b, c});
        edges[b].push_back({a, c});
    }

    priority_queue <pii> pq;
    dist[1] = 0;
    pq.push({0, 1});

    while (!pq.empty()) {
        int cost = -pq.top().first;
        int now = pq.top().second;
        pq.pop();

        if (dist[now] < cost) continue;

        for (auto &edge : edges[now]) {
            if (cost + edge.second < dist[edge.first]) {
                dist[edge.first] = cost + edge.second;
                pq.push({-dist[edge.first], edge.first});
                path[edge.first].push_back(now);
            }
        }
    }

    for (int i = 1; i <= n; ++i) {
        if (!path[i].empty()) {
            answer.push_back({i, path[i].back()});
        }
    }

    cout << answer.size() << endl;
    for (auto & ans : answer) cout << ans.first << " " << ans.second << endl;

    return 0;
}