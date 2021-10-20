/*
 21.10.20
 백준 1158 요세푸스 문제
 https://github.com/skyqnaqna/algorithm_study
 */

#include <bits/stdc++.h>

using namespace std;
using ll = long long;
using dd = double;
using pii = pair<int, int>;
using pll = pair<ll, ll>;

#define INF (int)2e9
#define endl "\n"
#define TXTOPEN freopen("input.txt", "r", stdin)

int n, k;
vector <int> answer;

int main() {
    ios::sync_with_stdio(0); cin.tie(0);

    cin >> n >> k;

    queue <int> q;
    for (int i = 0; i < n; ++i) {
        q.push(i + 1);
    }

    int cnt = 0;
    while (!q.empty()) {
        int now = q.front();
        q.pop();
        ++cnt;

        if (cnt == k) {
            answer.push_back(now);
            cnt = 0;
        } else {
            q.push(now);
        }
    }

    cout << "<" << answer[0];
    for (int i = 1; i < n; ++i) {
        cout << ", " << answer[i];
    }
    cout << ">" << endl;

    return 0;
}