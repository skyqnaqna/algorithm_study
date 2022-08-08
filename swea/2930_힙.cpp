#include<iostream>

using namespace std;

const int MAX = int(1e5);

int heap[MAX];
int n, size;

void heapPush(int num) {
  heap[size] = num;
  int cur = size;
  
  while (cur > 0 && heap[(cur - 1) / 2] < heap[cur]) {
    int temp = heap[(cur - 1) / 2];
    heap[(cur - 1) / 2] = heap[cur];
    heap[cur--] = temp;
    cur >>= 1;
  }
  
  ++size;
}

int heapPop() {
  int res = heap[0];
  --size;
  heap[0] = heap[size];
  int cur = 0;
  
  while (cur * 2 + 1 < size) {
    int child, l = cur * 2 + 1, r = cur * 2 + 2;
    
    if (r == size) child = l;
    else child = heap[l] > heap[r] ? l : r;
    
    if (heap[child] < heap[cur]) break;
    
    int temp = heap[child];
    heap[child] = heap[cur];
    heap[cur] = temp;
    cur = child;
  }
  
  return res;
}

int main(int argc, char** argv) {
  cin.tie(0)->sync_with_stdio(0);
  
  int test_case;
  int T;
  //freopen("input.txt", "r", stdin);
  cin>>T;
  for(test_case = 1; test_case <= T; ++test_case) {
    cin >> n;
    size = 0;
    
    int op, x;
    cout << "#" << test_case << " ";
    
    for (int i = 0; i < n; ++i) {
      cin >> op;
      
      if (op == 1) {
        cin >> x;
        heapPush(x);
      } else {
        if (size > 0) {
          cout << heapPop() << " ";
        } else {
          cout << -1 << " ";
        }
      }
    }
    cout << "\n";
  }
  return 0;
}
