/*
 백준 12852 1로 만들기 2
 21.08.28
 https://github.com/skyqnaqna/algorithm_study
 */

#include <bits/stdc++.h>

using namespace std;
using ll = long long;
using dd = double;
using pii = pair<int, int>;
using pll = pair<ll, ll>;

#define INF (int)1e9
#define endl "\n"

const int MAX = 1000001;

int n, dp[MAX];
string history[MAX];

int main() {
    ios::sync_with_stdio(0); cin.tie(0);
//    freopen("input.txt", "r", stdin);

    cin >> n;

    fill(dp, dp + n, INF);
    dp[0] = -1, dp[n] = 0;

    queue<int>q;
    q.push(n);

    while (!q.empty()) {
        int now = q.front();
        q.pop();

        if (now == 1) break;

        int cnt = dp[now] + 1;

        if (now % 3 == 0 && cnt < dp[now / 3]) {
            dp[now / 3] = cnt;

            string s = to_string(now / 3);
            history[now / 3] = history[now] + " " + s;

            q.push(now / 3);
        }
        if (now % 2 == 0 && cnt < dp[now / 2]) {
            dp[now / 2] = cnt;

            string s = to_string(now / 2);
            history[now / 2] = history[now] + " " + s;

            q.push(now / 2);
        }
        if (now - 1 > 0 && cnt < dp[now - 1]) {
            dp[now - 1] = cnt;

            string s = to_string(now - 1);
            history[now - 1] = history[now] + " " + s;

            q.push(now - 1);
        }
    }

    cout << dp[1] << endl;
    cout << n << history[1];

    return 0;
}