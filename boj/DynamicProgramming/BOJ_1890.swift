/*
 백준 1890 점프
 21.06.16
 https://github.com/skyqnaqna/algorithm_study
 */

import Foundation

let n = Int(readLine()!)!

var graph = [[Int]](repeating: [Int](), count: n)
var dp = [[Int]](repeating: [Int](repeating: 0, count: n), count: n)

for i in 0..<n {
  graph[i] = readLine()!.split(separator: " ").map{ Int(String($0))! }
}

dp[0][0] = 1

for i in 0..<n {
  for j in 0..<n {
    guard let jump = graph[i][j] > 0 ? graph[i][j] : nil else {
      continue
    }

    if i + jump < n {
      dp[i + jump][j] += dp[i][j]
    }

    if j + jump < n {
      dp[i][j + jump] += dp[i][j]
    }
  }
}

print(dp[n-1][n-1])

