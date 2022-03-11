/*
 백준 22863 원상 복구 (large)
 22.03.11
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

const int MAX = int(1e6 + 1);

ll n, k;

int d[MAX], s[MAX], cycle[MAX], result[MAX];
bool visited[MAX];

int main() {
  ios::sync_with_stdio(0); cin.tie(0);
  
  cin >> n >> k;
  
  for (int i = 0; i < n; ++i) {
    cin >> s[i];
  }
  
  for (int i = 0; i < n; ++i) {
    cin >> d[i];
    --d[i];
  }
  
  for (int i = 0; i < n; ++i) {
    if (visited[i]) continue;
    ll cnt = 0;
    int cur = i;
    
    while (!visited[cur]) {
      visited[cur] = true;
      cycle[cnt++] = cur;
      cur = d[cur];
    }
    
    for (ll j = 0; j < cnt; ++j) {
      result[cycle[(j + k) % cnt]] = s[cycle[j]];
    }
  }
  
  for (int i = 0; i < n; ++i) {
    cout << result[i] << " ";
  }
  
  return 0;
}
