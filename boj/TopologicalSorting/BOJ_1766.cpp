/*
 21.10.21
 백준 1766 문제집
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

int n, m, indegree[32001];
vector <vector <int> > edges(32001);
vector <int> answer;

int main() {
    ios::sync_with_stdio(0); cin.tie(0);

    cin >> n >> m;

    for (int i = 0; i < m; ++i) {
        int a, b; cin >> a >> b;
        edges[a].push_back(b);
        ++indegree[b];
    }

    priority_queue <int> pq;

    for (int i = 1; i <= n; ++i) {
        if (indegree[i] == 0) pq.push(-i);
    }

    while (!pq.empty()) {
        int now = -pq.top();
        pq.pop();

        answer.push_back(now);

        for (auto &next : edges[now]) {
            if (--indegree[next] == 0) {
                pq.push(-next);
            }
        }
    }

    for (auto &ans : answer) cout << ans << " ";

    return 0;
}