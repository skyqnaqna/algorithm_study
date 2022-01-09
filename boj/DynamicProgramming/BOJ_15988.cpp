/*
 백준 15988 1, 2, 3 더하기 3
 22.01.10
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

int dy[] = {-1, 1, 0, 0, -1, -1, 1, 1};
int dx[] = {0, 0, -1, 1, -1, 1, -1, 1};

//=======================================//

int t;
ll n, dp[1000001];
const ll MOD = 1000000009;

int main() {
  ios::sync_with_stdio(0); cin.tie(0);
  
  cin >> t;
  
  dp[1] = 1; dp[2] = 2; dp[3] = 4;
  
  for (int i = 4; i < 1000001; ++i) dp[i] = (dp[i - 3] + dp[i - 2] + dp[i - 1]) % MOD;
  while (t-->0) {
    cin >> n;
    cout << dp[n] << endl;
  }
  
  return 0;
}

