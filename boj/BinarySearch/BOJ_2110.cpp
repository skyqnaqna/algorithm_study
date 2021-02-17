// 백준 2110 공유기 설치
// 21.02.17
#include <iostream>
#include <algorithm>
#include <queue>
#include <vector>
#include <string>
#include <cmath>
#include <set>
#define INF 2147000000

typedef long long ll;

using namespace std;

int main()
{
    int n, c; scanf("%d %d", &n, &c);
    vector <int> house;
    for (int i = 0; i < n; ++i)
    {
        int x; scanf("%d", &x);
        house.push_back(x);
    }
    sort(house.begin(), house.end());

    // 집 사이의 거리를 기준으로 탐색
    int l = 0, r = house[n - 1]  - house[0];
    int m = (l + r) / 2;
    int ans = 0;

    while (l <= r)
    {
        int cnt = 1;
        int pre = house[0];
        for (auto &next : house)
        {
            if (next - pre >= m)
            {
                ++cnt;
                pre = next;
            }
        }

        if (cnt >= c)
        {
            ans = max(ans, m);
            l = m + 1;
        }
        else r = m - 1;

        m = (l + r) / 2;
    }

    printf("%d\n", ans);

    return 0;
}