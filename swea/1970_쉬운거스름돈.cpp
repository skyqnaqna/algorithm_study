#include <iostream>
#include <cstring>

using namespace std;

int n;
int money[] = { 50000, 10000, 5000, 1000, 500, 100, 50, 10 };

int main(int argc, char** argv) {
  ios_base::sync_with_stdio(0); cin.tie(0);
  int test_case;
  int T;
  //freopen("input.txt", "r", stdin);
  cin>>T;
  for(test_case = 1; test_case <= T; ++test_case) {
    
    cin >> n;
    
    cout << "#" << test_case << "\n";
    for (int i = 0; i < 8; ++i) {
      cout << n / money[i] << " ";
      n %= money[i];
    }
    cout << "\n";
  }
  return 0;//정상종료시 반드시 0을 리턴해야합니다.
}
