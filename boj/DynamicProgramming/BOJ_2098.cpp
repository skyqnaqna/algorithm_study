/*
 백준 2098 외판원 순회
 22.01.25
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

const int MAX = 16;

int n, answer, graph[MAX][MAX], dp[MAX][1<<MAX];

int traveling(int now, int visited) {
  if (dp[now][visited] != -1) return dp[now][visited];
  
  if (visited == (1 << n) - 1) {
    if (graph[now][0] == 0) return INF;
    else return graph[now][0];
  }
  
  dp[now][visited] = INF;
  
  for (int i = 0; i < n; ++i) {
    if (visited & (1 << i) || graph[now][i] == 0) continue;
    
    dp[now][visited] = min(dp[now][visited], graph[now][i] + traveling(i, visited | (1 << i)));
    
  }
  
  return dp[now][visited];
}

int main() {
  ios::sync_with_stdio(0); cin.tie(0);
  
  input();
  
  cin >> n;
  
  for (int i = 0; i < n; ++i) {
    for (int j = 0; j < n; ++j) {
      cin >> graph[i][j];
    }
  }
  
  fill(&dp[0][0], &dp[MAX - 1][1<<MAX], -1);
  
  cout << traveling(0, 1 << 0) << endl;
  
  return 0;
}

