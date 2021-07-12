/*
 백준 2252 줄 세우기
 21.07.12
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

int n, m, inDegree[32001];
vector <vector <int> > edges;

int main()
{
    ios::sync_with_stdio(0); cin.tie(0);

    cin >> n >> m;

    edges.resize(n + 1);

    for (int i = 0; i < m; ++i) {
        int a, b;
        cin >> a >> b;

        edges[a].push_back(b);
        inDegree[b]++;
    }

    queue<int>q;
    for (int i = 1; i <= n; ++i) {
        if (inDegree[i] == 0) {
            q.push(i);
        }
    }

    while (!q.empty()) {
        int now = q.front();
        q.pop();

        for (auto &next : edges[now]) {
            inDegree[next]--;
            if (inDegree[next] == 0) {
                q.push(next);
            }
        }

        cout << now << " ";
    }
    cout << endl;

    return 0;
}
