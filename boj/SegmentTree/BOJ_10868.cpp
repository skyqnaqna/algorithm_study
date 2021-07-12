/*
 백준 10868 최솟값
 21.07.13
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

const int MAX = 100001;

int n, m;

vector <int> tree(MAX * 4), arr(MAX);

int init(vector<int>&tree, vector<int>&arr, int node, int start, int end) {
    if (start == end) {
        return tree[node] = arr[start];
    }

    int mid = (start + end) / 2;

    return tree[node] = min(init(tree, arr, node * 2, start, mid), init(tree, arr, node * 2 + 1, mid + 1, end));
}

int query(vector<int>&tree, int node, int start, int end, int left, int right) {
    if (start > right || end < left) return INF;
    else if (left <= start && end <= right) return tree[node];

    int mid = (start + end) / 2;

    return min(query(tree, node * 2, start , mid, left, right), query(tree, node * 2 + 1, mid + 1, end, left, right));
}


int main() {
    ios::sync_with_stdio(0); cin.tie(0);

    cin >> n >> m;

    for (int i = 0; i < n; ++i) {
        cin >> arr[i];
    }

    init(tree, arr, 1, 0, n - 1);

    for (int i = 0; i < m; ++i) {
        int a, b;
        cin >> a >> b;

        cout << query(tree, 1, 0, n - 1, a - 1, b - 1) << endl;
    }

    return 0;
}
