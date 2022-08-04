#include <iostream>
#include <cstring>

using namespace std;

struct Node {
  string data;
  int left, right;
  
  void init() {
    data = "";
    left = 0;
    right = 0;
  }
} nodes[1001];

int n, nodeCnt;

bool isOperator(string s) {
  return s == "+" || s == "-" || s == "*" || s == "/";
}

double solution(int now) {
  if (isOperator(nodes[now].data)) {
    string op = nodes[now].data;
    
    if (op == "+") {
      return solution(nodes[now].left) + solution(nodes[now].right);
    } else if (op == "-") {
      return solution(nodes[now].left) - solution(nodes[now].right);
    } else if (op == "*") {
      return solution(nodes[now].left) * solution(nodes[now].right);
    } else {
      return solution(nodes[now].left) / solution(nodes[now].right);
    }
  } else {
    return stod(nodes[now].data);
  }
}

int main(int argc, char** argv) {
  ios_base::sync_with_stdio(0); cin.tie(0);
  int test_case;
  
//  freopen("input.txt", "r", stdin);
  
  int node, l, r;
  string str;
  for(test_case = 1; test_case <= 10; ++test_case) {
    cin >> n;
    
    for (int i = 0; i < n; ++i) {
      cin >> node >> str;
      nodes[node].init();
      nodes[node].data = str;
      if (isOperator(str)) {
        cin >> l >> r;
        nodes[node].left = l;
        nodes[node].right = r;
      }
    }
    
    cout << "#" << test_case << " " << int(solution(1)) << "\n";
  }
  
  return 0;
}
