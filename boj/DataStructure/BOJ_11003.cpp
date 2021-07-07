/*
 백준 11003 최솟값 찾기
 21.07.07
 https://github.com/skyqnaqna/algorithm_study
 */

#include <bits/stdc++.h>

#define INF 1e9
#define endl "\n"

typedef long long ll;
typedef double dd;
typedef std::pair<int, int> pii;
typedef std::pair<ll, ll> pll;

using namespace std;


int main()
{
    ios::sync_with_stdio(0); cin.tie(0);

    int n, l;
    vector<int>arr, ans;
    cin >> n >> l;

    for (int i = 0; i < n; ++i) {
        int x; cin >> x;
        arr.push_back(x);
    }

    deque<pii>dq;

    for (int i = 0; i < n; ++i) {
        while (!dq.empty() && dq.back().second >= arr[i]) dq.pop_back();
        while (!dq.empty() && i - dq.front().first >= l) dq.pop_front();
        dq.push_back({i, arr[i]});
        ans.push_back(dq.front().second);
    }

    for (auto &i : ans) cout << i << " ";
    cout << endl;

    return 0;
}
