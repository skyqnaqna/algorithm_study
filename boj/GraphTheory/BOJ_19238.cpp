/*
 백준 19238 스타트 택시
 22.01.10
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

int n, m, fuel, taxi[2];
vector <vector <int> > graph;
vector <vector <pii> > passenger;

bool inBound(int r, int c) {
  return 0 <= r && r < n && 0 <= c && c < n && graph[r][c] != 1;
}

int getDist(int sr, int sc, int dr, int dc) {
  vector <vector <bool> > visited(n, vector<bool>(n, false));
  queue <pair <int, pii> > q;
  q.push({0, {sr, sc}});
  visited[sr][sc] = true;
  
  while (!q.empty()) {
    int r = q.front().second.first;
    int c = q.front().second.second;
    int d = q.front().first;
    q.pop();
    
    if (r == dr && c == dc) return d;
    
    for (int i = 0; i < 4; ++i) {
      int nr = r + dy[i];
      int nc = c + dx[i];
      
      if (!inBound(nr, nc)) continue;
      if (!visited[nr][nc]) {
        visited[nr][nc] = true;
        q.push({d + 1, {nr, nc}});
      }
    }
  }
  return -1;
}

bool solution() {
  vector <vector <bool> > visited(n, vector<bool>(n, false));
  queue <pair <int, pii> > q;
  priority_queue<pair <int, pii> > pq;
  q.push({0, {taxi[0], taxi[1]}});
  visited[taxi[0]][taxi[1]] = true;
  
  while (!q.empty()) {
    int r = q.front().second.first;
    int c = q.front().second.second;
    int d = q.front().first;
    q.pop();
    
    if (graph[r][c] == 2) pq.push({-d, {-r, -c}});
    
    for (int i = 0; i < 4; ++i) {
      int nr = r + dy[i];
      int nc = c + dx[i];
      
      if (!inBound(nr, nc)) continue;
      if (!visited[nr][nc]) {
        visited[nr][nc] = true;
        q.push({d + 1, {nr, nc}});
      }
    }
  }
  
  if (pq.empty()) return false;
  int sr = -pq.top().second.first;
  int sc = -pq.top().second.second;
  int findDist = -pq.top().first;
  graph[sr][sc] = 0;
  
  int dr = passenger[sr][sc].first;
  int dc = passenger[sr][sc].second;
  
  int destDist = getDist(sr, sc, dr, dc);
  
  if (destDist == -1) return false;
  if (findDist + destDist <= fuel) {
    fuel -= findDist;
    fuel += destDist;
    taxi[0] = dr;
    taxi[1] = dc;
    return true;
  } else {
    return false;
  }
}

int main() {
  ios::sync_with_stdio(0); cin.tie(0);
  
  cin >> n >> m >> fuel;
  
  for (int i = 0; i < n; ++i) {
    vector <int> v;
    for (int j = 0; j < n; ++j) {
      int a; cin >> a;
      v.push_back(a);
    }
    graph.push_back(v);
    passenger.push_back(vector <pii> (n, {0, 0}));
  }
  
  cin >> taxi[0] >> taxi[1];
  --taxi[0]; --taxi[1];
  
  for (int i = 0; i < m; ++i) {
    int sr, sc, dr, dc;
    cin >> sr >> sc >> dr >> dc;
    passenger[--sr][--sc] = {dr - 1, dc - 1};
    graph[sr][sc] = 2;
  }
  
  int cnt = 0;
  for (int i = 0; i < m; ++i) {
    if (solution()) ++cnt;
    else break;
  }
  
  if (cnt == m) cout << fuel << endl;
  else cout << -1 << endl;
  
  return 0;
}


