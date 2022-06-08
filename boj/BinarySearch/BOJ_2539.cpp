/*
 백준 2539 모자이크
 22.06.08
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

int n, m, k, cnt;
vector <pii> target;

bool cmp(pii a, pii b) {
  return a.second < b.second;
}

int getCnt(int size) {
  int res = 0, idx = 0;
  
  while (idx < cnt) {
    int r = target[idx].first;
    int c = target[idx++].second;
    
    if (r > size) return 101;
    
    while (idx < cnt && target[idx].first <= size && target[idx].second < c + size) {
      ++idx;
    }
    
    ++res;
  }
  
  return idx < cnt ? 101 : res;
}

int main() {
  ios::sync_with_stdio(0); cin.tie(0);
  
  cin >> n >> m >> k >> cnt;
  
  int row, col, l = 1, r = max(n, m);
  for (int i = 0; i < cnt; ++i) {
    cin >> row >> col;
    target.push_back({row, col});
    
    if (l < row) l = row;
  }
  
  sort(target.begin(), target.end(), cmp);
  
  
  int mid, answer = 0;
  while (l <= r) {
    mid = (l + r) / 2;
    int res = getCnt(mid);
    
    if (res <= k) {
      r = mid - 1;
      answer = mid;
    } else l = mid + 1;
  }
  
  cout << answer << endl;
  
  return 0;
}
