// 백준 1931 회의실 배정
// 21.02.05
#include <iostream>
#include <algorithm>
#include <queue>
#include <vector>
#include <string>
#include <cmath>
#define INF 2147000000

using namespace std;

bool compare(pair<int, int> a, pair<int, int> b)
{
    if (a.second == b.second) return a.first < b.first;
    return a.second < b.second;
}

int main()
{
    int n; scanf("%d", &n);
    vector <pair <int, int> > times;
    for (int i = 0; i < n; ++i)
    {
        int a, b; scanf("%d %d", &a, &b);
        times.push_back({a, b});
    }

    sort(times.begin(), times.end(), compare);

    int preEnd = times[0].second;
    int ans = 1;

    for (int i = 1; i < n; ++i)
    {
        if (preEnd > times[i].first) continue;
        preEnd = times[i].second;
        ++ans;
    }

    printf("%d\n", ans);

    return 0;
}