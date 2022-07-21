#include <iostream>
#include <cstring>

using namespace std;

const int MOD = 1000000007;
int len, essential, dp[16][10000];
string keeper;

int main(int argc, char** argv) {
  ios_base::sync_with_stdio(0); cin.tie(0);
  int test_case;
  int T;
//  freopen("input.txt", "r", stdin);
  cin>>T;
  for(test_case = 1; test_case <= T; ++test_case) {
    memset(dp, 0, sizeof(dp));
    cin >> keeper;
    
    len = int(keeper.length());
    
    for (int i = 0; i < len; ++i) {
      
      essential = 1 << keeper[i] - 'A';
      
      if (i == 0) {
        essential |= 1;
        
        for (int member = 1; member < 16; ++member) {
          if ((member & essential) != essential) continue;
          dp[member][i] = 1;
        }
        
      } else {
        for (int prev = 1; prev < 16; ++prev) {
          if (dp[prev][i - 1] == 0) continue;
          for (int now = 1; now < 16; ++now) {
            if (((prev & now) > 0) && ((now & essential) > 0)) {
              dp[now][i] = (dp[now][i] + dp[prev][i - 1]) % MOD;
            }
          }
        }
      }
    }
    
//    for (int combi = 1; combi < 16; ++combi) {
//      if ((combi & (1 << 0)) == 0) continue;
//      if ((combi & (1 << keeper[0] - 'A')) == 0) continue;
//      dp[combi][0] = 1;
//    }
//
//    for (int i = 1; i < keeper.length(); ++i) {
//      for (int now = 1; now < 16; ++now) {
//        if ((now & (1 << keeper[i] - 'A')) == 0) continue;
//
//        for (int prev = 1; prev < 16; ++prev) {
//          if ((now & prev) == 0) continue;
//          dp[now][i] += dp[prev][i - 1];
//          dp[now][i] %= MOD;
//        }
//      }
//    }
    
    int answer = 0;
    for (int i = 1; i < 16; ++i) {
      answer = (answer + dp[i][len - 1]) % MOD;
    }
    
    cout << "#" << test_case << " " << answer << "\n";
  }
  return 0;
}
