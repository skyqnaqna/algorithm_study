// 백준 1697 숨바꼭질
// 21.03.04
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
    fill(dist, dist + 100001, -1);

    dist[n] = 0;

    queue <int> q;
    q.push(n);
    while (dist[k] == -1)
    {
        int now = q.front();
        q.pop();

        if (now - 1 >= 0 && dist[now - 1] == -1)
        {
            dist[now - 1] = dist[now] + 1;
            q.push(now - 1);
        }
        if (now + 1 < 100001 && dist[now + 1] == -1)
        {
            dist[now + 1] = dist[now] + 1;
            q.push(now + 1);
        }
        if (now * 2 < 100001 && dist[now * 2] == -1)
        {
            dist[now * 2] = dist[now] + 1;
            q.push(now * 2);
        }
    }

    printf("%d\n", dist[k]);

    return 0;
}