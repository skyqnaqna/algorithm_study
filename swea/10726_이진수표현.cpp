#include<iostream>

using namespace std;

int T;
int n, m;

int main(int argc, char** argv) {
  ios_base::sync_with_stdio(0); cin.tie(0);
  //freopen("input.txt", "r", stdin);
  
  cin>>T;
  
  int test_case;
  int i;
  bool valid;
  
  for(test_case = 1; test_case <= T; ++test_case) {
    cin >> n >> m;
    valid = true;
    
    for (i = 0; i < n; ++i) {
      if ((m & 1) == 0) {
        valid = false;
        break;
      }
      
      m >>= 1;
    }
    
    cout << "#" << test_case << " ";
    if (valid) cout << "ON\n";
    else cout << "OFF\n";
  }
  
  return 0;
}
