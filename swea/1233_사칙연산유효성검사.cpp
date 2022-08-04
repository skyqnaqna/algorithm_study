#include <iostream>
#include <cstring>

using namespace std;

int n, l, r;

int main(int argc, char** argv) {
  ios_base::sync_with_stdio(0); cin.tie(0);
  int test_case;
  
//  freopen("input.txt", "r", stdin);
  
  for(test_case = 1; test_case <= 10; ++test_case) {
    cin >> n;
    
    int answer = 1;
    
    int node;
    string op;
    for (int i = 0; i < n; ++i) {
      cin >> node >> op;
      
      if (node * 2 <= n && (op != "+" &&
                            op != "-" &&
                            op != "*" &&
                            op != "/"))
      {
        answer = 0;
      } else if (node * 2 > n && (op == "+" ||
                                    op == "-" ||
                                    op == "*" ||
                                    op == "/"))
      {
        answer = 0;
      }
      
      if (node * 2 <= n) cin >> l;
      if (node * 2 + 1 <= n) cin >> r;
    }
    cout << "#" << test_case << " " << answer << "\n";
  }
  
  return 0;
}
