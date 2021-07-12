/*
 백준 1516 게임 개발
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

int n, inDegree[501], times[501], ans[501];
vector<vector <int> >edges;

int main()
{
    ios::sync_with_stdio(0); cin.tie(0);

    cin >> n;

    edges.resize(n + 1);
    queue<int>q;

    for (int i = 1; i <= n; ++i) {
        int a, b, c;
        cin >> a >> b;
        times[i] = ans[i] = a;

        if (b == -1) {
            q.push(i);
            continue;
        } else {
            inDegree[i]++;
            edges[b].push_back(i);

            cin >> c;
            while (c != -1) {
                inDegree[i]++;
                edges[c].push_back(i);
                cin >> c;
            }
        }
    }

    while (!q.empty()) {
        int now = q.front();
        q.pop();

        for (auto &next : edges[now]) {
            if (ans[now] + times[next] > ans[next]) {
                ans[next] = ans[now] + times[next];
            }

            if (--inDegree[next] == 0) q.push(next);
        }
    }

    for (int i = 1; i <= n; ++i) {
        cout << ans[i] << endl;
    }

    return 0;
}
