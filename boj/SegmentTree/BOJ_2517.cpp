/*
 백준 2517 달리기
 21.07.08
 https://github.com/skyqnaqna/algorithm_study
 */

#include <bits/stdc++.h>

#define INF 1e9
#define endl "\n"

typedef long long ll;
typedef double dd;
typedef std::pair<int, int> pii;
typedef std::pair<ll, ll> pll;

using namespace std;

int n, num;
pii player[500000];
int tree[1<<20]; // 2^20

int seg_sum(int node, int s, int e, int l, int r) {
    if (r < s || e < l) return 0;
    if (l <= s && e <= r) return tree[node];
    else {
        return seg_sum(node * 2, s, (s + e) / 2, l, r) + seg_sum(node * 2 + 1, (s + e) / 2 + 1, e, l, r);
    }
}

void update(int node, int s, int e, int idx, int v) {
    if (idx < s || e < idx) return;

    // 단말 노드
    if (s == e) {
        tree[node] = v;
        // 응용 문제들
//        tree[node] += v;
//        tree[node] -= v;
//        tree[node] *= v;
//        tree[node] &= v;
    } else {
        update(node * 2, s, (s + e) / 2, idx, v);
        update(node * 2 + 1, (s + e) / 2 + 1, e, idx, v);
        tree[node] = tree[node * 2] + tree[node * 2 + 1];
    }
}

bool cmp(pii a, pii b) {
    return a.second < b.second;
}

int main()
{
    ios::sync_with_stdio(0); cin.tie(0);

    cin >> n;
    for (int i = 0; i < n; ++i) {
        int power;
        cin >> power;
        player[i] = {i, power};
    }
    // power 기준으로 정렬
    sort(player, player + n, cmp);

    // re Label
    for (int i = 0; i < n; ++i) {
        player[i].second = ++num; // or i + 1
    }

    // 원래 순서로 정렬
    sort(player, player + n);
    for (int i = 0; i < n; ++i) {
        int curpower = player[i].second;
        int cnt = 0;
        if (curpower >= 1) cnt = seg_sum(1, 1, num, 1, curpower - 1);
        update(1, 1, num, curpower, 1);

        cout << i + 1 - cnt << endl;
    }

    return 0;
}
