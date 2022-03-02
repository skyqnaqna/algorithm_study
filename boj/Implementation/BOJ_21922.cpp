/*
 백준 21922 학부 연구생 민상
 22.03.02
 https://github.com/skyqnaqna/algorithm_study
 */

#include <bits/stdc++.h>

using namespace std;
using ll = long long;
using dd = double;
using pii = pair<int, int>;
using pll = pair<ll, ll>;
using pil = pair<int, ll>;

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

int dy[] = {-1, 0, 1, 0, -1, -1, 1, 1};
int dx[] = {0, 1, 0, -1, -1, 1, -1, 1};

//=======================================//

const int MAX = 2000;
int n, m, answer, graph[MAX][MAX];
bool visited[4][MAX][MAX];
queue <pair<int, pii> > q;

bool inBound(int r, int c) {
  return 0 <= r && r < n && 0 <= c && c < m;
}

int main() {
  ios::sync_with_stdio(0); cin.tie(0);
  
  cin >> n >> m;
  
  for (int i = 0; i < n; ++i) {
    for (int j = 0; j < m; ++j) {
      cin >> graph[i][j];
      
      if (graph[i][j] == 9) {
        q.push({0, {i, j}});
        for (int k = 0; k < 4; ++k) visited[k][i][j] = true;
      }
    }
  }
  
  while (!q.empty()) {
    int r = q.front().second.first;
    int c = q.front().second.second;
    int d = q.front().first;
    q.pop();
    
    switch (graph[r][c]) {
        int nr, nc, nd;
      case 9:
        for (int i = 0; i < 4; ++i) {
          nr = r + dy[i];
          nc = c + dx[i];
          
          if (!inBound(nr, nc) || visited[i][nr][nc]) continue;
          
          visited[i][nr][nc] = true;
          q.push({i, {nr, nc}});
        }
        
        break;
      case 1:
        if (d == 0 || d == 2) {
          nr = r + dy[d];
          nc = c + dx[d];
          
          if (inBound(nr, nc) && !visited[d][nr][nc]) {
            visited[d][nr][nc] = true;
            q.push({d, {nr, nc}});
          }
        }
        break;
      case 2:
        if (d == 1 || d == 3) {
          nr = r + dy[d];
          nc = c + dx[d];
          
          if (inBound(nr, nc) && !visited[d][nr][nc]) {
            visited[d][nr][nc] = true;
            q.push({d, {nr, nc}});
          }
        }
        break;
      case 3:
        switch (d) {
          case 0:
            nr = r + dy[1];
            nc = c + dx[1];
            nd = 1;
            break;
          case 1:
            nr = r + dy[0];
            nc = c + dx[0];
            nd = 0;
            break;
          case 2:
            nr = r + dy[3];
            nc = c + dx[3];
            nd = 3;
            break;
          case 3:
            nr = r + dy[2];
            nc = c + dx[2];
            nd = 2;
            break;
          default:
            break;
        }
        
        if (inBound(nr, nc) && !visited[nd][nr][nc]) {
          visited[nd][nr][nc] = true;
          q.push({nd, {nr, nc}});
        }
        
        break;
      case 4:
        switch (d) {
          case 0:
            nr = r + dy[3];
            nc = c + dx[3];
            nd = 3;
            break;
          case 1:
            nr = r + dy[2];
            nc = c + dx[2];
            nd = 2;
            break;
          case 2:
            nr = r + dy[1];
            nc = c + dx[1];
            nd = 1;
            break;
          case 3:
            nr = r + dy[0];
            nc = c + dx[0];
            nd = 0;
            break;
          default:
            break;
        }
        
        if (inBound(nr, nc) && !visited[nd][nr][nc]) {
          visited[nd][nr][nc] = true;
          q.push({nd, {nr, nc}});
        }
        
        break;
      default:
        nr = r + dy[d];
        nc = c + dx[d];
        
        if (inBound(nr, nc) && !visited[d][nr][nc]) {
          visited[d][nr][nc] = true;
          q.push({d, {nr, nc}});
        }
    }
  }
  
  for (int i = 0; i < n; ++i) {
    for (int j = 0; j < m; ++j) {
      for (int k = 0; k < 4; ++k) {
        if (visited[k][i][j]) {
          ++answer;
          break;
        }
      }
    }
  }
  
  cout << answer << endl;
  
  return 0;
}

