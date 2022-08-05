#include <iostream>
#include <queue>
#include <vector>
#include <cstring>
#include <math.h>

using namespace std;

const int MAX = 100001;
const int K = 18;
int T, n;
long long answer;
int parent[MAX][K], depth[MAX];
vector <vector <int> > tree(MAX);

long long LCA(int _u, int _v) {
  long long res = 0;
  int u = _u, v = _v;
  
  if (depth[u] < depth[v]) swap(u, v);
  
  int diff = depth[u] - depth[v];
  res += diff;
  
  for (int i = 0; diff > 0; ++i) {
    if (diff & 1) u = parent[u][i];
    diff >>= 1;
  }
  
  if (u != v) {
    for (int i = K - 1; i >= 0; --i) {
      if (parent[u][i] > 0 && parent[u][i] != parent[v][i]) {
        u = parent[u][i];
        v = parent[v][i];
        res += (long long)(1 << (i + 1));
      }
    }
    
    u = parent[u][0];
    res += 2;
  }
  
  return res;
}

int main(int argc, char** argv) {
  ios_base::sync_with_stdio(0); cin.tie(0);
  int test_case;
  
//  freopen("input.txt", "r", stdin);
  
  cin >> T;
  
  for(test_case = 1; test_case <= T; ++test_case) {
    memset(parent, 0, sizeof(parent));
    memset(depth, 0, sizeof(depth));
    answer = 0;
    for (int i = 1; i < MAX; ++i) tree[i].clear();
    
    cin >> n;
    
    int p;
    for (int i = 2; i <= n; ++i) {
      cin >> p;
      tree[p].push_back(i);
      parent[i][0] = p;
    }
    
    for (int j = 0; j < K - 1; ++j) {
      for (int i = 1; i <= n; ++i) {
        if (parent[i][j] > 0) {
          parent[i][j + 1] = parent[parent[i][j]][j];
        }
      }
    }
    
    queue <int> q;
    q.push(1);
    
    while (!q.empty()) {
      int now = q.front();
      q.pop();
      
      for (auto &next : tree[now]) {
        depth[next] = depth[now] + 1;
        q.push(next);
      }
      
      if (q.empty()) break;
      
      answer += LCA(now, q.front());
    }
    
    cout << "#" << test_case << " " << answer << "\n";
  }
  
  return 0;
}
