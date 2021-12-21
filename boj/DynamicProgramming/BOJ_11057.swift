/*
 백준 11057 오르막 수
 21.12.21
 https://github.com/skyqnaqna/algorithm_study
 */

import Foundation

let n = Int(readLine()!)!
let MOD = 10007

var dp = [[Int]](repeating: [Int](repeating: 0, count: 10), count: n + 1)

for i in 0 ..< 10 {
  dp[0][i] = 1
}

for i in 1 ... n {
  dp[i][0] = 1
  for j in 1 ..< 10 {
    dp[i][j] = (dp[i][j - 1] + dp[i - 1][j]) % MOD
  }
}

print(dp[n][9])
