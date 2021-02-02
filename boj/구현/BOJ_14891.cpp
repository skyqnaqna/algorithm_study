/*----------------------
|백준 14891 톱니바퀴
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

int wheels[5][8];

void rotate(int row, int direction)
{
    if (direction == -1) // 반시계 방향
    {
        int temp = wheels[row][0];
        for (int i = 1; i < 8; ++i)
            wheels[row][i-1] = wheels[row][i];
        wheels[row][7] = temp;
    }
    else if (direction == 1) // 시계 방향
    {
        int temp = wheels[row][7];
        for (int i = 6; i >= 0; --i)
            wheels[row][i+1] = wheels[row][i];
        wheels[row][0] = temp;
    }
}

int main()
{
    for (int i = 1; i < 5; ++i)
        for (int j = 0; j < 8; ++j)
            scanf("%1d", &wheels[i][j]);
    
    int t; scanf("%d", &t);

    while(t)
    {
        --t;
        int wh, di; scanf("%d %d", &wh, &di);
        int check[5] = {0};
        check[wh] = di;
        for (int i = wh; i < 4; ++i)
        {
            if (check[i] != 0 && wheels[i][2] != wheels[i+1][6])
            {
                check[i+1] = -1 * check[i];
            }
        }
        for (int i = wh; i > 1; --i)
        {
            if (check[i] != 0 && wheels[i][6] != wheels[i-1][2])
            {
                check[i-1] = -1 * check[i];
            }
        }

        for (int i = 1; i < 5; ++i)
        {
            if (check[i] != 0)
            {
                rotate(i, check[i]);
            }
        }
    }

    int ans = 0;
    for (int i = 1; i < 5; ++i)
    {
        if (wheels[i][0] == 1) ans += pow(2, i -1);
    }

    printf("%d\n", ans);

    return 0;
}