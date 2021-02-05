// 백준 5648 역원소 정렬
// 21.02.06
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
    int n;
    ll a;
    vector <ll> v;

    scanf("%d", &n);
    for (int i = 0; i < n; ++i)
    {
        scanf("%lld", &a);
        v.push_back(a);
    }
    
    vector <ll> ans;
    for (int i = 0; i < n; ++i)
    {
        string s = to_string(v[i]);
        reverse(s.begin(), s.end());
        ans.push_back(stoll(s));
    }

    sort(ans.begin(), ans.end());
    for (int i = 0; i < n; ++i)
    {
        printf("%lld\n", ans[i]);
    }

    return 0;
}