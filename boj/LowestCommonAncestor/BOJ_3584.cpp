/*
 백준 3584 가장 가까운 공통 조상
 22.02.22
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

int dy[] = {-1, 1, 0, 0, -1, -1, 1, 1};
int dx[] = {0, 0, -1, 1, -1, 1, -1, 1};

//=======================================//

const int MAX = 10001;

int t, n, a, b, rootNum;
int parent[MAX][20], root[MAX], depth[MAX];
bool visited[MAX];
vector <vector <int> > tree(MAX, vector<int>());

void bfs(int start) {
  memset(visited, false, sizeof(visited));
  
  queue <pii> q;
  visited[start] = true;
  q.push({start, 0});
  depth[start] = 0;
  
  while (!q.empty()) {
    int now = q.front().first;
    int dist = q.front().second;
    q.pop();
    
    for (auto &next : tree[now]) {
      if (visited[next]) continue;
      
      visited[next] = true;
      depth[next] = dist + 1;
      parent[next][0] = now;
      q.push({next, dist + 1});
    }
  }
}

void makeSparseTable() {
  for (int j = 0; j < 20; ++j) {
    for (int i = 1; i <= n; ++i) {
      if (parent[i][j] != 0) {
        parent[i][j + 1] = parent[parent[i][j]][j];
      }
    }
  }
}

int lca(int _u, int _v) {
  int u = _u, v = _v;
  if (depth[u] < depth[v]) swap(u, v);
  
  int diff = depth[u] - depth[v];
  
  for (int i = 0; diff > 0; ++i) {
    if (diff % 2 == 1) {
      u = parent[u][i];
    }
    
    diff /= 2;
  }
  
  if (u != v) {
    for (int k = 19; k >= 0; --k) {
      if (parent[u][k] != 0 && parent[u][k] != parent[v][k]) {
        u = parent[u][k];
        v = parent[v][k];
      }
    }
    u = parent[u][0];
  }
  
  return u;
}

int main() {
  ios::sync_with_stdio(0); cin.tie(0);
  cin >> t;
  
  while (t-->0) {
    cin >> n;
    
    memset(root, 0, sizeof(root));
    memset(parent, 0, sizeof(parent));
    for (int i = 1; i <= n; ++i) tree[i].clear();
    
    for (int i = 0; i < n - 1; ++i) {
      cin >> a >> b;
      tree[a].push_back(b);
      root[b] = a;
      if (root[a] == 0) root[a] = -1;
    }
    
    for (int i = 1; i <= n; ++i) {
      if (root[i] == -1) {
        rootNum = i;
        break;
      }
    }
    
    bfs(rootNum);
    makeSparseTable();
    
    cin >> a >> b;
    cout << lca(a, b) << endl;
  }
  
  return 0;
}

