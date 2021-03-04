// 백준 12851 숨바꼭질 2
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

int main()
{
    scanf("%d %d", &n, &k);
    fill(dist, dist + 100001, INF);

    dist[n] = 0;

    if (n == k)
    {
        printf("%d\n%d\n", 0, 1);
        return 0;
    }

    queue <int> q;
    q.push(n);
    int cnt = 0;

    while (!q.empty())
    {
        int now = q.front();
        q.pop();
        int cost = dist[now] + 1;

        if (now - 1 >= 0 && cost <= dist[now - 1])
        {
            dist[now - 1] = cost;
            if (now - 1 == k) ++cnt;
            q.push(now - 1);
        }
        if (now + 1 < 100001 && cost <= dist[now + 1])
        {
            dist[now + 1] = cost;
            if (now + 1 == k) ++cnt;
            q.push(now + 1);
        }
        if (now * 2 < 100001 && cost <= dist[now * 2])
        {
            dist[now * 2] = cost;
            if (now * 2 == k) ++cnt;
            q.push(now * 2);
        }
    }

    printf("%d\n%d\n", dist[k], cnt);

    return 0;
}