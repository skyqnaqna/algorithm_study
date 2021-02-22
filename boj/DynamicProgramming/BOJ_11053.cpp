// 백준 11053 가장 긴 증가하는 부분 수열
// 21.02.22
#include <iostream>
#include <algorithm>
#include <queue>
#include <vector>
#include <string>
#include <cmath>
#include <set>
#include <stack>

#define INF 2147000000
#define endl "\n"

typedef long long ll;
typedef double dd;
typedef std::pair<int ,int> pii;
typedef std::pair<ll, ll> pll;

using namespace std;

int a[1001];
int lis[1001];

// target 이상인 첫 번째 원소 위치 반환
int _lowerBound(int start, int end, int *arr, int target) // [start, end)
{
    while (start < end)
    {
        int mid = (start + end) / 2;
        if (arr[mid] < target)
        {
            start = mid + 1;
        }
        else
        {
            end = mid;
        }
    }
    return end;
}

int main()
{
    int n; scanf("%d", &n);
    for (int i = 0; i < n; ++i)
        scanf("%d", &a[i]);

    lis[0] = a[0];
    int idx = 0; // lis의 가장 우측(가장 큰) 값
    for (int i = 1; i < n; ++i)
    {
        if (lis[idx] < a[i]) lis[++idx] = a[i];
        else
        {
            int pos = _lowerBound(0, idx + 1, lis, a[i]);
            lis[pos] = a[i];
        }
    }

    printf("%d\n", idx + 1);

    return 0;
}