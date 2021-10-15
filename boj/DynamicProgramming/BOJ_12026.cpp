/*
 21.10.15
 백준 12026 BOJ 거리
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

int n;
vector <vector <int> > boj(3);

int main() {
    ios::sync_with_stdio(0); cin.tie(0);

    cin >> n;
    string s; cin >> s;

    vector <int> dist(n, INF);

    for (int i = 0; i < n; ++i) {
        if (s[i] == 'B') boj[0].push_back(i);
        else if (s[i] == 'O') boj[1].push_back(i);
        else boj[2].push_back(i);
    }

    dist[0] = 0;
    queue <pii> q;
    q.push({0, 0});

    while (!q.empty()) {
        int now = q.front().first;
        int type = q.front().second;
        q.pop();

        int next = (type + 1) % 3;

        for (auto &idx : boj[next]) {
            if (now < idx && pow(idx - now, 2) + dist[now] < dist[idx]) {
                dist[idx] = pow(idx - now, 2) + dist[now];
                q.push({idx, next});
            }
        }
    }

    if (dist[n-1] < INF) cout << dist[n-1] << endl;
    else cout << -1 << endl;

    return 0;
}