// 백준 13702 이상한 술집
// 21.02.17
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
    int n, k; scanf("%d %d", &n, &k);
    vector <int> mak;
    for (int i = 0; i < n; ++i)
    {
        int a; scanf("%d", &a);
        mak.push_back(a);
    }
    
    int left = 0;
    int right = *max_element(mak.begin(), mak.end());
    int mid = (left + right) / 2;
    int ans = 0;

    while (left <= right)
    {
        int cnt = 0;
        for (int i = 0; i < mak.size(); ++i)
            cnt += mak[i] / mid;
        
        if (cnt >= k) // 사람 수 또는 이상으로 나눠줄 수 있는 경우
        {
            ans = max(ans, mid);
            left = mid + 1;
        }
        else
        {
            right = mid - 1;
        }

        mid = (left + right) / 2;
    }

    printf("%d\n", ans);

    return 0;
}