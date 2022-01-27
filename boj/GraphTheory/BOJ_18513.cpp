/*
 백준 18513 샘터
 22.01.28
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

int n, k;
unordered_set <int> visited;
queue <pil> q;

int main() {
  ios::sync_with_stdio(0); cin.tie(0);
  
  cin >> n >> k;
  
  int x;
  for (int i = 0; i < n; ++i) {
    cin >> x;
    q.push({x, 0});
    visited.insert(x);
  }
  
  ll answer = 0;
  
  while (!q.empty()) {
    int now = q.front().first;
    ll dist = q.front().second;
    q.pop();
    
    if (visited.find(now + 1) == visited.end()) {
      q.push({now + 1, dist + 1});
      answer += dist + 1;
      --k;
      visited.insert(now + 1);
    }
    
    if (k == 0) break;
    
    if (visited.find(now - 1) == visited.end()) {
      q.push({now - 1, dist + 1});
      answer += dist + 1;
      --k;
      visited.insert(now - 1);
    }
    
    if (k == 0) break;
  }
  
  cout << answer << endl;
  
  return 0;
}

