/*
 프로그래머스 게임 맵 최단거리
 22.06.16
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


int n, m;

bool inBound(int r, int c) {
  return 0 <= r && r < n && 0 <= c && c < m;
}

int solution(vector<vector<int> > maps)
{
  n = maps.size(), m = maps[0].size();
  
  vector <vector <int> > dist(n, vector <int> (m, -1));
  
  dist[0][0] = 1;
  queue <pair<int, int> > q;
  q.push({0, 0});
  
  while (!q.empty()) {
    int r = q.front().first;
    int c = q.front().second;
    q.pop();
    
    for (int i = 0; i < 4; ++i) {
      int nr = r + dy[i];
      int nc = c + dx[i];
      
      if (!inBound(nr, nc) || maps[nr][nc] == 0 || dist[nr][nc] != -1) continue;
      
      dist[nr][nc] = dist[r][c] + 1;
      q.push({nr, nc});
    }
  }
  
  return dist[n - 1][m - 1];
}

int main() {
  ios::sync_with_stdio(0); cin.tie(0);
  
  
  return 0;
}
