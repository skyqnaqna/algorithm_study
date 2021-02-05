// 백준 2910 빈도 정렬
// 21.02.06
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
    return a.first > b.first;
}

int main()
{
    int n, c; scanf("%d %d", &n, &c);
    vector <int> input;
    for (int i = 0; i < n; ++i)
    {
        int a; scanf("%d", &a);
        input.push_back(a);
    }

    vector < pair <int, int> > ans;
    ans.push_back({1, input[0]});

    for (int i = 1; i < n; ++i)
    {
        bool exist = false;
        for (int j = 0; j < ans.size(); ++j)
        {
            if (input[i] == ans[j].second)
            {
                ans[j].first++;
                exist = true;
                break;
            }
        }
        if (!exist) ans.push_back({1, input[i]});
    }

    stable_sort(ans.begin(), ans.end(), compare);

    for (int i = 0; i < ans.size(); ++i)
    {
        for (int j = 0; j < ans[i].first; ++j)
        {
            printf("%d ", ans[i].second);
        }
    }
    printf("\n");

    return 0;
}