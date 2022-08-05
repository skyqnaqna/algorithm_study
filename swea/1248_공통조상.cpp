#include <iostream>
#include <vector>
#include <cstring>

using namespace std;

const int MAX = 10001;
const int K = 18;
int T;
int v, e, a, b;
int parent[MAX][K];
int depth[MAX], size[MAX];
vector <vector <int> > graph(MAX);

void updateSize(int now) {
  while (1 < now) {
    ++size[parent[now][0]];
    now = parent[now][0];
  }
}

void makeTree(int now) {
  ++size[now];
  for (auto &next : graph[now]) {
    parent[next][0] = now;
    depth[next] = depth[now] + 1;
    makeTree(next);
  }
  
  updateSize(now);
}

int main(int argc, char** argv) {
  ios_base::sync_with_stdio(0); cin.tie(0);
  int test_case;
  
//  freopen("input.txt", "r", stdin);
  
  cin >> T;
  
  for(test_case = 1; test_case <= T; ++test_case) {
    memset(parent, 0, sizeof(parent));
    memset(size, 0, sizeof(size));
    memset(depth, 0, sizeof(depth));
    for (int i = 1; i < MAX; ++i) graph[i].clear();
    
    cin >> v >> e >> a >> b;
    
    int p, c;
    for (int i = 0; i < e; ++i) {
      cin >> p >> c;
      graph[p].push_back(c);
    }
    
    makeTree(1);
    
    for (int j = 0; j < K - 1; ++j) {
      for (int i = 1; i <= v; ++i) {
        if (parent[i][j] != 0) {
          parent[i][j + 1] = parent[parent[i][j]][j];
        }
      }
    }
    
    if (depth[a] < depth[b]) swap(a, b);
    int diff = depth[a] - depth[b];
    
    for (int i = 0; diff > 0; ++i) {
      if (diff & 1) a = parent[a][i];
      diff >>= 1;
    }
    
    if (a != b) {
      for (int i = K - 1; i >= 0; --i) {
        if (parent[a][i] > 0 && parent[a][i] != parent[b][i]) {
          a = parent[a][i];
          b = parent[b][i];
        }
      }
      
      a = parent[a][0];
    }
    
    cout << "#" << test_case << " " << a << " " << size[a] << "\n";
  }
  
  return 0;
}
