// 백준 1922 네트워크 연결
// 21.03.06
#include <iostream>
#include <algorithm>
#include <queue>
#include <vector>
#include <string>
#include <cmath>
#include <set>
#include <stack>

#define INF 1e9
#define endl "\n"

typedef long long ll;
typedef double dd;
typedef std::pair<int, int> pii;
typedef std::pair<ll, ll> pll;

using namespace std;

int n, m;
int parent[1001];
vector <pair <int, pii > > edges;

int find(int a)
{
    if (parent[a] == a) return a;
    else return parent[a] = find(parent[a]);
}

void _union(int a, int b)
{
    int x = find(a);
    int y = find(b);

    if (x < y) parent[y] = x;
    else parent[x] = y;
}

int main()
{
    scanf("%d\n%d", &n, &m);
    for (int i = 1; i <= n; ++i)
        parent[i] = i;
    for (int i = 0; i < m; ++i)
    {
        int u, v, w; scanf("%d %d %d", &u, &v, &w);
        edges.push_back({w, {u, v}});
    }
    sort(edges.begin(), edges.end());
    queue <pii> q;
    int ans = 0;

    for (int i = 0; i < m; ++i)
    {
        if (q.size() == n - 1) break;
        int u, v, w = edges[i].first;
        u = edges[i].second.first;
        v = edges[i].second.second;

        if (find(u) != find(v))
        {
            _union(u, v);
            ans += w;
            q.push({u, v});
        }
    }

    printf("%d\n", ans);

    return 0;
}