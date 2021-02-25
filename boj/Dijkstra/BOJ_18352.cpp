// 백준 18352 특정 거리의 도시 찾기
// 21.02.25
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

int n, m, k, x;
vector < vector <int> > edges;
int dist[300001];
bool visited[300001];

int main()
{
    scanf("%d %d %d %d", &n, &m, &k, &x);
    fill(dist, dist + 300001, INF);
    fill(visited, visited + 30001, false);
    edges.resize(n + 1);

    for (int i = 0; i < m; ++i)
    {
        int u, v; scanf("%d %d", &u, &v);
        edges[u].push_back(v);
    }

    queue <int> q;
    q.push(x);
    dist[x] = 0;

    while (!q.empty())
    {
        int now = q.front();
        q.pop();
        visited[now] = true;

        for (int i = 0; i < edges[now].size(); ++i)
        {
            int next = edges[now][i];
            if (dist[now] + 1 < dist[next])
            {
                dist[next] = dist[now] + 1;
                if (!visited[next]) q.push(next);
            }
        }
    }

    bool flag = true;
    for (int i = 1; i <= n; ++i)
    {
        if (dist[i] == k)
        {
            printf("%d\n", i);
            flag = false;
        }
    }
    if (flag) printf("%d\n", -1);

    return 0;
}