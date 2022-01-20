/*
 백준 4256 트리
 22.01.21
 https://github.com/skyqnaqna/algorithm_study
 */

#include <bits/stdc++.h>

using namespace std;
using ll = long long;
using dd = double;
using pii = pair<int, int>;
using pll = pair<ll, ll>;

#define INF (int)2e9
#define endl "\n"

void input() {
  freopen("input.txt", "r", stdin);
}

void output() {
  ifstream readFile;
  readFile.open("output.txt");

  if (readFile.is_open()) {
    while (!readFile.eof()) {
      string a;
      getline(readFile, a);
      //            ans.push_back(stoi(a));
    }
    readFile.close();
  }
}

int dy[] = {-1, 1, 0, 0, -1, -1, 1, 1};
int dx[] = {0, 0, -1, 1, -1, 1, -1, 1};

//=======================================//

const int MAX = 1001;
int t, n;

vector <int> preorder(MAX), inorder(MAX);

void postorder(int s, int e, int root) {
  for (int i = s; i < e; ++i) {
    if (preorder[root] == inorder[i]) {
      postorder(s, i, root + 1);
      postorder(i + 1, e, root + i - s + 1); // root의 오른쪽 자식의 인덱스는 왼쪽 서브트리 노드의 수 + 1
      cout << preorder[root] << " ";
    }
  }
}

int main() {
  ios::sync_with_stdio(0); cin.tie(0);
  
  cin >> t;
  
  while (t-->0) {
    cin >> n;
    
    for (int i = 0; i < n; ++i) cin >> preorder[i];
    for (int i = 0; i < n; ++i) cin >> inorder[i];
    
    postorder(0, n, 0);
    
    cout << endl;
  }
  
  return 0;
}

