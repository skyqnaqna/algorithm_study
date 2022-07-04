/*
 백준 23309 철도 공사
 22.07.04
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

const int MAX = 2000000;

struct ListNode {
  int num = 0;
  ListNode * next;
  ListNode * prev;
  
  ListNode* myAlloc(int num, ListNode* prev, ListNode* next) {
    this->num = num;
    this->prev = prev;
    this->next = next;
    next->prev = this;
    
    return this;
  }
  
} node[MAX];

ListNode head;
int n, m, bufferCnt;
ListNode* numbers[(MAX >> 1) + 1];


int main() {
  ios::sync_with_stdio(0); cin.tie(0);
  
  cin >> n >> m;
  
  head.next = &head;
  
  int x;
  ListNode *cur = &head;
  for (int i = 0; i < n; ++i) {
    cin >> x;
    
    cur->next = node[bufferCnt++].myAlloc(x, cur, cur->next);
    cur = cur->next;
    numbers[x] = cur;
  }
  head.next->prev = cur;
  cur->next = head.next;
  
  int i, j;
  string op;
  for (int k = 0; k < m; ++k) {
    cin >> op;
    
    if (op == "BN") {
      cin >> i >> j;
      cur = numbers[i];
      cout << cur->next->num << endl;
      
      cur->next = node[bufferCnt++].myAlloc(j, cur, cur->next);
      numbers[j] = cur;
      cur = cur->next;
      numbers[j] = cur;
      
    } else if (op == "BP") {
      cin >> i >> j;
      cur = numbers[i];
      cout << cur->prev->num << endl;
      
      cur = cur->prev;
      cur->next = node[bufferCnt++].myAlloc(j, cur, cur->next);
      cur = cur->next;
      numbers[j] = cur;
      
    } else if (op == "CN") {
      cin >> i;
      cur = numbers[i];
      cout << cur->next->num << endl;
      
      cur->next->next->prev = cur;
      cur->next = cur->next->next;
      
    } else {
      cin >> i;
      cur = numbers[i];
      cout << cur->prev->num << endl;
      
      cur->prev->prev->next = cur;
      cur->prev = cur->prev->prev;
    }
  }
  
  return 0;
}

