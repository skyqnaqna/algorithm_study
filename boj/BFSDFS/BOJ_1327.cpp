/*
 백준 1327 소트 게임
 21.07.19
 https://github.com/skyqnaqna/algorithm_study
 */

#include <bits/stdc++.h>

using namespace std;

#define INF 1e9
#define endl "\n"

typedef long long ll;
typedef double dd;
typedef pair<int, int> pii;
typedef pair<ll, ll> pll;

int n, k, ans = -1;
string target;
vector <int> arr;
set <string> used;


int main()
{
    ios::sync_with_stdio(0); cin.tie(0);
    freopen("input.txt", "r", stdin);

    cin >> n >> k;

    for (int i = 0; i < n; ++i) {
        int x; cin >> x;
        arr.push_back(x);
    }

    string origin;
    for (auto &i : arr) {
        origin += i + '0';
    }

    sort(arr.begin(), arr.end());

    for (auto &i : arr) {
        target += i + '0';
    }

    queue <pair <string, int> > q;
    q.push({origin, 0});

    while (!q.empty()) {
        string now = q.front().first;
        int cnt = q.front().second;
        q.pop();

        if (now == target) {
            ans = cnt;
            break;
        }

        for (int i = 0; i <= n - k; ++i) {
            string str = now;
            string sub = now.substr(i, k);
            reverse(sub.begin(), sub.end());

            str.replace(i, k, sub);

            if (used.count(str) == 0) {
                used.insert(str);
                q.push({str, cnt + 1});
            }
        }
    }

    cout << ans << endl;

    return 0;
}
