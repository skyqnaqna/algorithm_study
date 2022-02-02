/*
 백준 2156 포도주 시식
 22.02.02
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

int n, wine[10001], dp[10001];

int main() {
  ios::sync_with_stdio(0); cin.tie(0);
  
  cin >> n;
  
  for (int i = 1; i <= n; ++i) cin >> wine[i];
  
  dp[1] = wine[1];
  
  if (n > 1) dp[2] = wine[1] + wine[2];
  if (n > 2) {
    for (int i = 3; i <= n; ++i) {
      dp[i] = dp[i - 1];
      dp[i] = max(dp[i], dp[i - 2] + wine[i]);
      dp[i] = max(dp[i], dp[i - 3] + wine[i - 1] + wine[i]);
    }
  }
  
  cout << dp[n] << endl;
  
  return 0;
}

