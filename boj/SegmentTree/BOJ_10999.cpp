/*
 백준 10999 구간 합 구하기 2
 21.07.14
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

const int MAX = 1000001;

int n, m, k;

vector<ll> tree(MAX * 4), arr(MAX), lazy(MAX * 4);

ll init(vector<ll>&tree, vector<ll>&arr, int node, int start, int end) {
    if (start == end) {
        return tree[node] = arr[start];
    }
    
    int mid = (start + end) / 2;

    return tree[node] = init(tree, arr, node * 2, start, mid) + init(tree, arr, node * 2 + 1, mid + 1, end);
}


void update_lazy(vector<ll>&tree, vector<ll>&lazy, int node, int start, int end) {
    if (lazy[node] != 0 ) {
        tree[node] += (end - start + 1) * lazy[node];

        if (start != end) {
            lazy[node * 2] += lazy[node];
            lazy[node * 2 + 1] += lazy[node];
        }
        lazy[node] = 0;
    }
}

void update(vector<ll>&tree, vector<ll>&lazy, int node, int start, int end, int left, int right, ll v) {
    update_lazy(tree, lazy, node, start, end);

    if (start > right || end < left) return;
    else if (left <= start && end <= right) {
        tree[node] += (end - start + 1) * v;
        if (start != end) {
            lazy[node * 2] += v;
            lazy[node * 2 + 1] += v;
        }
        return;
    }

    int mid = (start + end) / 2;

    update(tree, lazy, node * 2, start, mid, left, right, v);
    update(tree, lazy, node * 2 + 1, mid + 1, end, left, right, v);
    tree[node] = tree[node * 2] + tree[node * 2 + 1];
}

ll query(vector<ll>&tree, vector<ll>&lazy, int node, int start, int end, int left, int right) {
    update_lazy(tree, lazy, node, start, end);

    if (start > right || end < left) return 0;
    else if (left <= start && end <= right) return tree[node];

    int mid = (start + end) / 2;

    return query(tree, lazy, node * 2, start, mid, left, right) + query(tree, lazy, node * 2 + 1, mid + 1, end, left, right);
}


int main() {
    ios::sync_with_stdio(0); cin.tie(0);

    cin >> n >> m >> k;

    for (int i = 0; i < n; ++i) {
        cin >> arr[i];
    }

    init(tree, arr, 1, 0, n - 1);

    for (int i = 0; i < m + k; ++i) {
        int a, b, c;
        ll d;

        cin >> a;

        if (a == 1) {
            cin >> b >> c >> d;
            
            update(tree, lazy, 1, 0, n - 1, b - 1, c - 1, d);

        } else {
            cin >> b >> c;

            cout << query(tree, lazy, 1, 0, n - 1, b - 1, c - 1) << endl;
        }
    }

    return 0;
}
