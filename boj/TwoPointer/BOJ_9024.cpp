/*
 백준 9024 두 수의 합
 22.02.06
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

int t, n, k;
vector <int> arr(1000000);

int main() {
  ios::sync_with_stdio(0); cin.tie(0);
  
  cin >> t;
  
  while (t-->0) {
    cin >> n >> k;
    
    for (int i = 0; i < n; ++i) { cin >> arr[i]; }
    
    sort(arr.begin(), arr.begin() + n);
    
    int val = INF, cnt = 0, l = 0, r = n - 1;
    while (l < r) {
      int sum = abs(arr[l] + arr[r] - k);
      
      if (sum < val) {
        val = sum;
        cnt = 1;
      } else if (sum == val) ++cnt;
      
      if (arr[l] + arr[r] - k < 0) ++l;
      else --r;
    }
    
    cout << cnt << endl;
  }

  
  return 0;
}

