/*
 백준 5397 키로거
 22.02.13
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

int dy[] = {-1, 1, 0, 0, -1, -1, 1, 1};
int dx[] = {0, 0, -1, 1, -1, 1, -1, 1};

//=======================================//

struct Node {
  char c;
  Node *next, *pre;
  
  Node* alloc(char _c, Node* _pre, Node* _next) {
    c = _c;
    pre = _pre;
    next = _next;
    _next->pre = this;
    return this;
  }
} node[1000000];

int cnt, t;
Node head, tail;

int main() {
  ios::sync_with_stdio(0); cin.tie(0);
  
  cin >> t;
  
  while (t-->0) {
    string s; cin >> s;
    cnt = 0;
    head.next = &tail;
    tail.pre = &head;
    Node* cur = &head;
    
    for (auto &ch : s) {
      if (ch == '<') {
        if (cur != &head) {
          cur = cur->pre;
        }
      } else if (ch == '>') {
        if (cur->next != &tail) {
          cur = cur->next;
        }
      } else if (ch == '-') {
        if (cur != &head) {
          cur->next->pre = cur->pre;
          cur->pre->next = cur->next;
          cur = cur->pre;
        }
      } else {
        cur->next = node[cnt++].alloc(ch, cur, cur->next);
        cur = cur->next;
      }
    }
    
    cur = &head;
    while (cur->next != &tail) {
      cout << cur->next->c;
      cur = cur->next;
    }
    cout << endl;
  }
  
  return 0;
}

