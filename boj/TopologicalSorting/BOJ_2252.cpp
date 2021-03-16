// 백준 2252 줄 세우기
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

int indegree[32001] = { 0 };

int main()
{
    int n, m; scanf("%d %d", &n, &m);
    vector <vector <int> > edges (n + 1);

    for (int i = 0; i < m; ++i)
    {
        int u, v; scanf("%d %d", &u, &v);
        edges[u].push_back(v);
        indegree[v]++;
    }

    vector <int> ans;
    queue <int> q;
    for (int i = 1; i <= n; ++i)
    {
        if (indegree[i] == 0)
        {
            q.push(i);
            ans.push_back(i);
        }
    }

    while (!q.empty())
    {
        int now = q.front(); q.pop();

        for (auto &i : edges[now])
        {
            indegree[i]--;
            if (indegree[i] == 0)
            {
                q.push(i);
                ans.push_back(i);
            }
        }
    }

    for (auto &i : ans) printf("%d ", i);

    return 0;
}