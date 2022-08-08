#include <iostream>
#include <algorithm>
#include <queue>
#include <cstring>

using namespace std;

int n, INF = int(1e9);
int graph[100][100], dist[100][100];
int dy[] = { -1, 0, 1, 0 };
int dx[] = { 0, 1, 0, -1 };

bool inBound(int r, int c) {
  return 0 <= r && r < n && 0 <= c && c < n;
}

int main(int argc, char** argv) {
  cin.tie(0)->sync_with_stdio(0);
  
  int test_case;
  int T;
//  freopen("input.txt", "r", stdin);
  cin>>T;
  for(test_case = 1; test_case <= T; ++test_case) {
    cin >> n;
    fill(&dist[0][0], &dist[99][100], INF);
    
    string s;
    for (int i = 0; i < n; ++i) {
      cin >> s;
      for (int j = 0; j < n; ++j) {
        graph[i][j] = s[j] - '0';
      }
    }
    
    dist[0][0] = 0;
    priority_queue <pair<int, pair<int, int> > > pq;
    pq.push({0, {0, 0}});
    
    while (!pq.empty()) {
      int d = -pq.top().first;
      int r = pq.top().second.first;
      int c = pq.top().second.second;
      pq.pop();
      
      if (dist[r][c] < d) continue;
      
      for (int i = 0; i < 4; ++i) {
        int nr = r + dy[i];
        int nc = c + dx[i];
        
        if (!inBound(nr, nc)) continue;
        
        if (d + graph[nr][nc] < dist[nr][nc]) {
          dist[nr][nc] = d + graph[nr][nc];
          pq.push({-dist[nr][nc], {nr, nc}});
        }
      }
    }
    
    cout << "#" << test_case << " " << dist[n - 1][n - 1] << "\n";
    
  }
  return 0;
}
