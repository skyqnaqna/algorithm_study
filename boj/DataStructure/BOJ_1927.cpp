/*
 백준 1927 최소 힙
 21.07.08
 https://github.com/skyqnaqna/algorithm_study
 */

#include <bits/stdc++.h>

using namespace std;

#define INF 2147483647
#define endl "\n"

typedef long long ll;
typedef double dd;
typedef pair<int, int> pii;
typedef pair<ll, ll> pll;


int main() {
    ios::sync_with_stdio(0); cin.tie(0);

    int n; cin >> n;

    priority_queue<int>pq;

    for (int i = 0; i < n; ++i)  {
        int k; cin >> k;

        if (k == 0) {
            if (pq.empty()) cout << 0 << endl;
            else {
                cout << -pq.top() << endl;
                pq.pop();
            }
        } else {
            pq.push(-k);
        }
    }

    return 0;
}