/*
 백준 1922 네트워크 연결
 21.07.12
 https://github.com/skyqnaqna/algorithm_study
 */

#include <bits/stdc++.h>

using namespace std;

#define INF 1e9
#define endl "\n"

typedef long long ll;
typedef double dd;
typedef pair<int, int> pii;
typedef pair<ll, ll> pll;

int n, m, parent[1001];
vector<pair <int, pii> >edges;

int findParent(int a) {
    if (parent[a] == a) return a;
    return parent[a] = findParent(parent[a]);
}

void unionParent(int a, int b) {
    int x = findParent(parent[a]);
    int y = findParent(parent[b]);

    if (x < y) parent[y] = x;
    else parent[x] = y;
}

int main()
{
    ios::sync_with_stdio(0); cin.tie(0);

    cin >> n >> m;
    for (int i = 0; i < m; ++i) {
        int a, b, c;
        cin >> a >> b >> c;

        edges.push_back({c, {a, b}});
    }

    sort(edges.begin(), edges.end());

    for (int i = 1; i <= n; ++i) {
        parent[i] = i;
    }

    int ans = 0, cnt = 0;

    for (auto &edge : edges) {
        int a = edge.second.first;
        int b = edge.second.second;

        if (findParent(a) != findParent(b)) {
            unionParent(a, b);
            ans += edge.first;
            ++cnt;
        }

        if (cnt == n -1) break;
    }

    cout << ans << endl;

    return 0;
}

