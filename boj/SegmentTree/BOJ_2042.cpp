/*
 백준 2042 구간 합 구하기
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

int n, m, k;
vector<ll>tree, arr;

ll init(vector<ll>&tree, vector<ll>&arr, int node, int start, int end) {
    if (start == end) {
        return tree[node] = arr[start];
    } else {
        return tree[node] = init(tree, arr, node * 2, start, (start + end) / 2) + init(tree, arr, node * 2 + 1, (start + end) /2 + 1, end);
    }
}

ll sum(vector<ll>&tree, int node, int start, int end, int left, int right) {
    if (start > right || end < left) return 0;
    if (left <= start && end <= right) return tree[node];
    
    return sum(tree, node * 2, start, (start + end) / 2, left, right) + sum(tree, node * 2 + 1, (start + end) / 2 + 1, end, left, right);
}

void update(vector<ll>&tree, int node, int start, int end, int idx, ll diff) {
    if (idx < start || idx > end) return;
    tree[node] += diff;

    if (start != end) {
        update(tree, node * 2, start, (start + end) / 2, idx, diff);
        update(tree, node * 2 + 1, (start + end) / 2 + 1, end, idx, diff);
    }
}

int main() {
    ios::sync_with_stdio(0); cin.tie(0);

    cin >> n >> m >> k;

    arr.resize(n);

    for (int i = 0; i < n; ++i) {
        cin >> arr[i];
    }

    tree.resize(4*n + 1);

    init(tree, arr, 1, 0, n - 1);

    m += k;

    while (m-->0) {
        int a;
        cin >> a;

        if (a == 1) {
            int b; ll c;
            cin >> b >> c;

            ll diff = c - arr[b - 1];
            arr[b - 1] = c;
            update(tree, 1, 0, n - 1, b - 1, diff);
        } else {
            int b, c;
            cin >> b >> c;

            cout << sum(tree, 1, 0, n - 1, b - 1, c - 1) << endl;
        }
    }

    return 0;
}
