/*
 백준 11812 K진 트리
 22.03.03
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

ll n, k, x, y;
int q;

ll getDepth(ll target) {
  if (k == 1) return target;
  
  ll l = 0, r = 0, depth = 0;
  
  while (target < l || r < target) {
    l = (l * k) + 1;
    r = (r * k) + k;
    ++depth;
  }
  
  return depth;
}

ll lca(ll u, ll v) {
  ll res = 0;
  ll ud = getDepth(u), vd = getDepth(v);
  if (ud < vd) {
    swap(u, v);
    swap(ud, vd);
  }
  
  ll diff = ud - vd;
  res = diff;
  
  if (k == 1) return res;
  
  while (diff-->0) {
    u = (u - 1) / k;
  }
  
  while (u != v) {
    u = (u - 1) / k;
    v = (v - 1) / k;
    res += 2;
  }
  
  return res;
}

int main() {
  ios::sync_with_stdio(0); cin.tie(0);
  cin >> n >> k >> q;
  
  while (q-->0) {
    cin >> x >> y;
    cout << lca(x - 1, y - 1) << endl;
  }
  
  return 0;
}
