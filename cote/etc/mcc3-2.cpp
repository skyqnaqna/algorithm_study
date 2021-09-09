/*
 프로그래머스 월간 코드 챌린지 시즌 3 - 2
 21.09.09
 https://github.com/skyqnaqna/algorithm_study
 */

#include <bits/stdc++.h>

using namespace std;
using ll = long long;
using dd = double;
using pii = pair<int, int>;
using pll = pair<ll, ll>;

#define INF (int)1e9
#define endl "\n"

int dy[] = {-1, 0, 1, 0};
int dx[] = {0, 1, 0, -1};
bool graph[4][500][500] = { false };

vector<int> solution(vector<string> grid) {
    int n = grid.size();
    int m = grid[0].length();
    vector<int> answer;

    for (int i = 0; i < n; ++i) {
        for (int j = 0; j < m; ++j) {
            for (int k = 0; k < 4; ++k) {
                vector<pair<int, pair<int, int> > > path;
                if (!graph[k][i][j]) {
                    path.push_back({k, {i, j}});
                    graph[k][i][j] = true;

                    while (true) {
                        int d = path.back().first;
                        int nr = (path.back().second.first + dy[d]) % n;
                        int nc = (path.back().second.second + dx[d]) % m;
                        if (nr < 0) nr = n - 1;
                        if (nc < 0) nc = m - 1;

                        if (grid[nr][nc] == 'L') {
                            d -= 1;
                            if (d < 0) d = 3;
                        } else if (grid[nr][nc] == 'R') {
                            d = (d + 1) % 4;
                        }

                        if (!graph[d][nr][nc]) {
                            path.push_back({d, {nr, nc}});
                            graph[d][nr][nc] = true;
                        } else break;
                    }

                    answer.push_back(path.size());
                }
            }
        }
    }

    sort(answer.begin(), answer.end());

    return answer;
}

int main() {
    ios::sync_with_stdio(0); cin.tie(0);
//    freopen("input.txt", "r", stdin);

    vector <string> v = {"SL", "LR"};
    vector <int> res = solution(v);

    for (auto &r : res) cout << r << endl;

    return 0;
}