/*----------------------
|백준 15686 치킨 배달
|21.02.01
----------------------*/

#include <iostream>
#include <algorithm>
#include <queue>
#include <vector>
#include <string>
#include <cmath>
#define INF 2147000000

using namespace std;

int n, m;
vector <pair <int, int> > homes;
vector <pair <bool, pair <int, int> > > chickens;
int ans = INF;

void getDistance(int cnt, int idx)
{
    if (cnt == m)
    {
        int totalDist = 0;
        for (int i = 0; i < homes.size(); ++i)
        {
            int dist = INF;
            for (int j = 0; j < chickens.size(); ++j)
            {
                if (chickens[j].first)
                {
                    int tempDist = abs(homes[i].first - chickens[j].second.first) + abs(homes[i].second- chickens[j].second.second);
                    dist = min(dist, tempDist);
                }
            }
            totalDist += dist;
        }
        ans = min(ans, totalDist);
    }

    for (int i = idx; i < chickens.size(); ++i)
    {
        if (!chickens[i].first)
        {
            chickens[i].first = true;
            getDistance(cnt + 1, i + 1);
            chickens[i].first = false;
        }
    }
}

int main()
{
    scanf("%d %d", &n, &m);

    for (int i = 0; i < n; ++i)
    {
        for (int j = 0; j < n; ++j)
        {
            int temp; scanf("%d", &temp);
            if (temp == 1) homes.push_back({i, j});
            else if (temp == 2) chickens.push_back({false, {i, j}});
        }
    }

    getDistance(0, 0);

    printf("%d\n", ans);

    return 0;
}