#include <iostream>
#include <cstring>

using namespace std;

string a, b;
int n, m;
int dp[1001][1001];

int main(int argc, char** argv) {
  ios_base::sync_with_stdio(0); cin.tie(0);
  int test_case;
  int T;
  //freopen("input.txt", "r", stdin);
  cin>>T;
  for(test_case = 1; test_case <= T; ++test_case) {
    
    cin >> a >> b;
    memset(dp, 0, sizeof(dp));
    n = a.length();
    m = b.length();

    for (int i = 1; i <= n; ++i) {
      for (int j = 1; j <= m; ++j) {
        if (a[i - 1] == b[j - 1]) dp[i][j] = dp[i - 1][j - 1] + 1;
        else dp[i][j] = max(dp[i - 1][j], dp[i][j - 1]);
      }
    }

    cout << "#" << test_case << " " << dp[n][m] << "\n";
  }
  return 0;//정상종료시 반드시 0을 리턴해야합니다.
}
