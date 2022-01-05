/*
 백준 20327 배열 돌리기 6
 22.01.05
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
  //    freopen("input.txt", "r", stdin);
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

int n, r, N;
vector <vector <int> > graph;

void topDownReverse(int size, int arrSize, int row) {
  int top = row, bottom = row + size - arrSize;
  
  while (top < bottom) {
    for (int i = 0; i < arrSize; ++i) {
      vector <int> v = graph[top + i];
      graph[top + i] = graph[bottom + i];
      graph[bottom + i] = v;
    }
    top += arrSize;
    bottom -= arrSize;
  }
}

void leftRightReverse(int size, int arrSize, int col) {
  for (int r = 0; r < N; ++r) {
    int left = col, right = col + size - arrSize;
    while (left < right) {
      for (int i = 0; i < arrSize; ++i) {
        int temp = graph[r][left + i];
        graph[r][left + i] = graph[r][right + i];
        graph[r][right + i] = temp;
      }
      left += arrSize;
      right -= arrSize;
    }
  }
}

void rotateRight(int size, int arrSize, int row, int col) {
  int r1 = row, r2 = row + size - arrSize;
  int c1 = col, c2 = col + size - arrSize;
  
  while (r1 < r2) {
    for (int k = 0; k < r2 - r1; k += arrSize) {
      for (int i = 0; i < arrSize; ++i) {
        for (int j = 0; j < arrSize; ++j) {
          int temp = graph[r1 + i][c1 + k + j]; // top
          graph[r1 + i][c1 + k + j] = graph[r2 - k + i][c1 + j]; // left
          graph[r2 - k + i][c1 + j] = graph[r2 + i][c2 - k + j]; // bottom
          graph[r2 + i][c2 - k + j] = graph[r1 + k + i][c2 + j]; // right
          graph[r1 + k + i][c2 + j] = temp;
        }
      }
    }
    
    r1 += arrSize;
    r2 -= arrSize;
    c1 += arrSize;
    c2 -= arrSize;
  }
}

void rotateLeft(int size, int arrSize, int row, int col) {
  int r1 = row, r2 = row + size - arrSize;
  int c1 = col, c2 = col + size - arrSize;
  
  while (r1 < r2) {
    for (int k = 0; k < r2 - r1; k += arrSize) {
      for (int i = 0; i < arrSize; ++i) {
        for (int j = 0; j < arrSize; ++j) {
          int temp = graph[r1 + i][c1 + k + j];
          graph[r1 + i][c1 + k + j] = graph[r1 + k + i][c2 + j];
          graph[r1 + k + i][c2 + j] = graph[r2 + i][c2 - k + j];
          graph[r2 + i][c2 - k + j] = graph[r2 - k + i][c1 + j];
          graph[r2 - k + i][c1 + j] = temp;
        }
      }
    }
    
    r1 += arrSize;
    r2 -= arrSize;
    c1 += arrSize;
    c2 -= arrSize;
  }
}

int main() {
  ios::sync_with_stdio(0); cin.tie(0);

  cin >> n >> r;
  
  N = pow(2, n);
  
  for (int i = 0; i < N; ++i) {
    vector <int> v;
    for (int j = 0; j < N; ++j) {
      int a; cin >> a;
      v.push_back(a);
    }
    graph.push_back(v);
  }
  
  while (r-->0) {
    int k, l;
    cin >> k >> l;
    
    int size = pow(2, l);
    switch (k) {
      case 1:
        for (int i = 0; i < N; i += size) {
          topDownReverse(size, 1, i);
        }
        break;
      case 2:
        for (int i = 0; i < N; i += size) {
          leftRightReverse(size, 1, i);
        }
        break;
      case 3:
        for (int i = 0; i < N; i += size) {
          for (int j = 0; j < N; j += size) {
            rotateRight(size, 1, i, j);
          }
        }
        break;
      case 4:
        for (int i = 0; i < N; i += size) {
          for (int j = 0; j < N; j += size) {
            rotateLeft(size, 1, i, j);
          }
        }
        break;
      case 5:
        topDownReverse(N, size, 0);
        break;
      case 6:
        leftRightReverse(N, size, 0);
        break;
      case 7:
        rotateRight(N, size, 0, 0);
        break;
      case 8:
        rotateLeft(N, size, 0, 0);
        break;
    }
  }
  
  for (int i = 0; i < N; ++i) {
    for (auto &it : graph[i]) {
      cout << it << " ";
    }
    cout << endl;
  }

  return 0;
}
