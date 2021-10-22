/*
 21.10.22
 백준 11780 플로이드 2
 https://github.com/skyqnaqna/algorithm_study
 */

#include <bits/stdc++.h>

using namespace std;
using ll = long long;
using dd = double;
using pii = pair<int, int>;
using pll = pair<ll, ll>;

#define INF (ll)2e12
#define endl "\n"
#define TXTOPEN freopen("input.txt", "r", stdin)

int n, m;
vector <vector <ll> > dist(101, vector <ll> (101, INF));
vector <vector <pii> > edges(101);
vector <vector <vector <int> > > paths(101, vector <vector <int> > (101));

void dijkstra(int start) {
    priority_queue <pii> pq;
    vector <int> path(n + 1);
    pq.push({0, start});

    while (!pq.empty()) {
        int cost = -pq.top().first;
        int now = pq.top().second;
        path.emplace_back(now);
        pq.pop();

        if (dist[start][now] < cost) continue;

        for (auto &edge : edges[now]) {
            int next = edge.first;
            int d = edge.second;

            if (now == next || next == start) continue;

            if (cost + d < dist[start][next]) {
                dist[start][next] = cost + d;
                pq.push({-(cost + d), next});
//                paths[start][next] = path;
                path[next] = now;
                int pre = next;
                stack <int> st;
                st.push(pre);

                while (pre != start) {
                    st.push(path[pre]);
                    pre = path[pre];
                }

                paths[start][next].clear();
                while (!st.empty()) {
                    paths[start][next].emplace_back(st.top());
                    st.pop();
                }
            }
        }
    }
}

int main() {
    ios::sync_with_stdio(0); cin.tie(0);

    cin >> n >> m;

    for (int i = 0; i < m; ++i) {
        int a, b, c; cin >> a >> b >> c;

//        dist[a][b] = c;
        edges[a].emplace_back(b, c);
    }

    for (int i = 1; i <= n; ++i) {
        dijkstra(i);
    }

    for (int i = 1; i <= n; ++i) {
        for (int j = 1; j <= n; ++j) {
            if (dist[i][j] == INF) cout << 0 << " ";
            else cout << dist[i][j] << " ";
        }
        cout << endl;
    }

    for (int i = 1; i <= n; ++i) {
        for (int j = 1; j <= n; ++j) {
            if (paths[i][j].size()) {
                cout << paths[i][j].size() << " ";
                for (auto &it : paths[i][j]) {
                    cout << it << " ";
                }
                cout << endl;
            } else {
                cout << 0 << endl;
            }
        }
    }

    return 0;
}