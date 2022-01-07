/*
 백준 1107 리모컨
 22.01.07
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

const int MAX = 1000001;
int n, m, answer;
//set <int> buttons;
bool buttons[10];

int checkValid(int num, int cnt) {
  int numLen = 0;
  int digit = num;
  
  if (digit == 0) {
    if (!buttons[0]) return 1 + cnt;
    else return -1;
  }
  
  while (digit) {
    if (!buttons[digit % 10]) {
      digit /= 10;
      ++numLen;
    } else {
      return -1;
    }
  }
  
  return numLen + cnt;
}

int main() {
  ios::sync_with_stdio(0); cin.tie(0);
  
  cin >> n >> m;
  
  answer = abs(n - 100);
  
  for (int i = 0; i < m; ++i) {
    int a; cin >> a;
    buttons[a] = true;
  }
  
  int res = checkValid(n, 0);
  if (res > 0) answer = min(answer ,res);
  else {
    int i = 1, num = n + 1;
    while (num < MAX) {
      res = checkValid(num, i);
      
      if (res > 0) {
        answer = min(answer, res);
        break;
      }
      ++num;
      ++i;
    }
    
    i = 1; num = n - 1;
    while (num >= 0) {
      res = checkValid(num, i);
      
      if (res > 0) {
        answer = min(answer, res);
        break;
      }
      --num;
      ++i;
    }
  }
  
  cout << answer << endl;

  return 0;
}
