/*
 백준 11438 LCA 2
 21.07.13
 https://github.com/skyqnaqna/algorithm_study
 */

#include <bits/stdc++.h>

using namespace std;

#define INF 1e9
#define endl "\n"

typedef long long ll;
typedef double dd;
typedef pair<int, int> pii;
typedef pair<ll, ll> pll;

const int MAX = 100001;

int n, m, parent[17][MAX], depth[MAX];
vector <vector <int> > tree(MAX);

// 각 노드의 깊이와 부모 저장
void setInfo(int root) {
    queue<pii>q;
    q.push({root, 1});
    depth[root] = 1;

    while (!q.empty()) {
        int now = q.front().first;
        int dep = q.front().second + 1;
        q.pop();

        for (auto &next : tree[now]) {
            if (depth[next] == 0) {
                q.push({next, dep});
                depth[next] = dep;
                parent[0][next] = now;
            }
        }
    }
}

void setParent() {
    setInfo(1);

    //parent[0][j] : 1 조상, parent[1][j] : 2 조상, parent[2][j] : 4 조상..
    for (int i = 1; i < 17; ++i) {
        for (int j = 1; j <= n; ++j) {
            parent[i][j] = parent[i - 1][parent[i - 1][j]];
        }
    }
}

int lca(int a, int b) {
    int temp;
    if (depth[b] < depth[a]) {
        temp = a, a = b, b = temp; // b의 깊이가 더 깊게
    }
    temp = depth[b] - depth[a];
    for (int i = 0; i < 17; ++i) {
        int bit = (1<<i);
        if ((temp & bit) == bit) {
            b = parent[i][b];
        }
    }
    if (b == a) return a;

    for (int i = 16; i >= 0; --i) {
        if (parent[i][a] != parent[i][b]) {
            a = parent[i][a], b = parent[i][b];
        }
    }
    return parent[0][a];
}

int main()
{
    ios::sync_with_stdio(0); cin.tie(0);

    cin >> n;

    for (int i = 0; i < n - 1; ++i) {
        int a, b;
        cin >> a >> b;

        tree[b].push_back(a);
        tree[a].push_back(b);
    }

    setParent();

    cin >> m;

    for (int i = 0; i < m; ++i) {
        int a, b;
        cin >> a >> b;

        cout << lca(a, b) << endl;
    }

    return 0;
}
