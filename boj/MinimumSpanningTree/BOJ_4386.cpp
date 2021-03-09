// 백준 4386 별자리 만들기
// 21.03.09
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

vector <pair <dd, dd> > stars;
vector <pair <dd, pair <dd, dd> > > edges;
int root[100];

dd getDist(int a, int b)
{
    dd ax, ay, bx, by;
    ax = stars[a].first;
    ay = stars[a].second;
    bx = stars[b].first;
    by = stars[b].second;

    return sqrt(pow(ax - bx, 2.0) + pow(ay - by, 2.0));
}

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
        dd x, y; scanf("%lf %lf", &x, &y);
        stars.push_back({x, y});
        root[i] = i;
    }

    for (int i = 0; i < n - 1; ++i)
    {
        for (int j = i + 1; j < n; ++j)
        {
            dd dist = getDist(i, j);
            edges.push_back({dist, {i, j}});
        }
    }

    sort(edges.begin(), edges.end());

    vector <dd> ans;

    dd sum = 0;
    for (int i = 0; i < edges.size(); ++i)
    {
        if (ans.size() == n - 1) break;
        int x = edges[i].second.first;
        int y = edges[i].second.second;
        if (find(x) != find(y))
        {
            unionStar(x, y);
            ans.push_back(edges[i].first);
            sum += edges[i].first;
        }
    }

    printf("%.2f\n", sum);

    return 0;
}