#include<iostream>

using namespace std;

const int MAX = 1000000;

struct Node {
  int data;
  Node* next;
  Node* prev;
  
  Node* myAlloc(int data, Node* prev) {
    this->data = data;
    this->next = prev->next;
    prev->next->prev = this;
    this->prev = prev;
    return this;
  }
} nodes[MAX];

int nodeCnt;
Node head, tail;

void init() {
  head.next = &tail;
  tail.prev = &head;
  nodeCnt = 0;
}

// x번째 노드 반환
Node* getNode(int x) {
  Node* ptr = &head;
  for (int i = 0; i < x; ++i) {
    if (ptr->next == &tail) break;
    ptr = ptr->next;
  }
  
  return ptr;
}

void insertNodes(int x, int y) {
  Node* ptr = getNode(x);
  
  int data;
  for (int i = 0; i < y; ++i) {
    cin >> data;
    ptr->next = nodes[nodeCnt++].myAlloc(data, ptr);
    ptr = ptr->next;
  }
}

void deleteNodes(int x, int y) {
  Node* l = getNode(x);
  Node* r = l;
  
  for (int i = 0; i < y; ++i) {
    if (r->next == &tail) break;
    r = r->next;
  }
  
  l->next = r->next;
  r->prev = l;
}

void appendNodes(int y) {
  Node* ptr = tail.prev;
  
  int data;
  for (int i = 0; i < y; ++i) {
    cin >> data;
    ptr->next = nodes[nodeCnt++].myAlloc(data, ptr);
    ptr = ptr->next;
  }
}

int n, m;

int main(int argc, char** argv) {
  ios_base::sync_with_stdio(0); cin.tie(0);
  int test_case;
//  freopen("input.txt", "r", stdin);
  
  for(test_case = 1; test_case <= 10; ++test_case) {
    
    init();
    cin >> n;
    
    int data;
    Node* ptr = &head;
    for (int i = 0; i < n; ++i) {
      cin >> data;
      ptr->next = nodes[nodeCnt++].myAlloc(data, ptr);
      ptr = ptr->next;
    }
    
    cin >> m;
    
    char op;
    int x, y;
    for (int i = 0; i < m; ++i) {
      cin >> op;
      
      switch (op) {
        case 'I':
          cin >> x >> y;
          insertNodes(x, y);
          break;
        case 'D':
          cin >> x >> y;
          deleteNodes(x, y);
          break;
        case 'A':
          cin >> y;
          appendNodes(y);
          break;
      }
    }
    
    cout << "#" << test_case << " ";
    
    ptr = &head;
    for (int i = 0; i < 10; ++i) {
      if (ptr->next == &tail) break;
      cout << ptr->next->data << " ";
      ptr = ptr->next;
    }
    cout << "\n";

  }
  return 0;//정상종료시 반드시 0을 리턴해야합니다.
}
