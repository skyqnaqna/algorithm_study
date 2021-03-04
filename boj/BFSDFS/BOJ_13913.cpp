// 백준 13913 숨바꼭질 4
// 21.03.05
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

int n, k;
int dist[100001];
int pre[100001];

int main()
{
    scanf("%d %d", &n, &k);
    fill(dist, dist + 100001, -1);

    dist[n] = 0;
    pre[n] = n;

    queue <int> q;
    q.push(n);

    while (dist[k] == -1)
    {
        int now = q.front();
        q.pop();
        int cost = dist[now] + 1;

        if (now * 2 < 100001 && dist[now * 2] == -1)
        {
            dist[now * 2] = cost;
            q.push(now * 2);
            pre[now * 2] = now;
        }
        if (now - 1 >= 0 && dist[now - 1] == -1)
        {
            dist[now - 1] = cost;
            q.push(now - 1);
            pre[now - 1] = now;
        }
        if (now + 1 < 100001 && dist[now + 1] == -1)
        {
            dist[now + 1] = cost;
            q.push(now + 1);
            pre[now + 1] = now;
        }
    }

    printf("%d\n", dist[k]);

    stack <int> s;
    s.push(k);
    int idx = k;
    while (idx != n)
    {
        s.push(pre[idx]);
        idx = pre[idx];
    }
    while (!s.empty())
    {
        printf("%d ", s.top());
        s.pop();
    }

    return 0;
}