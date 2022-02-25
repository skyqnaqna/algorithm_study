/*
 백준 1786 찾기
 22.02.26
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

const int MAX = 1000000;

string text, pattern;
int n, m, skip[MAX];
vector <int> answer;

void makeFailureTable() {
  int j = 0;
  for (int i = 1; i < m; ++i) {
    while (j > 0 && pattern[i] != pattern[j]) j = skip[j - 1];
    if (pattern[i] == pattern[j]) skip[i] = ++j;
  }
}

void kmp() {
  int j = 0;
  for (int i = 0; i < n; ++i) {
    while (j > 0 && text[i] != pattern[j]) j = skip[j - 1];
    
    if (text[i] == pattern[j]) {
      if (j == m - 1) {
        answer.push_back(i - m + 2);
        j = skip[j];
      } else {
        ++j;
      }
    }
  }
}

int main() {
  ios::sync_with_stdio(0); cin.tie(0);
  
  getline(cin, text);
  getline(cin, pattern);
  n = text.length();
  m = pattern.length();
  
  makeFailureTable();
  kmp();
  
  cout << answer.size() << endl;
  for (auto &res : answer) cout << res << " ";
  
  return 0;
}

