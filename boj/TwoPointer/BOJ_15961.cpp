/*
 백준 15961 회전 초밥
 22.02.07
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

int n, d, k, c, used[3001];
vector <int> sushi(3000001);

int main() {
  ios::sync_with_stdio(0); cin.tie(0);
  
  cin >> n >> d >> k >> c;

  for (int i = 0; i < n; ++i) cin >> sushi[i];
  
  int cnt = 0;
  for (int i = 0; i < k; ++i)  if (used[sushi[i]]++ == 0) ++cnt;
  
  int answer = used[c] == 0 ? cnt + 1 : cnt;
  int l = 0, r = k % n;
  
  while (l < n) {
    if (--used[sushi[l++]]== 0) --cnt;
    
    if (used[sushi[r]]++ == 0) ++cnt;
    r = (r + 1) % n;
    
    if (used[c] == 0) {
      answer = max(answer, cnt + 1);
    } else {
      answer = max(answer, cnt);
    }
  }
  
  cout << answer << endl;
  
  return 0;
}

