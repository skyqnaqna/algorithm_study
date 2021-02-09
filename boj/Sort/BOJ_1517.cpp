// 백준 1517 버블 소트
// 21.02.08
#include <iostream>
#include <algorithm>
#include <queue>
#include <vector>
#include <string>
#include <cmath>
#define INF 2147000000

typedef long long ll;

using namespace std;

vector <ll> v;
ll ans = 0;

void mergeSort(int left, int right)
{
    if (left < right)
    {
        int mid = (left + right) / 2;
        mergeSort(left, mid);
        mergeSort(mid + 1, right);

        vector<ll> temp;
        int l = left;
        int r = mid + 1;
        while (l <= mid && r <= right)
        {
            if (v[l] > v[r])
            {
                temp.push_back(v[r++]);
                ans += mid - l + 1;
            }
            else
            {
                temp.push_back(v[l++]);
            }
        }
        while (l <= mid)
            temp.push_back(v[l++]);
        while (r <= right)
            temp.push_back(v[r++]);

        for (int i = 0; i < temp.size(); ++i)
            v[i + left] = temp[i];
        temp.clear();
    }
}

int main()
{
    int n; scanf("%d", &n);
    for (int i = 0; i < n; ++i)
    {
        ll a; scanf("%lld", &a);
        v.push_back(a);
    }

    mergeSort(0, n - 1);

    printf("%lld\n", ans);

    return 0;
}