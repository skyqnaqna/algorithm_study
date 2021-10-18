/*
 21.10.19
 백준 9466 텀 프로젝트
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

const int MAX = 100001;

int t, n;
int students[MAX];

int main() {
    ios::sync_with_stdio(0); cin.tie(0);
//    TXTOPEN;

    cin >> t;

    while (t-->0) {
        cin >> n;

        for (int i = 1; i <= n; ++i) {
            cin >> students[i];
        }

        set <int> cycled;
        vector <bool> visited(n + 1, false);
        int answer = n;

        for (int i = 1; i <= n; ++i) {
            if (!visited[i]) {
                visited[i] = true;

                set <int> temp;
                int next = students[i];
                temp.insert(i);
                while (true) {
                    if (temp.find(next) != temp.end()) {
                        int start = next;
                        int end = students[start];

                        cycled.insert(start);
                        while (end != start) {
                            cycled.insert(end);
                            end = students[end];
                        }
                        break;
                    }
                    if (visited[next]) break;

                    temp.insert(next);
                    visited[next] = true;
                    next = students[next];
                }

            }
        }
        cout << n - cycled.size() << endl;
    }

    return 0;
}