/*----------------------
|백준 1010 다리 놓기
|21.01.31
----------------------*/

#include <iostream>
#include <algorithm>
#include <queue>
#include <vector>
#include <string>
#include <cmath>
#define INF 2147000000

using namespace std;

int main()
{
    int t; scanf("%d", &t);
    int combinations[31][31] = {0};
    combinations[1][0] = 1;
    combinations[1][1] = 1;

    for (int i = 2; i < 31; ++i)
    {
        combinations[i][0] = 1;
        for (int j = 1; j < 31; ++j)
        {
            combinations[i][j] = combinations[i-1][j-1] + combinations[i-1][j];
        }
    }

    while (t--)
    {
        int n, m; scanf("%d %d", &n, &m);

        printf("%d\n", combinations[m][n]);
    }

    return 0;
}