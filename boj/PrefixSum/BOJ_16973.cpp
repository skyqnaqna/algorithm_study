/*
 백준 16973 직사각형 탈출
 21.12.07
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

void input() {
    freopen("input.txt", "r", stdin);
}

void output() {
    ifstream readFile;
    readFile.open("output.txt");

    if (readFile.is_open()) {
        while (!readFile.eof()) {
            string a;
            getline(readFile, a);
//            ans.push_back(stoi(a));
        }
        readFile.close();
    }
}

const int MAX = 1001;
int n, m, h, w, sr, sc, fr, fc;

int dy[] = {-1, 1, 0, 0};
int dx[] = {0, 0, -1, 1};

vector <vector <int> > graph(MAX, vector <int> (MAX));
vector <vector <int> > prefixSum(MAX, vector <int> (MAX));
vector <vector <int> > dist(MAX, vector <int> (MAX, -1));

bool inBound(int r, int c) {
    return 0 < r && r <= n && 0 < c && c <= m && graph[r][c] == 0;
}

bool checkMove(int r, int c) {
    int r2 = r + h - 1, c2 = c + w - 1;
    if (!inBound(r2, c2)) return false;

    int area = prefixSum[r2][c2] - prefixSum[r - 1][c2] - prefixSum[r2][c - 1] + prefixSum[r - 1][c - 1];

    return area == 0;
}

int main() {
    ios::sync_with_stdio(0); cin.tie(0);

    cin >> n >> m;

    for (int i = 1; i <= n; ++i) {
        for (int j = 1; j <= m; ++j) {
            cin >> graph[i][j];

            prefixSum[i][j] += prefixSum[i][j - 1] + graph[i][j];
        }
    }

    for (int j = 1; j <= m; ++j) {
        for (int i = 2; i <= n; ++i) {
            prefixSum[i][j] += prefixSum[i - 1][j];
        }
    }

    cin >> h >> w >> sr >> sc >> fr >> fc;

    queue <pii> q;
    q.push({sr, sc});
    dist[sr][sc] = 0;

    while (!q.empty()) {
        int r = q.front().first;
        int c = q.front().second;
        q.pop();

        if (r == fr && c == fc) break;

        for (int i = 0; i < 4; ++i) {
            int nr = r + dy[i];
            int nc = c + dx[i];

            if (!inBound(nr, nc) || dist[nr][nc] != -1) continue;

            if (checkMove(nr, nc)) {
                dist[nr][nc] = dist[r][c] + 1;
                q.push({nr, nc});
            }
        }
    }

    cout << dist[fr][fc] << endl;

    return 0;
}