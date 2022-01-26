/*
 백준 9252 LCS 2
 22.01.26
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

const int MAX = 1001;

string a, b;
int lcs[MAX][MAX];

string solve() {
  string res;
  
  int i = a.length(), j = b.length();
  
  while (lcs[i][j] != 0) {
    if (lcs[i - 1][j] == lcs[i][j]) {
      --i;
    } else if (lcs[i][j - 1] == lcs[i][j]) {
      --j;
    } else {
      res += a[i - 1];
      --i;
      --j;
    }
  }
  
  reverse(res.begin(), res.end());
  return res;
}

int main() {
  ios::sync_with_stdio(0); cin.tie(0);
  
  cin >> a >> b;
  
  for (int i = 1; i <= a.length(); ++i) {
    for (int j = 1; j <= b.length(); ++j) {
      if (a[i - 1] != b[j - 1]) lcs[i][j] = max(lcs[i - 1][j], lcs[i][j - 1]);
      else lcs[i][j] = lcs[i - 1][j - 1] + 1;
    }
  }
  
  if (!lcs[a.length()][b.length()]) cout << 0 << endl;
  else cout << lcs[a.length()][b.length()] << endl << solve() << endl;
  
  return 0;
}

