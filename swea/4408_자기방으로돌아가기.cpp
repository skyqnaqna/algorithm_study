#include <iostream>
#include <algorithm>
#include <cstring>
#include <vector>

using namespace std;

// MARK: - 누적 합 풀이

int n, answer, l, r;
int prefixSum[202];

int main(int argc, char** argv) {
  ios_base::sync_with_stdio(0); cin.tie(0);
  int test_case;
  int T;
  //freopen("input.txt", "r", stdin);
  cin>>T;
  for(test_case = 1; test_case <= T; ++test_case) {
    
    cin >> n;
    memset(prefixSum, 0, sizeof(prefixSum));
    
    for (int i = 0; i < n; ++i) {
      cin >> l >> r;
      
      if (l & 1) ++l;
      if (r & 1) ++r;
      l >>= 1;
      r >>= 1;
      
      prefixSum[min(l, r)]++;
      prefixSum[max(l, r) + 1]--;
    }
    
    answer = prefixSum[0];
    for (int i = 1; i < 202; ++i) {
      prefixSum[i] += prefixSum[i - 1];
      answer = max(answer, prefixSum[i]);
    }
    
    cout << "#" << test_case << " " << answer << "\n";
  }
  return 0;//정상종료시 반드시 0을 리턴해야합니다.
}

// MARK: - 정렬을 이용한 풀이

//int n, l, r, answer;
//
//bool cmp(pair<int, int> a, pair<int, int> b) {
//  if (a.first == b.first) return a.second < b.second;
//  return a.first < b.first;
//}
//
//int main(int argc, char** argv) {
//  ios_base::sync_with_stdio(0); cin.tie(0);
//  int test_case;
//  int T;
//  //freopen("input.txt", "r", stdin);
//  cin>>T;
//  for(test_case = 1; test_case <= T; ++test_case) {
//
//    cin >> n;
//    answer = 0;
//    vector <pair <int, int> > info;
//
//    for (int i = 0; i < n; ++i) {
//      cin >> l >> r;
//      if (l % 2 == 0) --l;
//      if (r % 2 == 0) --r;
//      info.push_back({min(l, r), max(l, r)});
//    }
//
//    sort(info.begin(), info.end(), cmp);
//
//    vector <pair<int, int> > willRemove;
//    vector <pair<int ,int> > remains;
//    while (!info.empty()) {
//      ++answer;
//      willRemove.clear();
//      remains.clear();
//      willRemove.push_back(info.front());
//
//      for (int i = 1; i < info.size(); ++i) {
//        bool overlap = false;
//
//        for (int j = 0; j < willRemove.size(); ++j) {
//          if (info[i].first <= willRemove[j].second && info[i].second >= willRemove[j].first) {
//            overlap = true;
//            break;
//          }
//        }
//
//        if (overlap) {
//          remains.push_back(info[i]);
//        } else {
//          willRemove.push_back(info[i]);
//        }
//      }
//
//      info = remains;
//    }
//
//    cout << "#" << test_case << " " << answer << "\n";
//  }
//  return 0;//정상종료시 반드시 0을 리턴해야합니다.
//}
