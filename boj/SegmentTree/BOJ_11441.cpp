/*
 백준 11441 합 구하기
 21.08.09
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

const int MAX = 100000;

int n, m, arr[MAX];
vector <int> tree (4 * MAX + 1);

int init(vector<int>&tree, int node, int s, int e) {
    if (s == e) {
        return tree[node] = arr[s];
    } else {
        int mid = (s + e) / 2;
        return tree[node] = init(tree, node * 2, s, mid) + init(tree, node * 2 + 1, mid + 1, e);
    }
}

int query(vector<int>&tree, int node, int s, int e, int l, int r) {
    if (s > r || e < l) return 0;
    else if (l <= s && e <= r) return tree[node];
    else {
        int mid = (s + e) / 2;

        return query(tree, node * 2, s, mid, l, r) + query(tree, node * 2 + 1, mid + 1, e, l, r);
    }
}

int main()
{
    ios::sync_with_stdio(0); cin.tie(0);
    freopen("input.txt", "r", stdin);

    cin >> n;

    for (int i = 0; i < n; ++i) {
        cin >> arr[i];
    }

    cin >> m;

    init(tree, 1, 0, n - 1);

    while (m-->0) {
        int i, j; cin >> i >> j;

        cout << query(tree, 1, 0, n - 1, i - 1, j - 1) << endl;
    }

    return 0;
}