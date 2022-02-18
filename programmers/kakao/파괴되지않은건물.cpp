/*
 프로그래머스 파괴되지 않은 건물
 22.02.18
 */

#include <string>
#include <vector>

using namespace std;

int n, m;
vector <vector <int> > prefixSum(1001, vector <int> (1001, 0));

int solution(vector<vector<int>> board, vector<vector<int>> skill) {
  int answer = 0;
  n = board.size(); m = board[0].size();
  
  int type, r1, c1, r2, c2, degree;
  for (auto &it : skill) {
    type = it[0], r1 = it[1], c1 = it[2], r2 = it[3], c2 = it[4], degree = it[5];
    
    if (type == 1) degree = -degree;
    
    prefixSum[r1][c1] += degree;
    prefixSum[r1][c2 + 1] -= degree;
    prefixSum[r2 + 1][c1] -= degree;
    prefixSum[r2 + 1][c2 + 1] += degree;
  }
  
  if (board[0][0] + prefixSum[0][0] > 0) ++answer;
  
  for (int j = 1; j < m; ++j) {
    prefixSum[0][j] += prefixSum[0][j - 1];
    if (board[0][j] + prefixSum[0][j] > 0) ++answer;
  }
  
  for (int i = 1; i < n; ++i) {
    prefixSum[i][0] += prefixSum[i - 1][0];
    if (board[i][0] + prefixSum[i][0] > 0) ++answer;
  }
  
  for (int i = 1; i < n; ++i) {
    for (int j = 1; j < m; ++j) {
      prefixSum[i][j] += prefixSum[i - 1][j] + prefixSum[i][j - 1] - prefixSum[i - 1][j - 1];
      if (board[i][j] + prefixSum[i][j] > 0) ++answer;
    }
  }
  
  return answer;
}
