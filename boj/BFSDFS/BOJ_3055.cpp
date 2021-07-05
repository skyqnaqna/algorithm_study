/*
 백준 3055 탈출
 21.07.05
 https://github.com/skyqnaqna/algorithm_study/
*/

#include <bits/stdc++.h>

#define INF 1e9
#define endl "\n"

typedef long long ll;
typedef double dd;
typedef std::pair<int, int> pii;
typedef std::pair<ll, ll> pll;

using namespace std;

bool visited[51][51];
int water[51][51];
int toBeaver[51][51];
int dx[4] = {0, 0, -1, 1};
int dy[4] = {-1, 1, 0, 0};
int r, c;

void bfsWater(vector <pii> &v) {
    queue <pair <int, pii> > q;
    for (auto &i : v) {
        q.push({0, {i.first, i.second}});
        visited[i.first][i.second] = true;
    }

    while (!q.empty()) {
        int time, nowRow, nowCol;
        time = q.front().first;
        nowRow = q.front().second.first;
        nowCol = q.front().second.second;
        q.pop();

        for (int i = 0; i < 4; ++i) {
            int row = nowRow + dy[i];
            int col = nowCol + dx[i];

            if (row < 0 || col < 0 || row >= r || col >= c) continue;

            if (!visited[row][col] && water[row][col] == 0) {
                water[row][col] = time + 1;
                q.push({time + 1, {row, col}});
                visited[row][col] = true;
            }
        }
    }
}

void bfsToBeaver(const int sr, const int sc) {
    queue <pair <int ,pii> > q;
    q.push({0, {sr, sc}});
    visited[sr][sc] = true;

    while (!q.empty()) {
        int time, nowRow, nowCol;
        time = q.front().first;
        nowRow = q.front().second.first;
        nowCol = q.front().second.second;
        q.pop();

        for (int i = 0; i < 4; ++i) {
            int row = nowRow + dy[i];
            int col = nowCol + dx[i];

            if (row < 0 || col < 0 || row >= r || col >= c) continue;

            if (!visited[row][col] && toBeaver[row][col] == 0 && (time + 1 < water[row][col] || water[row][col] <= 0)) {
                toBeaver[row][col] = time + 1;
                q.push({time + 1, {row, col}});
                visited[row][col] = true;
            }
        }
    }
}

int main() {
    ios::sync_with_stdio(0); cin.tie(0);

    // 입력 받기 및 초기화
    cin >> r >> c;
    int startRow, startCol;
    int endRow, endCol;
    vector <pii> waters;

    for (int i = 0; i < r; ++i) {
        string s; cin >> s;

        for (int j = 0; j < c; ++j) {
            if (s[j] == 'X')  water[i][j] = toBeaver[i][j] = -1;
            else if (s[j] == '*') {
                waters.push_back({i, j});
                toBeaver[i][j] = -1;
            } else if (s[j] == 'D') {
                water[i][j] = -1;
                endRow = i;
                endCol = j;
            } else if (s[j] == 'S') {
                startRow = i;
                startCol = j;
            }
        }
    }

    bfsWater(waters);
    fill(&visited[0][0], &visited[50][51], false);
    bfsToBeaver(startRow, startCol);

    if (toBeaver[endRow][endCol] == 0) cout << "KAKTUS\n";
    else cout << toBeaver[endRow][endCol] << endl;

    return 0;
}
