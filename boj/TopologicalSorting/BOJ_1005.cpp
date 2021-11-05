/*
 21.11.05
 백준 1005 ACM Craft
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

void input() {
    freopen("input.txt", "r", stdin);
}

int t, n, k, w;

int main() {
    ios::sync_with_stdio(0); cin.tie(0);

    cin >> t;

    while (t-->0) {
        cin >> n >> k;
        vector <ll> times(n), result(n);
        vector <int> indegree(n);
        vector <vector <int> > edges(n);

        for (int i = 0; i < n; ++i) {
            cin >> times[i];
        }

        for (int i = 0; i < k; ++i) {
            int x, y; cin >> x >> y;

            edges[--x].push_back(--y);
            ++indegree[y];
        }

        cin >> w;

        queue <int> q;
        for (int i = 0; i < n; ++i) {
            if (indegree[i] == 0) {
                q.push(i);
                result[i] = times[i];
            }
        }

        while (!q.empty()) {
            int now = q.front();
            q.pop();

            for (auto &next: edges[now]) {
                if (--indegree[next] == 0) q.push(next);
                if (result[next] < result[now] + times[next]) result[next] = result[now] + times[next];
            }
        }

        cout << result[--w] << endl;
    }

    return 0;
}