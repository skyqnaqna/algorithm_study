// 백준 2887 행성 터널
// 21.03.11
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

vector <pii> x, y, z;
vector <tuple <int, int, int> > edges;
int root[100000];

int find(int a)
{
    if (root[a] == a) return a;
    else return root[a] = find(root[a]);
}

void unionStar(int a, int b)
{
    int x = find(a);
    int y = find(b);

    if (x < y) root[y] = x;
    else root[x] = y;
}

int main()
{
    int n; scanf("%d", &n);
    for (int i = 0; i < n; ++i)
    {
        int a, b, c; scanf("%d %d %d", &a, &b, &c);
        x.push_back({a, i});
        y.push_back({b, i});
        z.push_back({c, i});
        root[i] = i;
    }

    sort(x.begin(), x.end());
    sort(y.begin(), y.end());
    sort(z.begin(), z.end());

    for (int i = 1; i < n; ++i)
    {
        edges.emplace_back(abs(x[i].first - x[i-1].first), x[i-1].second, x[i].second);
        edges.emplace_back(abs(y[i].first - y[i-1].first), y[i-1].second, y[i].second);
        edges.emplace_back(abs(z[i].first - z[i-1].first), z[i-1].second, z[i].second);
    }

    sort(edges.begin(), edges.end());

    vector <int> ans;

    int sum = 0;
    for (int i = 0; i < edges.size(); ++i)
    {
        if (ans.size() == n - 1) break;
        int dist, u, v;
        tie(dist, u, v) = edges[i];
        if (find(u) != find(v))
        {
            unionStar(u, v);
            sum += dist;
            ans.push_back(dist);
        }
    }

    printf("%d\n", sum);

    return 0;
}