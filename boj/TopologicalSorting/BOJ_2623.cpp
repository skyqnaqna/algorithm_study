// 백준 2623 음악프로그램
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

int indegree[1001] = { 0 };

int main()
{
    int n, m; scanf("%d %d", &n, &m);
    vector <vector <int> > edges (n + 1);
    for (int i = 0; i < m; ++i)
    {
        int k; scanf("%d", &k);
        vector <int> v;
        for (int j = 0; j < k; ++j)
        {
            int t; scanf("%d", &t);
            v.push_back(t);
        }
        for (int l = 1; l < k; ++l)
        {
            indegree[v[l]]++;
            edges[v[l-1]].push_back(v[l]);
        }
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

    if (ans.size() < n) printf("%d\n", 0);
    else
        for (auto &i : ans) printf("%d\n", i);

    return 0;
}