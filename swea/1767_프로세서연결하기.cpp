#include <iostream>
#include <vector>
#include <algorithm>

using namespace std;

vector <pair <int, int> > cores;
int graph[12][12];
int n, maxCnt, minLen;
int dy[] = { -1, 0, 1, 0 };
int dx[] = { 0, 1, 0, -1 };

bool inBound(int r, int c) {
  return 0 <= r && r < n && 0 <= c && c < n;
}

bool checkEdge(int r, int c, int d) {
  int nr = r + dy[d];
  int nc = c + dx[d];
  
  while (inBound(nr, nc)) {
    if (graph[nr][nc] != 0) return false;
    nr += dy[d];
    nc += dx[d];
  }
  
  return true;
}

int setEdge(int r, int c, int d) {
  int nr = r + dy[d];
  int nc = c + dx[d];
  int res = 0;
  
  while (inBound(nr, nc)) {
    graph[nr][nc] = 2;
    nr += dy[d];
    nc += dx[d];
    ++res;
  }
  
  return res;
}

void removeEdge(int r, int c, int d) {
  int nr = r + dy[d];
  int nc = c + dx[d];
  
  while (inBound(nr, nc)) {
    graph[nr][nc] = 0;
    nr += dy[d];
    nc += dx[d];
  }
}

void recursive(int idx, int cnt, int len) {
  if (idx == cores.size()) {
    if (maxCnt < cnt) {
      minLen = len;
      maxCnt = cnt;
    } else if (maxCnt == cnt) {
      minLen = min(minLen, len);
    }
    return;
  }
  
  for (int j = 0; j < 4; ++j) {
    int r = cores[idx].first;
    int c = cores[idx].second;
    
    if (checkEdge(r, c, j)) {
      int cable = setEdge(r, c, j);
      recursive(idx + 1, cnt + 1, len + cable);
      removeEdge(r, c, j);
    }
  }
  
  recursive(idx + 1, cnt, len);
}

int main(int argc, char** argv) {
  ios_base::sync_with_stdio(0); cin.tie(0);
  
  int test_case;
  int T;
//  freopen("input.txt", "r", stdin);
  cin>>T;
  for(test_case = 1; test_case <= T; ++test_case) {
    cin >> n;
    cores.clear();
    maxCnt = 0;
    minLen = int(1e9);
    
    for (int i = 0; i < n; ++i) {
      for (int j = 0; j < n; ++j) {
        cin >> graph[i][j];
        if (graph[i][j] == 1 && 0 < i && 0 < j && i < n - 1 && j < n - 1) {
          cores.push_back({i, j});
        }
      }
    }
    
    recursive(0, 0, 0);
    
    cout << "#" << test_case << " " << minLen << "\n";
  }
  
  return 0;//정상종료시 반드시 0을 리턴해야합니다.
}
