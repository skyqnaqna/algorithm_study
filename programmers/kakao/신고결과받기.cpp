/*
 프로그래머스 신고 결과 받기
 22.02.16
 */
#include <iostream>
#include <string>
#include <vector>
#include <unordered_map>
#include <set>
#include <algorithm>
#include <sstream>

using namespace std;

unordered_map <string, int> nameIdx;
vector <set<string> > reportList(1000, set<string>());
vector <int> reportedCnt(1000, 0);

vector <string> split(string str, char separator) {
  vector <string> res;
  istringstream iss(str);
  string buffer;
  
  while (getline(iss, buffer, separator)) {
    res.push_back(buffer);
  }
  
  return res;
}

vector<int> solution(vector<string> id_list, vector<string> report, int k) {
  vector<int> answer;
  vector <string> splited;
  
  for (int i = 0; i < id_list.size(); ++i) nameIdx[id_list[i]] = i;
  
  for (auto &str : report) {
    splited = split(str, ' ');
    
    if (reportList[nameIdx[splited[0]]].find(splited[1]) == reportList[nameIdx[splited[0]]].end()) {
      reportList[nameIdx[splited[0]]].insert(splited[1]);
      reportedCnt[nameIdx[splited[1]]] += 1;
    }
  }
  
  for (int i = 0; i < id_list.size(); ++i) {
    int cnt = 0;
    for (auto &name : reportList[i]) {
      if (reportedCnt[nameIdx[name]] >= k) ++cnt;
    }
    
    answer.push_back(cnt);
  }
  
  return answer;
}

int main() {
  
  vector <string> arg1 = {"muzi", "frodo", "apeach", "neo"},
  arg2 = {"muzi frodo","apeach frodo","frodo neo","muzi neo","apeach muzi"};
  vector <int> res = solution(arg1, arg2, 2);
  
  for (auto &it : res) cout << it << " ";
  
  return 0;
}
