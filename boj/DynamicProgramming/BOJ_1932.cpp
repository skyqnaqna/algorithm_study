// 백준 1932 정수 삼각형
// 21.02.20
#include <iostream>
#include <algorithm>
#include <queue>
#include <vector>
#include <string>
#include <cmath>
#include <set>
#define INF 2147000000
#define endl "\n"

typedef long long ll;
typedef double dd;

using namespace std;

int main()
{
    int n; scanf("%d", &n);
    vector < vector <int> > v (n + 1);

    for (int i = 1; i <= n; ++i)
    {
        for (int j = 0; j < i; ++j)
        {
            int x; scanf("%d", &x);
            v[i].push_back(x);
        }
    }

    for (int i = 2; i <= n; ++i)
    {
        for (int j = 0; j < i; ++j)
        {
            if (j == 0) v[i][j] += v[i-1][j];
            else if (j == i - 1) v[i][j] += v[i-1][j-1];
            else v[i][j] += max(v[i-1][j-1], v[i-1][j]);
        }
    }

    printf("%d\n", *max_element(v[n].begin(), v[n].end()));

    return 0;
}