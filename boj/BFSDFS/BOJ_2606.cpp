/*
 백준 2606 바이러스
 21.07.12
 https://github.com/skyqnaqna/algorithm_study
 */

#include <bits/stdc++.h>

using namespace std;

#define INF 2e9
#define endl "\n"

typedef long long ll;
typedef double dd;
typedef pair<int, int> pii;
typedef pair<ll, ll> pll;

int n, m;
bool visited[101];
vector <vector <int > > graph;


int main() {
    ios::sync_with_stdio(0); cin.tie(0);

    cin >> n >> m;

    graph.resize(n + 1);

    for (int i = 0; i < m; ++i) {
        int a, b; cin >> a >> b;
        graph[a].push_back(b);
        graph[b].push_back(a);
    }

    queue<int>q;
    q.push(1);
    visited[1] = true;
    int ans = 0;

    while (!q.empty()) {
        int now = q.front();
        q.pop();

        for (auto &next : graph[now]) {
            if (!visited[next]) {
                visited[next] = true;
                ans++;
                q.push(next);
            }
        }
    }

    cout << ans << endl;

    return 0;
}
