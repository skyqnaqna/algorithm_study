// 백준 11779 최소비용 구하기 2
// 21.03.26
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

int dist[1001];
int pre[1001];
int n, m, s, e;
vector < vector <pii> > graph;

int main()
{
    scanf("%d\n%d", &n, &m);
    graph.resize(n + 1);

    for (int i = 0; i < m; ++i)
    {
        int u, v, w; scanf("%d %d %d", &u, &v, &w);
        graph[u].push_back({v, w});
    }
    scanf("%d %d", &s, &e);

    fill(dist, dist + 1001, INF);

    // 비용, 도시
    priority_queue <pii, vector<pii>, greater<> > q;
    dist[s] = 0;
    pre[s] = s;
    q.push({0, s});

    while (!q.empty())
    {
        int now = q.top().second;
        int cost = q.top().first;
        q.pop();

        if (dist[now] < cost) continue;

        for (int i = 0; i < graph[now].size(); ++i)
        {
            int next = graph[now][i].first;
            int nextCost = graph[now][i].second;

            // 같을 때는 무시 (모든 경로가 0일 때 생각)
            if (cost + nextCost < dist[next])
            {
                dist[next] = cost + nextCost;
                q.push({cost+nextCost, next});
                pre[next] = now;
            }
        }
    }

    printf("%d\n", dist[e]);
    int idx = e;
    stack <int> st;
    st.push(e);
    while (1)
    {
        st.push(pre[idx]);
        if (pre[idx] == s) break;
        idx = pre[idx];
    }

    printf("%d\n", st.size());
    while (!st.empty())
    {
        printf("%d ", st.top());
        st.pop();
    }
    printf("\n");

    return 0;
}