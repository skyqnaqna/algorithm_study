// 백준 14921 용액 합성하기
// 21.02.18
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
    int n; scanf("%d", &n);
    vector <int> v;
    for (int i = 0; i < n; ++i)
    {
        int a; scanf("%d", &a);
        v.push_back(a);
    }

    int l = 0, r = n - 1, ans = INF;
    while (l < r)
    {
        int temp = v[l] + v[r];
        if (abs(ans) > abs(temp)) ans = temp;

        if (temp == 0) break;
        else if (temp < 0) ++l;
        else --r;
    }

    printf("%d\n", ans);

    return 0;
}