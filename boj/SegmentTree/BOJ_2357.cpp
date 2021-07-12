/*
 백준 2357 최솟값과 최댓값
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

vector<pii> tree(MAX * 4);
vector <int> arr(MAX);

pii init(vector<pii>&tree, vector<int>&arr, int node, int start, int end) {
    if (start == end) {
        return tree[node] = {arr[start], arr[start]};
    }
    
    int mid = (start + end) / 2;

    pii leftChild = init(tree, arr, node * 2, start, mid);
    pii rightChild = init(tree, arr, node * 2 + 1, mid + 1, end);

    return tree[node] = {min(leftChild.first, rightChild.first), max(leftChild.second, rightChild.second)};
}

pii query(vector<pii>&tree, int node, int start, int end, int left, int right) {
    if (start > right || end < left) return {INF, 0};
    else if (left <= start && end <= right) return tree[node];

    int mid = (start + end) / 2;

    pii leftChild = query(tree, node * 2, start, mid, left, right);
    pii rightChild = query(tree, node * 2 + 1, mid + 1, end, left, right);

    return {min(leftChild.first, rightChild.first), max(leftChild.second, rightChild.second)};
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

        pii ans = query(tree, 1, 0, n - 1, a - 1, b - 1);

        cout << ans.first << " " << ans.second << endl;
    }

    return 0;
}
