/*----------------------
|백준 1018 체스판 다시 칠하기
|21.01.29
----------------------*/

#include <iostream>
#include <algorithm>
#include <queue>
#include <vector>
#include <string>
#include <cmath>
#define INF 2147000000

using namespace std;

char graph[50][50];

int main()
{
    int n, m; scanf("%d %d", &n, &m);

    for (int i = 0; i < n; ++i)
    {
        scanf("%s", graph[i]);
    }

    int ans = INF;
    for (int i = 0; i < n - 7; ++i)
    {
        for (int j = 0; j < m - 7; ++j)
        {
            int w(0), b(0);
            for (int r = i; r < i + 8; ++r)
            {
                for (int c = j; c < j + 8; ++c)
                {
                    if ((r+c) % 2 == 0)
                    {
                        if (graph[r][c] == 'B') ++w;
                        else ++b;
                    }
                    else
                    {
                        if (graph[r][c] == 'W') ++w;
                        else ++b;
                    }
                }
            }
            ans = min(ans, w);
            ans = min(ans, b);
        }
    }

    printf("%d\n", ans);
    
    return 0;
}