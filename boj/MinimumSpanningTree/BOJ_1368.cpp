/*
 백준 1368 물대기
 21.08.21
 https://github.com/skyqnaqna/algorithm_study
 */

#include <bits/stdc++.h>

using namespace std;
using ll = long long;
using dd = double;
using pii = pair<int, int>;
using pll = pair<ll, ll>;

#define INF (int)2e9
#define endl "\n"

int n, parent[301];
ll ans;
vector <pair <ll, pii> > edges;

int findParent(int idx) {
    if (idx != parent[idx]) {
        return parent[idx] = findParent(parent[idx]);
    } else return idx;
}

void unionParent(int a, int b) {
    int x = findParent(a);
    int y = findParent(b);

    if (x < y) {
        parent[y] = x;
    } else {
        parent[x] = y;
    }
}

int main() {
    ios::sync_with_stdio(0); cin.tie(0);
    freopen("input.txt", "r", stdin);

    cin >> n;
    for (int i = 0; i <= n; ++i) parent[i] = i;

    // 우물을 파는 경우를 부모노드 0번에서 i번째 우물을 연결한다고 생각하는 것이 포인트
    for (int i = 0; i < n; ++i) {
        int none; cin >> none;
        edges.push_back({none, {0, i+1}});
    }

    for (int i = 0; i < n; ++i) {
        for (int j = 0; j < n; ++j) {
            int w; cin >> w;
            if (i < j) {
                edges.push_back({w, {i+1, j+1}});
            }
        }
    }

    sort(edges.begin(), edges.end());

    for (auto &edge : edges) {
        if (findParent(edge.second.first) != findParent(edge.second.second)) {
            unionParent(edge.second.first, edge.second.second);
            ans += edge.first;
        }
    }

    cout << ans << endl;

    return 0;
}