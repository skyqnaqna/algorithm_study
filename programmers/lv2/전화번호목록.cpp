/*
 프로그래머스 전화번호 목록
 22.03.23
 https://github.com/skyqnaqna/algorithm_study
 */

#include <bits/stdc++.h>

using namespace std;
using ll = long long;
using dd = double;
using pii = pair<int, int>;
using pll = pair<ll, ll>;
using pil = pair<int, ll>;

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

int dy[] = {-1, 0, 1, 0, -1, -1, 1, 1};
int dx[] = {0, 1, 0, -1, -1, 1, -1, 1};

//=======================================//

const int MAX = 10;
const int NODE_MAX = 20000001;

struct Trie {
  Trie* node[MAX];
  bool isEnd;
  bool hasChild;
  
  Trie() {
    fill(node, node + MAX, nullptr);
    isEnd = hasChild = false;
  }
  
  ~Trie() {
    for (int i = 0; i < MAX; ++i) if (node[i]) delete node[i];
  }
  
  bool insert(string s, Trie* root) {
    Trie* cur = root;
    bool res = true;
    
    for (auto &ch : s) {
      int next = ch - '0';
      if (cur->node[next] == nullptr) cur->node[next] = new Trie;
      cur->hasChild = true;
      if (cur->isEnd) return false;
      cur = cur->node[next];
    }
    
    cur->isEnd = true;
    res = !cur->hasChild;
    
    return res;
  }
};

Trie* root = new Trie;

bool solution(vector<string> phone_book) {
  for (auto &num : phone_book) {
    if (!root->insert(num, root)) return false;
  }
  return true;
}
