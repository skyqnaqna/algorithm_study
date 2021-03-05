// 백준 1946 신입 사원
// 21.03.06
#include <iostream>
#include <algorithm>
#include <queue>
#include <vector>
#include <string>
#include <cmath>
#include <set>
#include <stack>

#define INF 1e9
#define endl "\n"

typedef long long ll;
typedef double dd;
typedef std::pair<int, int> pii;
typedef std::pair<ll, ll> pll;

using namespace std;

int main()
{
    int t; scanf("%d", &t);

    while (t-->0)
    {
        int n; scanf("%d", &n);
        vector <pii> applicant;
        for (int i = 0; i < n; ++i)
        {
            int a, b; scanf("%d %d", &a, &b);
            applicant.push_back({a, b});
        }
        sort(applicant.begin(), applicant.end());
        vector <int> ans;
        ans.push_back(applicant[0].second);
        for (int i = 1; i < n; ++i)
        {
            if (ans.back() > applicant[i].second) ans.push_back(applicant[i].second);
        }
        printf("%d\n", ans.size());
    }

    return 0;
}