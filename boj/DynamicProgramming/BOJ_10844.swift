/*
 21.10.08
 백준 10844 쉬운 계단 수
 https://github.com/skyqnaqna/algorithm_study
 */

import Foundation

let M = Int(1e9)
var dp = [[Int]](repeating: [Int](repeating: 0, count: 101), count: 10)

for i in 0 ... 9 {
  dp[i][1] = 1
}


for k in 2 ... 100 {
  for i in 0 ... 9 {
    if i == 0 {
      dp[i][k] = dp[i + 1][k - 1] % M
      continue
    }
    
    if i == 9 {
      dp[i][k] = dp[i - 1][k - 1] % M
      continue
    }
    
    dp[i][k] = (dp[i - 1][k - 1] + dp[i + 1][k - 1]) % M
  }
}

let n = Int(readLine()!)!

var ans = 0

for i in 1 ... 9 {
  ans += dp[i][n] % M
}

print(ans % M)
