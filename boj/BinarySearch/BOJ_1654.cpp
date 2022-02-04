/*
 백준 1654 랜선 자르기
 22.02.04
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

int k, n;
vector <ll> lanCable;

int main() {
  ios::sync_with_stdio(0); cin.tie(0);
  
  cin >> k >> n;
  
  ll l = 1, r = 0, answer = 0;
  
  for (int i = 0; i < k; ++i) {
    ll x; cin >> x;
    lanCable.push_back(x);
    
    r = max(r, x);
  }
  
  while (l <= r) {
    ll m = (l + r) / 2;
    
    ll cnt = 0;
    for (auto &cable : lanCable) cnt += cable / m;
    
    if (n <= cnt) {
      answer = max(answer, m);
      l = m + 1;
    } else {
      r = m - 1;
    }
  }
  
  cout << answer << endl;
  
  return 0;
}

