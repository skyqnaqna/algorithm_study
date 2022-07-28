#include <iostream>
#include <cstring>

using namespace std;

int n, k, v[100], c[100], dp[1001];

int main(int argc, char** argv) {
  ios_base::sync_with_stdio(0); cin.tie(0);
  int test_case;
  int T;
  //freopen("input.txt", "r", stdin);
  cin>>T;
  for(test_case = 1; test_case <= T; ++test_case) {
    
    cin >> n >> k;
    memset(dp, 0, sizeof(dp));
    for (int i = 0; i < n; ++i) cin >> v[i] >> c[i];
    
    for (int i = 0; i < n; ++i) {
      for (int j = k; j >= v[i]; --j) {
        dp[j] = max(dp[j], dp[j - v[i]] + c[i]);
      }
    }

    cout << "#" << test_case << " " << dp[k] << "\n";
  }
  return 0;//정상종료시 반드시 0을 리턴해야합니다.
}
