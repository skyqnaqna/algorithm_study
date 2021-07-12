/*
 백준 1717 집합의 표현
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

int n, m, parent[1000001];

int findParent(int a) {
    if (parent[a] == a) return a;
    return parent[a] = findParent(parent[a]);
}

void unionParent(int a, int b) {
    int x = findParent(parent[a]);
    int y = findParent(parent[b]);

    if (x < y) parent[y] = x;
    else parent[x] = y;
}

int main()
{
    ios::sync_with_stdio(0); cin.tie(0);

    cin >> n >> m;

    for (int i = 0; i <= n; ++i) {
        parent[i] = i;
    }

    for (int i = 0; i < m; ++i) {
        int a, b, c;
        cin >> a >> b >> c;

        if (a == 0) unionParent(b, c);
        else {
            if (findParent(b) != findParent(c)) {
                cout << "NO\n";
            } else {
                cout << "YES\n";
            }
        }
    }

    return 0;
}
