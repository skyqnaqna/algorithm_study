/*
 백준 21924 도시 건설
 21.08.21
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

int n, m, parent[100001];
ll ans;
vector <pair <ll, pii> > edges;

int findParent(int idx) {
    if (idx != parent[idx]) {
        return parent[idx] = findParent(parent[idx]);
    } else return idx;
}

void unionParent(int a, int b) {
    int x = findParent(a);
    int y = findParent(b);

    if (x < y) {
        parent[y] = x;
    } else {
        parent[x] = y;
    }
}

int main() {
    ios::sync_with_stdio(0); cin.tie(0);
    freopen("input.txt", "r", stdin);

    cin >> n >> m;

    for (int i = 1; i <= n; ++i) parent[i] = i;

    while (m-->0) {
        int a, b;
        ll w;
        cin >> a >> b >> w;

        edges.push_back({w, {a, b}});
        ans += w;
    }

    int cnt = 0;
    sort(edges.begin(), edges.end());

    for (auto &edge : edges) {
        if (findParent(edge.second.first) != findParent(edge.second.second)) {
            unionParent(edge.second.first, edge.second.second);
            ans -= edge.first;
            ++cnt;
        }
    }

    if (cnt != n - 1) cout << - 1 << endl;
    else cout << ans << endl;

    return 0;
}