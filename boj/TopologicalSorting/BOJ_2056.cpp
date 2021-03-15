// 백준 2056 작업
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

int indegree[10001];
int times[10001];

int main()
{
    int n; scanf("%d", &n);
    vector <int> ans (n + 1);
    vector <vector <int> > edges (n + 1);

    for (int i = 1; i <= n; ++i)
    {
        int t, m; scanf("%d %d", &t, &m);
        times[i] = ans[i] = t;
        for (int j = 0; j < m; ++j)
        {
            int pre; scanf("%d", &pre);
            edges[pre].push_back(i);
            indegree[i]++;
        }
    }

    queue <int> q;
    for (int i = 1; i <= n; ++i)
    {
        if (indegree[i] == 0) q.push(i);
    }

    while (!q.empty())
    {
        int now = q.front(); q.pop();

        for (auto &i : edges[now])
        {
            --indegree[i];
            if (ans[i] < ans[now] + times[i]) ans[i] = ans[now] + times[i];
            if (indegree[i] == 0) q.push(i);
        }
    }

    printf("%d\n", *max_element(ans.begin(), ans.end()));

    return 0;
}