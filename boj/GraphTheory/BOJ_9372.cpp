// 백준 9372 상근이의 여행
// 21.03.14
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

void aUnionB(int a, int b)
{
    int x = find(a);
    int y = find(b);

    if (x < y) parent[y] = x;
    else parent[x] = y;
}

int main()
{
    int t; scanf("%d", &t);

    while (t-->0)
    {
        int n, m; scanf("%d %d", &n, &m);
        for (int i = 1; i<= n; ++i)
            parent[i] = i;
        queue <pii> edges;
        for (int i = 0; i < m; ++i)
        {
            int u, v; scanf("%d %d", &u, &v);
            edges.push({u, v});
        }

        int cnt = n;
        int ans = 0;

        while (cnt >= 1 && !edges.empty())
        {
            int u, v;
            u = edges.front().first;
            v = edges.front().second;
            edges.pop();

            if (find(u) != find(v))
            {
                aUnionB(u, v);
                --cnt;
                ++ans;
            }
        }

        printf("%d\n", ans);
    }

    return 0;
}