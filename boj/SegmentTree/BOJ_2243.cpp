/*
 백준 2243 사탕상자
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

const int MAX = 1000001;
int n;
vector<int> tree(MAX * 4);

int query(vector<int>&tree, int node, int start, int end, int target) {
    if (start == end) return start;

    int mid = (start + end) / 2;

    if (tree[node * 2] >= target) {
        return query(tree, node * 2, start, mid, target);
    }

    target -= tree[node * 2];

    if (tree[node * 2 + 1] >= target) {
        return query(tree, node * 2 + 1, mid + 1, end, target);
    }
}

void update(vector<int>&tree, int node, int idx, int start, int end, int diff) {
    if (start > idx || end < idx) return;

    tree[node] += diff;
    int mid = (start + end) / 2;

    if (start != end) {
        update(tree, node * 2, idx, start, mid, diff);
        update(tree, node * 2 + 1, idx, mid + 1, end, diff);
    }
}

int main() {
    ios::sync_with_stdio(0); cin.tie(0);

    cin >> n;

    for (int i = 0; i < n; ++i) {
        int a, b, c;

        cin >> a;

        if (a == 1) {
            cin >> b;
            int pos = query(tree, 1, 1, MAX, b);
            cout << pos << endl;
            update(tree, 1, pos, 1, MAX, -1);
        } else {
            cin >> b >> c;
            update(tree, 1, b, 1, MAX, c);
        }
    }


    return 0;
}
