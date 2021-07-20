/*
 제 3회 류호석배 알고리즘 코딩 테스트
 2번 정보 상인 호석
 21.07.20
 https://github.com/skyqnaqna/algorithm_study
 */

#include <bits/stdc++.h>

using namespace std;

#define INF 2e9
#define endl "\n"

typedef long long ll;
typedef double dd;
typedef pair<int, int> pii;
typedef pair<ll, ll> pll;

int q;
unordered_map<string, int>names;
vector <priority_queue<ll> > info;

int main() {
    ios::sync_with_stdio(0); cin.tie(0);
    freopen("input.txt", "r", stdin);

    cin >> q;

    int idx = 0;
    ll ans = 0;

    for (int i = 0; i < q; ++i) {
        int a, k;
        string s;

        cin >> a >> s >> k;

        if (a == 1) {
            if (names.count(s) == 0) {
                names[s] = idx++;
                info.push_back(priority_queue<ll>());
            }

            for (int j = 0; j < k; ++j) {
                ll c; cin >> c;
                info[names[s]].push(c);
            }
        } else {
            if (names.count(s) > 0) {
                int pos = names[s];
                ll sum = 0;

                for (int j = 0; j < k; ++j) {
                    if (info[pos].empty()) break;

                    sum += info[pos].top();
                    info[pos].pop();
                }

                ans += sum;
            }
        }
    }

    cout << ans << endl;

    return 0;
}
