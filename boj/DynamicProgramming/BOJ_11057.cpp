/*
 백준 11057 오르막 수
 21.12.21
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
  //    freopen("input.txt", "r", stdin);
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

int n;
ll dp[11][1001];
const ll MOD = 10007;

int main() {
  ios::sync_with_stdio(0); cin.tie(0);
  
  cin >> n;
  for (int i = 0; i < 10; ++i) {
    dp[i][1] = 1;
    dp[10][1] += dp[i][1];
  }
  
  if (n > 1) {
    for (int j = 2; j <= n; ++j) {
      dp[0][j] = dp[10][j - 1];
      dp[10][j] = dp[0][j];
      for (int i = 1; i < 10; ++i) {
        dp[i][j] = (dp[i - 1][j] % MOD - dp[i - 1][j - 1] % MOD + MOD) % MOD;
        dp[10][j] += dp[i][j] % MOD;
      }
      dp[10][j] %= MOD;
    }
  }
  
  cout << dp[10][n] % MOD << endl;
  
  return 0;
}
