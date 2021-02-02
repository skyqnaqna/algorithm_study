/*----------------------
|백준 1260 DFS와 BFS
|21.01.27
----------------------*/

#include <iostream>
#include <algorithm>
#include <queue>
#include <vector>

using namespace std;

bool visit[1001];
vector < vector <int> > graph(1001);
vector <int> ans;

void DFS(int v)
{
    if (visit[v]) return;

    visit[v] = true;
    printf("%d ", v);

    for (int i = 0; i < graph[v].size(); ++i)
    {
        if (!visit[graph[v][i]]) DFS(graph[v][i]);
    }
    return;
}

void BFS(int v)
{
    queue <int> q;
    q.push(v);

    while(!q.empty())
    {
        int now = q.front();
        q.pop();
        if (visit[now]) continue;

        visit[now] = true;
        printf("%d ", now);

        for (int i = 0; i < graph[now].size(); ++i)
        {
            if (!visit[graph[now][i]])
            {
                q.push(graph[now][i]);
            }
        }
    }
}

int main()
{
    int n, m, start;
    scanf("%d %d %d", &n, &m, &start);

    for (int i = 0; i < m; ++i)
    {
        int u, v;
        scanf("%d %d", &u, &v);
        graph[u].push_back(v);
        graph[v].push_back(u);
    }

    for (int i = 1; i <= n; ++i)
        sort(graph[i].begin(), graph[i].end());

    fill_n(visit, 1001, false);
    DFS(start);
    printf("\n");

    fill_n(visit, 1001, false);
    BFS(start);
    printf("\n");

    return 0;
}