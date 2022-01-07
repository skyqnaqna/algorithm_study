/*
 백준 16235 나무 재테크
 22.01.06
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

int n, m, k;
vector <vector <int> > graph(10, vector<int>(10, 5));
vector <vector <int> > A;
deque <pair <int, pii> > trees;

int dy[] = {-1, 1, 0, 0, -1, -1, 1, 1};
int dx[] = {0, 0, -1, 1, -1, 1, -1, 1};

bool inBound(int r, int c) {
  return 0 <= r && r < n && 0 <= c && c < n;
}

int main() {
  ios::sync_with_stdio(0); cin.tie(0);
  
  cin >> n >> m >> k;
  
  for (int i = 0; i < n; ++i) {
    vector <int> v;
    int a;
    for (int j = 0; j < n; ++j) {
      cin >> a;
      v.push_back(a);
    }
    A.push_back(v);
  }
  
  for (int i = 0; i < m; ++i) {
    int x, y, z;
    cin >> x >> y >> z;
    trees.push_back({z, {--x, --y}});
  }
  
  sort(trees.begin(), trees.end());
  
  while (k-->0) {
    vector <pair <int ,pii> > deadTrees;
    vector <pii> breedingTrees;
    
    int size = trees.size();
    
    // 봄
    for (int i = 0; i < size; ++i) {
      int age = trees.front().first;
      int r = trees.front().second.first;
      int c = trees.front().second.second;
      trees.pop_front();
      
      if (graph[r][c] < age) {
        deadTrees.push_back({age / 2, {r, c}});
        continue;
      }
      
      graph[r][c] -= age++;
      trees.push_back({age, {r, c}});
      
      if (age % 5 == 0) {
        breedingTrees.push_back({r, c});
      }
    }
    
    // 여름
    for (auto &tree : deadTrees) {
      int nutrient = tree.first;
      int r = tree.second.first;
      int c = tree.second.second;
      
      graph[r][c] += nutrient;
    }
    
    // 가을
    for (auto &tree : breedingTrees) {
      int r = tree.first;
      int c = tree.second;
      
      for (int i = 0; i < 8; ++i) {
        int nr = r + dy[i];
        int nc = c + dx[i];
        
        if (!inBound(nr, nc)) continue;
        
        trees.push_front({1, {nr, nc}});
      }
    }
    
    // 겨울
    for (int i = 0; i < n; ++i) {
      for (int j = 0; j < n; ++j) {
        graph[i][j] += A[i][j];
      }
    }
  }
  
  cout << trees.size() << endl;

  return 0;
}
