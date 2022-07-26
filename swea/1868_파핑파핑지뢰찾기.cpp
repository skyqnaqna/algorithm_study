#include <iostream>
#include <vector>
#include <cstring>
#include <queue>

using namespace std;

vector <pair<int, int> > mine;
int graph[300][300];
int n, cnt, answer;
int dy[] = { -1, 0, 1, 0, -1, -1, 1, 1 };
int dx[] = { 0, 1, 0, -1, -1, 1, -1, 1 };
bool isVisited[300][300];

bool inBound(int r, int c) {
  return 0 <= r && r < n && 0 <= c && c < n;
}

void bfs(int row, int col) {
  isVisited[row][col] = true;
  queue<pair<int, int> > q;
  q.push({row, col});
  --cnt;
  
  while (!q.empty()) {
    int r = q.front().first;
    int c = q.front().second;
    q.pop();
    
    for (int i = 0; i < 8; ++i) {
      int nr = r + dy[i];
      int nc = c + dx[i];
      
      if (!inBound(nr, nc) || isVisited[nr][nc] || graph[nr][nc] == -1) continue;
      
      --cnt;
      isVisited[nr][nc] = true;
      if (graph[nr][nc] == 0) q.push({nr, nc});
    }
  }
}

int main(int argc, char** argv) {
  ios_base::sync_with_stdio(0); cin.tie(0);
  
  int test_case;
  int T;
//  freopen("input.txt", "r", stdin);
  cin>>T;
  for(test_case = 1; test_case <= T; ++test_case) {
    cin >> n;
    
    answer = 0;
    cnt = n * n;
    mine.clear();
    memset(graph, 0, sizeof(graph));
    memset(isVisited, false, sizeof(isVisited));
    
    string s;
    for (int i = 0; i < n; ++i) {
      cin >> s;
      for (int j = 0; j < n; ++j) {
        if (s[j] == '*') {
          --cnt;
          graph[i][j] = -1;
          mine.push_back({i, j});
        }
      }
    }
    
    for (auto &pos : mine) {
      int r = pos.first;
      int c = pos.second;
      for (int i = 0; i < 8; ++i) {
        int nr = r + dy[i];
        int nc = c + dx[i];
        
        if (!inBound(nr, nc) || graph[nr][nc] == -1) continue;
        ++graph[nr][nc];
      }
    }
    
    for (int i = 0; i < n; ++i) {
      for (int j = 0; j < n; ++j) {
        if (graph[i][j] == 0 && !isVisited[i][j]) {
          bfs(i, j);
          ++answer;
        }
      }
    }
    
    cout << "#" << test_case << " " << answer + cnt << "\n";
  }
  
  return 0;//정상종료시 반드시 0을 리턴해야합니다.
}
