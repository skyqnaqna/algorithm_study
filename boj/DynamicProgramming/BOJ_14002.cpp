// 백준 14002 가장 긴 증가하는 부분 수열 4
// 21.02.21
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

using namespace std;

int arr[1001];
vector <pii> d; // 길이와 이전 수의 인덱스 저장

int main()
{
    int n; scanf("%d", &n);
    for (int i = 1; i <= n; ++i)
        scanf("%d", &arr[i]);

    d.resize(n + 1, {0, 0});
    d[1] = {1, 1};
    for (int i = 2; i <= n; ++i)
    {
        int m = 0, idx = i;
        for (int j = i - 1; j >= 0; --j)
        {
            if (arr[j] < arr[i] && d[j].first > m)
            {
                m = d[j].first;
                idx = j;
            }
        }
        d[i] = {m + 1, idx};
    }

    int idx, ans = 0;
    for (int i = 1; i <= n; ++i)
    {
        if (ans < d[i].first)
        {
            ans = d[i].first;
            idx = i;
        }
    }
    printf("%d\n", ans);

    int pre = d[idx].second;
    stack <int> st;
    st.push(arr[idx]);
    while (pre != idx)
    {
        idx = pre;
        pre = d[idx].second;
        st.push(arr[idx]);
    }

    while (!st.empty())
    {
        printf("%d ", st.top());
        st.pop();
    }

    return 0;
}