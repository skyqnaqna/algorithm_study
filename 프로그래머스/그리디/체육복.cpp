/*----------------------
|백준 14620 꽃길
|21.01.26
----------------------*/

#include <iostream>
#include <vector>
#include <algorithm>

using namespace std;

int main()
{
    int arr[5][5] = {{0,0,0,0,0},
                     {1,1,1,1,1},
                     {2,2,2,2,2},
                     {3,3,3,3,3},
                     {4,4,4,4,4}};
    
    fill(&arr[0][0], &arr[4][5], 7);

    for (int i = 0; i < 5; ++i)
    {
        for (int j = 0; j < 5; ++j)
        {
            printf("%d ", arr[i][j]);
        }
        printf("\n");
    }

    printf("==============\n");

    fill(arr[0], &arr[1][5], 3);

    for (int i = 0; i < 5; ++i)
    {
        for (int j = 0; j < 5; ++j)
        {
            printf("%d ", arr[i][j]);
        }
        printf("\n");
    }

    printf("==============\n");

    fill(arr[0], arr[0] + 15, 5);

    for (int i = 0; i < 5; ++i)
    {
        for (int j = 0; j < 5; ++j)
        {
            printf("%d ", arr[i][j]);
        }
        printf("\n");
    }

    return 0;
}