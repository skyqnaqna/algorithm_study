/*
 21.10.22
 백준 11657 타임머신
 https://github.com/skyqnaqna/algorithm_study
 */

#include <bits/stdc++.h>

using namespace std;
using ll = long long;
using dd = double;
using pii = pair<int, int>;
using pll = pair<ll, ll>;

#define INF (int)3e9
#define endl "\n"
#define TXTOPEN freopen("input.txt", "r", stdin)

int n, m;
vector <ll> dist(501, INF);
vector <tuple<int, int, int> > edges;

int main() {
    ios::sync_with_stdio(0); cin.tie(0);

    cin >> n >> m;

    for (int i = 0; i < m; ++i) {
        int a, b, c; cin >> a >> b >> c;
        edges.emplace_back(a, b, c);
    }

    dist[1] = 0;

    for (int i = 1; i < n; ++i) {
        for (auto &edge : edges) {
            int start, end, cost;
            tie(start, end, cost) = edge;

            if (dist[start] == INF) continue;

            if (dist[start] + cost < dist[end]) {
                dist[end] = dist[start] + cost;
            }
        }
    }

    bool cycle = false;
    for (auto &edge : edges) {
        int start, end, cost;
        tie(start, end, cost) = edge;

        if (dist[start] == INF) continue;

        if (dist[start] + cost < dist[end]) {
            cycle = true;
            break;
        }
    }

    if (cycle) cout << -1 << endl;
    else {
        for (int i = 2; i <= n; ++i) {
            if (dist[i] < INF) cout << dist[i] << endl;
            else cout << -1 << endl;
        }
    }

    return 0;
}