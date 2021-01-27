/*----------------------
|백준 2644 촌수계산
|21.01.27
----------------------*/

#include <iostream>
#include <algorithm>
#include <queue>
#include <vector>

using namespace std;

int main()
{
    int n; scanf("%d", &n);
    int a, b; scanf("%d %d", &a, &b);
    int m; scanf("%d", &m);
    
    vector <vector <int> > graph(n+1);

    for (int i = 0; i < m; ++i)
    {
        int x, y; scanf("%d %d", &x, &y);
        graph[x].push_back(y);
        graph[y].push_back(x);
    }

    vector <bool> visit(n+1, false);
    vector <int> dist(n+1, -1);
    queue <int> q;
    q.push(a);
    dist[a] = 0;

    while(!q.empty())
    {
        int now = q.front();
        q.pop();

        if (visit[now]) continue;

        visit[now] = true;

        for (int i = 0; i < graph[now].size(); ++i)
        {
            int k = graph[now][i];
            if (!visit[k] && dist[k] == -1)
            {
                q.push(k);
                dist[k] = dist[now] + 1;
            }
        }
    }

    printf("%d\n", dist[b]);

    return 0;
}