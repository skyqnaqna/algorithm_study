/*
 백준 2823 유턴 싫어
 21.07.20
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

int r, c;
char graph[10][10];
bool cycle;
int dy[] = {-1, 0, 1, 0};
int dx[] = {0, -1, 0, 1};
vector <pii> street;

int main()
{
    ios::sync_with_stdio(0); cin.tie(0);
    freopen("input.txt", "r", stdin);

    cin >> r >> c;

    for (int i = 0; i < r; ++i) {
        string s;
        cin >> s;

        for (int j = 0; j < c; ++j) {
            graph[i][j] = s[j];

            if (s[j] == '.') {
                street.push_back({i, j});
            }
        }
    }

    cycle = true;
    for (auto &i : street) {
        int row = i.first;
        int col = i.second;
        int cnt = 0;
        for (int i = 0; i < 4; ++i) {
            int nr = row + dy[i];
            int nc = col + dx[i];

            if (nr < 0 || nc < 0 || nr >= r || nc >= c) continue;
            if (graph[nr][nc] == '.') ++cnt;
        }

        if (cnt < 2) {
            cycle = false;
            break;
        }
    }

    if (cycle) cout << 0 << endl;
    else cout << 1 << endl;

    return 0;
}
