/*
 백준 20007 떡 돌리기
 21.10.15
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

const int MAX = 1000;

int n, m, x, y;
vector <vector <pii> > edges(MAX);

int main() {
    ios::sync_with_stdio(0); cin.tie(0);
//    freopen("input.txt", "r", stdin);

    cin >> n >> m >> x >> y;

    x >>= 1;

    for (int i = 0; i < m; ++i) {
        int a, b, c; cin >> a >> b >> c;

        edges[a].push_back({b, c});
        edges[b].push_back({a, c});
    }

    vector <int> dist(n, INF);

    dist[y] = 0;

    priority_queue <pii> pq;
    pq.push({0, y});

    while (!pq.empty()) {
        int cost = -pq.top().first;
        int now = pq.top().second;
        pq.pop();

        if (dist[now] < cost) continue;

        for (auto &node : edges[now]) {
            int next = node.first;
            int d = node.second;

            if (cost + d < dist[next]) {
                dist[next] = cost + d;
                pq.push({-(cost + d), next});
            }
        }
    }

    int total = 0, answer = 0;
    sort(dist.begin(), dist.end());

    for (auto &d : dist) {
        if (d > x) {
            cout << -1 << endl;
            return 0;
        }

        if (total + d > x) {
            ++answer;
            total = 0;
        }

        total += d;
    }

    if (total) ++answer;

    cout << answer << endl;

    return 0;
}