// 백준 1026 보물
// 21.02.07
#include <iostream>
#include <algorithm>
#include <queue>
#include <vector>
#include <string>
#include <cmath>
#define INF 2147000000

typedef long long ll;

using namespace std;

int main()
{
    int n; scanf("%d", &n);

    vector <int> a, b;
    for (int i = 0; i < n; ++i)
    {
        int c; scanf("%d", &c);
        a.push_back(c);
    }
    for (int i = 0; i < n; ++i)
    {
        int c; scanf("%d", &c);
        b.push_back(c);
    }
    sort(a.begin(), a.end());
    sort(b.begin(), b.end(), greater<>());

    int ans = 0;
    for (int i = 0; i < n; ++i)
        ans += a[i] * b[i];
    printf("%d\n", ans);

    return 0;
}