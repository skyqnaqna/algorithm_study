/*
 21.10.11
 백준 11048 이동하기
 https://github.com/skyqnaqna/algorithm_study
 */

import Foundation

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let n = input[0], m = input[1]

var graph = [[Int]](repeating: [Int](), count: n)
var dp = [[Int]](repeating: [Int](repeating: 0, count: m + 1), count: n + 1)

for i in 0 ..< n {
  graph[i] = readLine()!.split(separator: " ").map { Int(String($0))! }
}

for i in 1 ... n {
  for j in 1 ... m {
    dp[i][j] = max(dp[i-1][j-1], max(dp[i][j-1], dp[i-1][j])) + graph[i-1][j-1]
  }
}

print(dp[n][m])
