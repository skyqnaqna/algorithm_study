/*
 프로그래머스 더 맵게
 22.03.24
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

priority_queue<int>pq;

int solution(vector<int> scoville, int K) {
  int answer = 0;
  
  for (auto &food : scoville) pq.push(-food);
  
  while (-pq.top() < K) {
    if (pq.size() < 2) return -1;
    
    int a = -pq.top(); pq.pop();
    int b = -pq.top(); pq.pop();
    pq.push({-(a + b * 2)});
    ++answer;
  }
  
  return answer;
}

