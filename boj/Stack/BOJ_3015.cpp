/*
 백준 3015 오아시스 재결합
 22.07.09
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

ll n, answer;
stack<pair<ll, ll> > st;

int main() {
  ios::sync_with_stdio(0); cin.tie(0);

  cin >> n;

  ll now;
  while (n-->0) {
    cin >> now;

    ll cnt = 1;

    while (!st.empty() && st.top().first <= now) {
      if (st.top().first == now) {
        cnt = st.top().second + 1;
      } else {
        cnt = 1;
      }

      answer += st.top().second;
      st.pop();
    }

    if (!st.empty()) ++answer;

    st.push({now, cnt});
  }

  cout << answer << endl;

  return 0;
}

