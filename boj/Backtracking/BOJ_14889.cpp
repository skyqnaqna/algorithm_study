/*
 백준 14889 스타트와 링크
 21.08.03
 https://github.com/skyqnaqna/algorithm_study
 */

#include <bits/stdc++.h>

using namespace std;
using ll = long long;
using dd = double;
using pii = pair<int, int>;
using pll = pair<ll, ll>;

#define INF 2e9
#define endl "\n"

int n, graph[20][20], ans = INF;
bool visited[20];

void backtracking(int now, int cnt) {
    if (cnt == n / 2) {
        int start = 0, link = 0;
        for (int i = 0; i < n; ++i) {
            if (visited[i]) {
                for (int j = i + 1; j < n; ++j) {
                    if (visited[j]) start += graph[i][j] + graph[j][i];
                }
            } else {
                for (int j = i + 1; j < n; ++j) {
                    if (!visited[j]) link += graph[i][j] + graph[j][i];
                }
            }
        }
        ans = min(ans, abs(start - link));
        return;
    }

    for (int i = now; i < n; ++i) {
        if (!visited[i]) {
            visited[i] = true;
            backtracking(i + 1, cnt + 1);
            visited[i] = false;
        }
    }
}

int main() {
    ios::sync_with_stdio(0); cin.tie(0);
    freopen("input.txt", "r", stdin);

    cin >> n;

    for (int i = 0; i < n; ++i) {
        for (int j = 0; j < n; ++j) {
            cin >> graph[i][j];
        }
    }

    backtracking(0, 0);

    cout << ans << endl;

    return 0;
}
