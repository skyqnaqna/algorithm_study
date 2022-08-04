#include <iostream>
#include <cstring>
#include <unordered_set>

using namespace std;

int n, m;

int main(int argc, char** argv) {
  ios_base::sync_with_stdio(0); cin.tie(0);
  int test_case;
  int T;
  //freopen("input.txt", "r", stdin);
  cin>>T;
  
  for(test_case = 1; test_case <= T; ++test_case) {
    cin >> n >> m;
    
    unordered_set <string> a, b;
    int answer = 0;
    
    string s;
    for (int i = 0; i < n; ++i) {
      cin >> s;
      a.insert(s);
    }
    
    for (int i = 0; i < m; ++i) {
      cin >> s;
      b.insert(s);
    }
    
    for (auto &it : a) {
      if (b.find(it) != b.end()) ++answer;
    }
    
    cout << "#" << test_case << " " << answer << "\n";
  }
  return 0;
}
