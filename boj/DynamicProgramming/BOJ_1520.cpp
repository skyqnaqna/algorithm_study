/*
 백준 1520 내리막 길
 22.01.09
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

int dy[] = {-1, 1, 0, 0, -1, -1, 1, 1};
int dx[] = {0, 0, -1, 1, -1, 1, -1, 1};

//=======================================//

int n, m, graph[500][500];
vector <vector <int> > dp(500, vector <int> (500, -1));

bool inBound(int r, int c) {
  return 0 <= r && r < n && 0 <= c && c < m;
}

int dfs(int r, int c) {
  if (r == n - 1 && c == m - 1) return 1;
  if (dp[r][c] != -1) return dp[r][c];
  
  dp[r][c] = 0;
  
  for (int i = 0; i < 4; ++i) {
    int nr = r + dy[i];
    int nc = c + dx[i];
    
    if (!inBound(nr, nc)) continue;
    if (graph[nr][nc] < graph[r][c]) dp[r][c] += dfs(nr, nc);
  }
  
  return dp[r][c];
}

int main() {
  ios::sync_with_stdio(0); cin.tie(0);
  
  cin >> n >> m;
  
  for (int i = 0; i < n; ++i) for (int j = 0; j < m; ++j) cin >> graph[i][j];
  
  cout << dfs(0, 0) << endl;
  
  return 0;
}

