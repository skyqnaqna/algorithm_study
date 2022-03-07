/*
 백준 5670 휴대폰 자판
 22.03.07
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

const int MAX = 26;
const int NODE_MAX = int(8e5) + 1;

int n;
ll answer;

typedef struct Trie {
  int cnt; // 노드 번호
  int node[NODE_MAX][MAX];
  int childCnt[NODE_MAX];
  bool isEnd[NODE_MAX];
  
  void init() {
    cnt = 1;
    memset(node, 0, sizeof(node));
    memset(childCnt, 0, sizeof(childCnt));
    memset(isEnd, false, sizeof(isEnd));
  }
  
  void insert(char* str) {
    int now = 0;
    for (int i = 0; str[i] != '\0'; ++i) {
      int next = str[i] - 'a';
      if (node[now][next] == 0) {
        node[now][next] = cnt++;
        ++childCnt[now];
      }
      
      now = node[now][next];
    }
    isEnd[now] = true;
  }
  
  void dfs(int now, ll clickCnt) {
    if (isEnd[now]) answer += clickCnt;
    
    for (int i = 0; i < MAX; ++i) {
      if (node[now][i] == 0) continue;
      
      int next = node[now][i];
      if (now == 0 || childCnt[now] > 1 || isEnd[now]) dfs(next, clickCnt + 1);
      else dfs(next, clickCnt);
    }
  }
  
} trie;

trie root;

int main() {
//  ios::sync_with_stdio(0); cin.tie(0);
  
  while (scanf("%d", &n) != EOF) {
    
    root.init();
    answer = 0;
    
    char word[81];
    for (int i = 0; i < n; ++i) {
      scanf("%s", word);
      root.insert(word);
    }
    
    root.dfs(0, 0);
    printf("%.2f\n", round((dd(answer) / dd(n)) * 100) / 100);
  }
  
  return 0;
}
