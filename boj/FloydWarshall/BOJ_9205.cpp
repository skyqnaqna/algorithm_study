// 백준 9205 맥주 마시면서 걸어가기
// 21.02.26
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

int getManhattan(pii a, pii b)
{
    int ax = a.first, ay = a.second;
    int bx = b.first, by = b.second;

    return (abs(ax - bx) + abs(ay - by));
}

int main()
{
    int t; scanf("%d", &t);

    while (t-->0)
    {
        int n; scanf("%d", &n);
        vector <vector <int> > dist(n + 2, vector<int>(n + 2, INF));
        vector <pii> pos;
        for (int i = 0; i < n + 2; ++i)
        {
            int x, y; scanf("%d %d", &x, &y);
            pos.push_back({x, y});
        }

        // 갈 수 있는 거리 먼저 구하기
        for (int i = 0; i < n + 2; ++i)
        {
            for (int j = 0; j < n + 2; ++j)
            {
                if (i == j) continue;
                if (getManhattan(pos[i], pos[j]) <= 1000) dist[i][j] = getManhattan(pos[i], pos[j]);
            }
        }

        for (int k = 1; k < n + 2; ++k) // 무조건 0에서 출발하니까 k = 1 부터
        {
            for (int i = 0; i < n + 2; ++i)
            {
                for (int j = 0; j < n + 2; ++j)
                {
                    if (i == j || i == k || j == k) continue;
                    dist[i][j] = min(dist[i][j], dist[i][k] + dist[k][j]);
                }
            }
        }

        if (dist[0][n+1] < INF) printf("happy\n");
        else printf("sad\n");
    }
    return 0;
}