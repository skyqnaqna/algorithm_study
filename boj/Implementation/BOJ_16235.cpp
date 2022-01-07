/*
 백준 16235 나무 재테크
 22.01.08
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
vector <vector < map <int, int> > > trees(10, vector <map <int, int> >(10));

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
    trees[x - 1][y - 1].insert({z, 1});
  }

  while (k-->0) {
    vector <pair <int ,pii> > deadTrees;
    vector <pair <int, pii> > breedingTrees;

    // 봄
    for (int i = 0; i < n; ++i) {
      for (int j = 0; j < n; ++j) {
        if (!trees[i][j].empty()) {
          map<int, int> agingTrees;
          
          for (auto &tree : trees[i][j]) {
            int age = tree.first;
            int cnt = tree.second;
            
            if (age * cnt <= graph[i][j]) {
              graph[i][j] -= age * cnt;
              agingTrees.insert({age + 1, cnt});
              
              if ((age + 1) % 5 == 0) breedingTrees.push_back({cnt, {i, j}});
              
            } else if (age <= graph[i][j]) {
              int agingCnt = graph[i][j] / age;
              
              graph[i][j] -= age * agingCnt;
              
              agingTrees.insert({age + 1, agingCnt});
              
              if ((age + 1) % 5 == 0) breedingTrees.push_back({agingCnt, {i, j}});
              
              deadTrees.push_back({(age / 2) * (cnt - agingCnt), {i, j}});
            } else {
              deadTrees.push_back({(age / 2) * cnt, {i, j}});
            }
          }
          trees[i][j] = agingTrees;
        }
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
      int cnt = tree.first;
      int r = tree.second.first;
      int c = tree.second.second;

      for (int i = 0; i < 8; ++i) {
        int nr = r + dy[i];
        int nc = c + dx[i];

        if (!inBound(nr, nc)) continue;
        
        if (trees[nr][nc].find(1) != trees[nr][nc].end()) {
//          trees[nr][nc].find(1)->second += cnt;
          trees[nr][nc][1] += cnt;
        } else {
//          trees[nr][nc].insert({1, cnt});
          trees[nr][nc][1] = cnt;
        }
      }
    }

    // 겨울
    for (int i = 0; i < n; ++i) {
      for (int j = 0; j < n; ++j) {
        graph[i][j] += A[i][j];
      }
    }
  }

  int answer = 0;
  for (int i = 0; i < n; ++i) {
    for (int j = 0; j < n; ++j) {
      if (!trees[i][j].empty()) {
        for (auto &tree : trees[i][j]) {
          answer += tree.second;
        }
      }
    }
  }
  
  cout << answer << endl;
  
  return 0;
}

