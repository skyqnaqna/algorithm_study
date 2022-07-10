/*
 백준 16927 배열 돌리기 2
 22.07.09
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

int n, m, r, graph[301][301];

void rotateLeft(int cnt) {
  int r1 = 0, c1 = 0, r2 = n - 1, c2 = m - 1;
  int width = m, height = n;
  
  while (min(width, height) > 1) {
    int round = cnt % ((width - 1) * 2 + (height - 1) * 2);
    
    while (round-- > 0) {
      int temp = graph[r1][c1];
      
      // Top
      for (int i = 0; i < width - 1; ++i) {
        graph[r1][c1 + i] = graph[r1][c1 + i + 1];
      }
      
      // Right
      for (int i = 0; i < height - 1; ++i) {
        graph[r1 + i][c2] = graph[r1 + i + 1][c2];
      }
      
      // Bottom
      for (int i = 0; i < width - 1; ++i) {
        graph[r2][c2 - i] = graph[r2][c2 - i - 1];
      }
      
      // Left
      for (int i = 0; i < height - 1; ++i) {
        graph[r2 - i][c1] = graph[r2 - i - 1][c1];
      }
      
      graph[r1 + 1][c1] = temp;
    }
    
    ++r1; ++c1;
    --r2; --c2;
    width -= 2; height -= 2;
  }
}

int main() {
  ios::sync_with_stdio(0); cin.tie(0);
  
  cin >> n >> m >> r;

  for (int i = 0; i < n; ++i)
    for (int j = 0; j < m; ++j)
      cin >> graph[i][j];
  
  rotateLeft(r);
  
  for (int i = 0; i < n; ++i) {
    for (int j = 0; j < m; ++j) {
      cout << graph[i][j] << " ";
    }
    cout << endl;
  }

  return 0;
}

