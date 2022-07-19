#include<iostream>

using namespace std;

int main(int argc, char** argv) {
  ios_base::sync_with_stdio(0); cin.tie(0);
  int test_case;
  int T;
  //freopen("input.txt", "r", stdin);
  cin>>T;
  
  int n;
  int answer = (1 << 10) - 1;
  
  for(test_case = 1; test_case <= T; ++test_case) {
    cin >> n;
    
    int i, sheep, digit = 0;
    
    for (i = 1; ; ++i) {
      sheep = n * i;
      while (sheep > 0) {
        digit |= 1 << (sheep % 10);
        sheep /= 10;
      }
      
      if (digit == answer) {
        cout << "#" << test_case << " " << i * n << "\n";
        break;
      }
    }
  }
  
  return 0;//정상종료시 반드시 0을 리턴해야합니다.
}

