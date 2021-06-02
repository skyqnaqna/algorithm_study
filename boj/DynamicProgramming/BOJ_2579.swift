/*
 백준 2579 계단 오르기
 21.06.02
 https://github.com/skyqnaqna/algorithm_study
 */

import Foundation

let n = Int(readLine()!)!
var dp = [[Int]](repeating: [Int](repeating: 0, count: 2), count: n + 1)
var stair = [Int](repeating: 0, count: n + 1)

for i in 1...n {
  stair[i] = Int(readLine()!)!
}

if n == 1 {
  print(stair[1])
} else {
  dp[1][0] = stair[1]
  dp[1][1] = stair[1]

  for i in 2...n {
    dp[i][0] = stair[i] + dp[i - 1][1]
    dp[i][1] = stair[i] + max(dp[i - 2][0], dp[i - 2][1])
  }

  print(max(dp[n][0], dp[n][1]))
}
