#include <iostream>
#include <queue>

using namespace std;

typedef long long ll;
int n;
ll x, y;

const ll MOD = 20171109;

int main(int argc, char** argv) {
  cin.tie(0)->sync_with_stdio(0);
  
  int test_case;
  int T;
  //freopen("input.txt", "r", stdin);
  cin >> T;
  for(test_case = 1; test_case <= T; ++test_case) {
    cin >> n >> x;
    
    priority_queue <ll> maxHeap, minHeap;
    ll answer = 0;
    
    maxHeap.push(x);
    
    for (int i = 0; i < n; ++i) {
      cin >> x >> y;
      
      if (x < y) {
        maxHeap.push(x);
        minHeap.push(-y);
      } else {
        maxHeap.push(y);
        minHeap.push(-x);
      }
      
      while (-minHeap.top() < maxHeap.top()) {
        ll temp = maxHeap.top();
        maxHeap.pop();
        maxHeap.push(-minHeap.top());
        minHeap.pop();
        minHeap.push(-temp);
      }
      
      answer += maxHeap.top();
      answer %= MOD;
    }
    
    cout << "#" << test_case << " " << answer << "\n";
  }
  return 0;
}
