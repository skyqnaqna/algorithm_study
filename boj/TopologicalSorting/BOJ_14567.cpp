// 백준 14567 선수과목
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

int main()
{
    int n, m; scanf("%d %d", &n, &m);
    vector <int> ans (n + 1, 1);
    vector <int> indegree (n + 1, 0);
    vector <vector <int> > edges (n + 1);

    for (int i = 0; i < m; ++i)
    {
        int u, v; scanf("%d %d", &u, &v);
        edges[u].push_back(v);
        indegree[v]++;
    }

    queue <int> q;
    for (int i = 1; i <= n; ++i)
    {
        if (indegree[i] == 0) q.push(i);
    }

    while (!q.empty())
    {
        int now = q.front(); q.pop();

        for (int i = 0; i < edges[now].size(); ++i)
        {
            indegree[edges[now][i]]--;
            if (indegree[edges[now][i]] == 0)
            {
                q.push(edges[now][i]);
                if (ans[edges[now][i]] < ans[now] + 1) ans[edges[now][i]] = ans[now] + 1;
            }
        }
    }

    for (int i = 1; i <= n; ++i)
    {
        printf("%d ", ans[i]);
    }

    return 0;
}