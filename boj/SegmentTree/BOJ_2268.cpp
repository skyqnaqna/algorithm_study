/*
 백준 2268 수들의 합
 21.08.29
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

const int MAX = 1000000;
vector<ll>tree(MAX * 4 + 1);
int n, m;

ll query(int node, int s, int e, int l, int r) {
    if (s > r || e < l) return 0;
    else if (l <= s && e <= r) {
        return tree[node];
    } else {
        int mid = (s + e) / 2;

        return query(node * 2, s, mid, l, r) + query(node * 2 + 1, mid + 1, e, l, r);
    }
}

void update(int node, int s, int e, int idx, ll val) {
    if (idx < s || idx > e) return;
    if (s == e) tree[node] = val;
    else {
        int mid = (s + e) / 2;
        update(node * 2, s, mid, idx, val);
        update(node * 2 + 1, mid + 1, e, idx, val);
        tree[node] = tree[node * 2] + tree[node * 2 + 1];
    }
}

int main() {
    ios::sync_with_stdio(0); cin.tie(0);
    freopen("input.txt", "r", stdin);

    cin >> n >> m;

    while (m-->0) {
        int a; cin >> a;
        if (a == 0) {
            int i, j; cin >> i >> j;
            if (i < j) cout << query(1, 1, n, i, j) << endl;
            else cout << query(1, 1, n, j, i) << endl;
        } else {
            int i; ll val; cin >> i >> val;
            update(1, 1, n, i, val);
        }
    }

    return 0;
}