// 백준 6091 핑크 플로이드
// 21.03.03
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

vector <pair <int , pii> > edges;
int parent[1025];
int n;

int getParent(int a)
{
    if (parent[a] == a) return a;
    else return parent[a] = getParent(parent[a]);
}

void unionNodes(int a, int b)
{
    int x = getParent(a);
    int y = getParent(b);

    if (x < y) parent[y] = x;
    else parent[x] = y;
}


int main()
{
    scanf("%d", &n);

    for (int i = 1; i <= n; ++i)
    {
        for (int j = i + 1; j <= n; ++j)
        {
            int x; scanf("%d", &x);
            edges.push_back({x, {i, j}});
        }
        parent[i] = i;
    }

    sort(edges.begin(), edges.end(), greater<>());

    vector < vector <int> > ans (n + 1);
    queue <pii> q;

    // 선택한 간선의 수 n-1 개 구하기
    while (q.size() < n - 1)
    {
        int u, v;
        u = edges.back().second.first;
        v = edges.back().second.second;
        edges.pop_back();

        if (getParent(u) != getParent(v))
        {
            unionNodes(u, v);
            q.push({u, v});
        }
    }

    while (!q.empty())
    {
        int a = q.front().first;
        int b = q.front().second;
        q.pop();
        ans[a].push_back(b);
        ans[b].push_back(a);
    }

    for (int i = 1; i <= n; ++i)
    {
        printf("%d ", ans[i].size());
        sort(ans[i].begin(), ans[i].end());
        for (int j = 0; j < ans[i].size(); ++j)
        {
            printf("%d ", ans[i][j]);
        }
        printf("\n");
    }

    return 0;
}