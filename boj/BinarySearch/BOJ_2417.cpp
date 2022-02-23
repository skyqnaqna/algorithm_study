/*
 백준 2417 정수 제곱근
 22.02.23
 https://github.com/skyqnaqna/algorithm_study
 */

#include <bits/stdc++.h>

using namespace std;
using ll = long long;
using ull = unsigned long long;
using dd = double;
using pii = pair<int, int>;
using pll = pair<ll, ll>;

#define INF 2e9
#define endl "\n"

ull n;

int main() {
  ios::sync_with_stdio(0); cin.tie(0);
  
  cin >> n;
  
  if (n == 0) {
    cout << 0 << endl;
    return 0;
  }
  
  ull mid, l = 0, r = pow(2, 63), ans = 0;
  
  
  while (l <= r) {
    mid = (l + r) / 2;
    
    if (pow(mid, 2) >= n) {
      ans = mid;
      r = mid - 1;
    } else {
      l = mid + 1;
    }
  }
  
  cout << ans << endl;
  
  return 0;
}

