/*
 백준 1202 보석도둑
 21.07.08
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

int n, k;
vector<pii>gems;
vector<int>bags;

int main()
{
    ios::sync_with_stdio(0); cin.tie(0);

    cin >> n >> k;

    for (int i = 0; i < n; ++i) {
        int m, v; cin >> m >> v;
        gems.push_back({m, v});
    }

    for (int i = 0; i < k; ++i) {
        int c; cin >> c;
        bags.push_back(c);
    }

    sort(gems.begin(), gems.end());
    sort(bags.begin(), bags.end());

    ll ans = 0;
    priority_queue<ll>candidates;
    for (int i = 0, j = 0; i < k; ++i) {
        while (j < n && gems[j].first <= bags[i]) {
            candidates.push(ll(gems[j++].second));
        }

        if (!candidates.empty()) {
            ans += candidates.top();
            candidates.pop();
        }
    }

    cout << ans << endl;

    return 0;
}

