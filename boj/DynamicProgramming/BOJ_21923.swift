/*
 백준 21923 곡예 비행
 22.03.03
 https://github.com/skyqnaqna/algorithm_study
 */

import Foundation

let input = readLine()!.split(separator: " ").map { Int(String($0))! }

let n = input[0], m = input[1]
var graph = [[Int]]()
var dp = [[[Int]]](repeating: [[Int]](repeating: [Int](repeating: 0, count: m), count: n), count: 2)

for _ in 0 ..< n {
  graph.append(readLine()!.split(separator: " ").map{ Int(String($0))! })
}

dp[0][n - 1][0] = graph[n - 1][0]
dp[1][n - 1][m - 1] = graph[n - 1][m - 1]
for i in stride(from: n - 2, through: 0, by: -1) {
  dp[0][i][0] = graph[i][0] + dp[0][i + 1][0]
  dp[1][i][m - 1] = graph[i][m - 1] + dp[1][i + 1][m - 1]
}

for j in 1 ..< m {
  dp[0][n - 1][j] = graph[n - 1][j] + dp[0][n - 1][j - 1]
}

for j in stride(from: m - 2, through: 0, by: -1) {
  dp[1][n - 1][j] = graph[n - 1][j] + dp[1][n - 1][j + 1]
}

for j in 1 ..< m {
  for i in stride(from: n - 2, through: 0, by: -1) {
    dp[0][i][j] = max(dp[0][i + 1][j], dp[0][i][j - 1]) + graph[i][j]
  }
}

for j in stride(from: m - 2, through: 0, by: -1) {
  for i in stride(from: n - 2, through: 0, by: -1) {
    dp[1][i][j] = max(dp[1][i + 1][j], dp[1][i][j + 1]) + graph[i][j]
  }
}

var answer = -Int(1e9)

for i in 0 ..< n {
  for j in 0 ..< m {
    answer = max(answer, dp[0][i][j] + dp[1][i][j])
  }
}

print(answer)
