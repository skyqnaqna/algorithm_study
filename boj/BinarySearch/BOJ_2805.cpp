/*
 백준 2805 나무 자르기
 21.07.06
 https://github.com/skyqnaqna/algorithm_study/
*/

#include <bits/stdc++.h>

#define INF 2147000000
#define endl "\n"

typedef long long ll;
typedef double dd;
typedef std::pair<int, int> pii;
typedef std::pair<ll, ll> pll;

using namespace std;

int n, m;
vector <ll> trees;

int main()
{
    ios::sync_with_stdio(0); cin.tie(0);

    cin >> n >> m;

    for (int i = 0; i < n; ++i) {
        int a; cin >> a;
        trees.push_back(a);
    }

    int mid, l = 0, r = 1000000000, ans = 0;

    while (l <= r) {
        mid = (l + r) / 2;


        ll sum = 0;
        for (auto &t : trees) {
            if (t > mid) {
                sum += t - mid;
            }
        }

        if (sum >= m) {
            l = mid + 1;
            ans = max(ans, mid);
        } else r = mid - 1;
    }

    cout << ans << endl;


    return 0;
}