// 백준 10423 전기가 부족해
// 21.03.16
#include <iostream>
#include <algorithm>
#include <queue>
#include <vector>
#include <string>
#include <cmath>
#include <set>
#include <stack>
#include <tuple>

#define INF 1e9
#define endl "\n"

typedef long long ll;
typedef double dd;
typedef std::pair<int, int> pii;
typedef std::pair<ll, ll> pll;

using namespace std;

int parent[1001];

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
    int n, m, k; scanf("%d %d %d", &n, &m, &k);
    for (int i = 1; i <= n; ++i) parent[i] = i;
    for (int i = 0; i < k; ++i)
    {
        int c; scanf("%d", &c);
        parent[c] = 0;
    }

    vector <tuple <int, int, int> >  edges;
    for (int i = 0; i < m; ++i)
    {
        int u, v, w; scanf("%d %d %d", &u, &v, &w);
        edges.emplace_back(w, u, v);
    }

    sort(edges.begin(), edges.end());
    int ans = 0, cnt = 0;
    for (int i = 0; i < m; ++i)
    {
        if (cnt == n - k) break;
        int w, u, v; tie(w, u, v) = edges[i];

        if (find(u) != find(v))
        {
            _union(u, v);
            ans += w;
            ++cnt;
        }
    }

    printf("%d\n", ans);

    return 0;
}