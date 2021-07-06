/*
 백준 2003 수들의 합 2
 21.07.06
 https://github.com/skyqnaqna/algorithm_study/
*/

#include <bits/stdc++.h>

#define INF 1e9
#define endl "\n"

typedef long long ll;
typedef double dd;
typedef std::pair<int, int> pii;
typedef std::pair<ll, ll> pll;

using namespace std;

int n, m;
vector <int> arr;

int main()
{
    ios::sync_with_stdio(0); cin.tie(0);

    cin >> n >> m;

    for (int i = 0; i < n; ++i) {
        int input; cin >> input;
        arr.push_back(input);
    }

    int l = 0, r = 0, sum = 0, ans = 0;

    while (l < n) {

        if (sum <= m && r < n) sum += arr[r++];
        else if (sum > m || r == n) sum -= arr[l++];

        if (sum == m) ans++;
    }

    cout << ans << endl;

    return 0;
}