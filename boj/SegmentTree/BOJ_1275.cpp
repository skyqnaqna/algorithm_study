/*
 백준 1275 커피숍2
 21.07.11
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

int n, q;
vector<ll> tree, arr;

ll init(vector<ll>&tree, vector<ll>&arr, int node, int start, int end) {
    if (start == end) return tree[node] = arr[start];
    return tree[node] = init(tree, arr, node * 2, start, (start + end) / 2) + init(tree, arr, node * 2 + 1, (start + end) / 2 + 1, end);
}

ll sum(vector<ll>&tree, int node, int start, int end, int left, int right) {
    if (start > right || end < left) return 0;
    if (left <= start && end <= right) return tree[node];
    return sum(tree, node * 2, start, (start + end) / 2, left, right) + sum(tree, node * 2 + 1, (start + end) / 2 + 1, end, left, right);
}

void update(vector<ll>&tree, int node, int idx, int start, int end, ll diff) {
    if (start > idx || end < idx) return ;
    tree[node] += diff;
    if (start != end) {
        update(tree, node * 2, idx, start, (start + end) / 2, diff);
        update(tree, node * 2 + 1, idx, (start + end) / 2 + 1, end, diff);
    }
}

int main() {
    ios::sync_with_stdio(0); cin.tie(0);

    cin >> n >> q;

    arr.resize(n);
    tree.resize(4 * n);

    for (int i = 0; i < n; ++i) cin >> arr[i];

    init(tree, arr, 1, 0, n - 1);

    for (int i = 0; i < q; ++i) {
        int x, y, a;
        ll b;
        cin >> x >> y >> a >> b;

        if (x > y) {
            cout << sum(tree, 1, 0, n - 1, y - 1, x - 1) << endl;
        } else {
            cout << sum(tree, 1, 0, n - 1, x - 1, y - 1) << endl;
        }
        
        ll diff = b - arr[a - 1];
        arr[a - 1] = b;
        update(tree, 1, a - 1, 0, n - 1, diff);
    }

    return 0;
}
