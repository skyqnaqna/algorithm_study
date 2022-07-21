#include<iostream>

using namespace std;

const int MAX = 2000;

struct Node {
  int data;
  Node* next = nullptr;
  
  Node* myAlloc(int data, Node* prev) {
    this->data = data;
    this->next = prev->next;
    return this;
  }
} nodes[MAX];

int nodeCnt;
Node head, tail;

void init() {
  nodeCnt = 0;
  head.next = &tail;
}

Node* getNode(int &x) {
  Node* ptr = &head;
  
  for (int i = 0; i < x; ++i) {
    if (ptr->next == &tail) break;
    ptr = ptr->next;
  }
  
  return ptr;
}

void insertNode(int &x, int &y) {
  Node* ptr = getNode(x);
  ptr->next = nodes[nodeCnt++].myAlloc(y, ptr);
}

void deleteNode(int &x) {
  Node* ptr = getNode(x);
  if (ptr->next == &tail) return;
  ptr->next = ptr->next->next;
}

void changeData(int &x, int &y) {
  Node* ptr = getNode(x);
  if (ptr->next == &tail) return;
  ptr->next->data = y;
}

int getAnswer(int &l) {
  Node* ptr = &head;
  for (int i = 0; i < l; ++i) {
    if (ptr->next == &tail) return -1;
    ptr = ptr->next;
  }
  
  return ptr->next->data;
}

int n, m, l, x, y;
int main(int argc, char** argv) {
  ios_base::sync_with_stdio(0); cin.tie(0);
  int test_case;
  int T;
//  freopen("input.txt", "r", stdin);
  cin>>T;
  
  for(test_case = 1; test_case <= T; ++test_case) {
    
    init();
    cin >> n >> m >> l;
    
    Node* ptr = &head;
    int data;
    for (int i = 0; i < n; ++i) {
      cin >> data;
      ptr->next = nodes[nodeCnt++].myAlloc(data, ptr);
      ptr = ptr->next;
    }
    
    char op;
    for (int i = 0; i < m; ++i) {
      cin >> op;
      if (op == 'I') {
        cin >> x >> y;
        insertNode(x, y);
      } else if (op == 'D') {
        cin >> x;
        deleteNode(x);
      } else {
        cin >> x >> y;
        changeData(x, y);
      }
    }
    
    cout << "#" << test_case << " " << getAnswer(l) << "\n";
  }
  return 0;//정상종료시 반드시 0을 리턴해야합니다.
}
