/*
 백준 21939 문제 추천 시스템 Version 1
 22.03.09
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

int dy[] = {-1, 0, 1, 0, -1, -1, 1, 1};
int dx[] = {0, 1, 0, -1, -1, 1, -1, 1};

//=======================================//

int n, m, p, l;
int level[100001];

priority_queue <pii> hard, easy;

int main() {
  ios::sync_with_stdio(0); cin.tie(0);
  
  cin >> n;
  for (int i = 0; i < n; ++i) {
    cin >> p >> l;
    hard.push({l, p});
    easy.push({-l, -p});
    level[p] = l;
  }
  
  cin >> m;
  
  string s;
  while (m-->0) {
    cin >> s;
    
    if (s == "add") {
      cin >> p >> l;
      hard.push({l, p});
      easy.push({-l, -p});
      level[p] = l;
    } else if (s == "recommend") {
      cin >> p;
      
      if (p == 1) {
        while (level[hard.top().second] == 0 || level[hard.top().second] != hard.top().first) {
          hard.pop();
        }
        cout << hard.top().second << endl;
      } else {
        while (level[-easy.top().second] == 0 || level[-easy.top().second] != -easy.top().first) {
          easy.pop();
        }
        cout << -easy.top().second << endl;
      }
    } else {
      cin >> p;
      level[p] = 0;
    }
  }
  
  return 0;
}
