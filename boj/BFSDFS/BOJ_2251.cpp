/*
 백준 2251 물통
 22.03.13
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

const int MAX = 201;
int A, B, C;
vector <int> res;
bool visited[MAX][MAX][MAX];

int main() {
  ios::sync_with_stdio(0); cin.tie(0);
  
  cin >> A >> B >> C;
  
  queue <tuple<int, int, int> > q;
  q.push({0, 0, C});
  visited[0][0][C] = true;
  
  int a, b, c;
  int na, nb, nc;
  
  while (!q.empty()) {
    tie(a, b, c) = q.front();
    q.pop();
    na = a; nb = b; nc = c;
    
    if (a == 0) res.push_back(c);
    
    if (a > 0) {
      if (a <= B - b) {
        na = 0; nb = a + b;
      } else {
        na = a - (B - b); nb = B;
      }
      nc = c;
      if (!visited[na][nb][nc]) {
        visited[na][nb][nc] = true;
        q.push({na, nb, nc});
      }
      
      if (a <= C - c) {
        na = 0; nc = a + c;
      } else {
        na = a - (C - c); nc = C;
      }
      nb = b;
      if (!visited[na][nb][nc]) {
        visited[na][nb][nc] = true;
        q.push({na, nb, nc});
      }
    }
    
    if (b > 0) {
      if (b <= A - a) {
        nb = 0; na = a + b;
      } else {
        nb = b - (A - a); na = A;
      }
      nc = c;
      if (!visited[na][nb][nc]) {
        visited[na][nb][nc] = true;
        q.push({na, nb, nc});
      }
      
      if (b <= C - c) {
        nb = 0; nc = b + c;
      } else {
        nb = b - (C - c); nc = C;
      }
      na = a;
      if (!visited[na][nb][nc]) {
        visited[na][nb][nc] = true;
        q.push({na, nb, nc});
      }
    }
    
    if (c > 0) {
      if (c <= A - a) {
        nc = 0; na = a + c;
      } else {
        nc = c - (A - a); na = A;
      }
      nb = b;
      if (!visited[na][nb][nc]) {
        visited[na][nb][nc] = true;
        q.push({na, nb, nc});
      }
      
      if (c <= B - b) {
        nc = 0; nb = b + c;
      } else {
        nc = c - (B - b); nb = B;
      }
      na = a;
      if (!visited[na][nb][nc]) {
        visited[na][nb][nc] = true;
        q.push({na, nb, nc});
      }
    }
  }
  
  sort(res.begin(), res.end());
  
  for (auto &it : res) cout << it << " ";
  
  return 0;
}
