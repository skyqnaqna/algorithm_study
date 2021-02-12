// 백준 1822 차집합
// 21.02.12
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

int n, m;
vector <int> a, b, c;

bool findNum(int target)
{
    int left = 0, right = b.size() - 1;
    int mid = (left + right) / 2;

    while (left <= right)
    {
        if (b[mid] == target) return true;

        if (b[mid] < target) left = mid + 1;
        else right = mid - 1;

        mid = (left + right) / 2;
    }
    return false;
}

int main()
{
    scanf("%d %d", &n, &m);

    for (int i = 0; i < n; ++i)
    {
        int x; scanf("%d", &x);
        a.push_back(x);
    }

    for (int i = 0; i < m; ++i)
    {
        int x; scanf("%d", &x);
        b.push_back(x);
    }

    sort(a.begin(), a.end());
    sort(b.begin(), b.end());

    for (auto &i : a)
    {
        if (!findNum(i)) c.push_back(i);
    }

    if (!c.empty())
    {
        printf("%ld\n", c.size());
        for (auto &i : c)
            printf("%d ", i);
        printf("\n");
    }
    else printf("%d\n", 0);

    return 0;
}