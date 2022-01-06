/*
 백준 17471 게리맨더링
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

int n, population[10];
vector < vector <int> > graph;
vector <bool> area(10);

bool checkConnected(vector<int> &v, bool nowArea) {
  vector <bool> visited(10, false);
  queue <int> q;
  q.push(v[0]);
  visited[v[0]] = true;
  
  int visitCount = 1;
  
  while (!q.empty()) {
    int now = q.front();
    q.pop();
    
    for (auto &next : graph[now]) {
      if (area[next] == nowArea && !visited[next]) {
        q.push(next);
        visited[next] = true;
        ++visitCount;
      }
    }
  }
  
  return visitCount == v.size();
}


int main() {
  ios::sync_with_stdio(0); cin.tie(0);
  
  cin >> n;
  
  for (int i = 0; i < n; ++i) cin >> population[i];
  for (int i = 0; i < n; ++i) {
    vector <int> v;
    int m, a;
    cin >> m;
    for (int j = 0; j < m; ++j) {
      cin >> a;
      v.push_back(--a);
    }
    graph.push_back(v);
  }
  
  int answer = INF;
  // 0x00~00, 0x11~11 제외
  for (int k = 1; k < pow(2, n) - 1; ++k) {
    vector<int>red, blue;
    
    for (int i = 0; i < n; ++i) {
      if ((k & (1<<i)) != 0) {
        red.push_back(i);
        area[i] = true;
      } else {
        blue.push_back(i);
        area[i] = false;
      }
    }
    
    if (checkConnected(red, true) && checkConnected(blue, false)) {
      int cntRed = 0, cntBlue = 0;
      
      for (auto &it : red) cntRed += population[it];
      for (auto &it : blue) cntBlue += population[it];
      
      answer = min(answer, abs(cntRed - cntBlue));
    }
  }
  
  if (answer == INF) cout << -1 << endl;
  else cout << answer << endl;

  return 0;
}
