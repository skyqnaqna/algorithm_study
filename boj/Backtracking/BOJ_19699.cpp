/*
 21.10.16
 백준 19699 소-난다!
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

int n, m;
vector <int> cows, answer;
vector <bool> prime(9001, true);

void recursive(int idx, int sum, int cnt) {
    if (cnt == m) {
        if (prime[sum]) answer.push_back(sum);
        return;
    }

    for (int i = idx; i < n; ++i) {
        recursive(i + 1, sum + cows[i], cnt + 1);
    }
}

int main() {
    ios::sync_with_stdio(0); cin.tie(0);

    prime[0] = prime[1] = false;
    for (int i = 2; i < sqrt(9000) + 1; ++i) {
        if (prime[i]) {
            int k = 2;
            while (i * k <= 9000) {
                prime[i * k++] = false;
            }
        }
    }

    cin >> n >> m;

    for (int i = 0; i < n; ++i) {
        int x; cin >> x;
        cows.push_back(x);
    }

    recursive(0, 0, 0);

    if (answer.empty()) cout << -1 << endl;
    else {
        // 정렬 먼저해주기
        sort(answer.begin(), answer.end());
        // unique로 중복 원소를 뒤로 보내고 반환 된 위치를 erase로 지우기
        answer.erase(unique(answer.begin(), answer.end()), answer.end());

        for (auto &res : answer) {
            cout << res << " ";
        }
    }

    return 0;
}