/*
 백준 18870 좌표 압축
 22.02.05
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

int n;
vector <int> arr, v;
//unordered_map <int, int> dict;

int main() {
  ios::sync_with_stdio(0); cin.tie(0);
  
  cin >> n;
  for (int i = 0; i < n; ++i) {
    int x; cin >> x;
    arr.push_back(x);
    v.push_back(x);
  }
  
  sort(v.begin(), v.end());
  v.resize(distance(v.begin(), unique(v.begin(), v.end())));
  
//  for (int i = 0; i < v.size(); ++i) dict.insert({v[i], i});
  
  for (auto &it : arr) cout << lower_bound(v.begin(), v.end(), it) - v.begin() << " ";
  
  return 0;
}

